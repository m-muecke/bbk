test_that("bdp_data input validation works", {
  expect_error(bdp_data("a", "b"))
  expect_error(bdp_data(1L, 123L))
  expect_error(bdp_data(1L, "b", series_ids = "abc"))
  expect_error(bdp_data(1L, "b", start_date = ""))
  expect_error(bdp_data(1L, "b", end_date = 1L))
  expect_error(bdp_data(1L, "b", lang = "FR"))
  expect_error(bdp_data(1L, "b", updated_after = 1L))
  expect_error(bdp_data(1L, "b", updated_after = TRUE))
  expect_error(bdp_data(1L, "b", updated_after = NA))
})

test_that("bdp_data passes updated_after as obs_published_since", {
  captured = NULL
  httr2::local_mocked_responses(function(req) {
    captured <<- req
    httr2::response(200L, headers = "content-type: application/json", body = charToRaw("{}"))
  })
  local_mocked_bindings(parse_bdp_data = function(json) data.table())
  bdp_data(54L, "ce3e", updated_after = as.Date("2024-06-01"))
  expect_match(captured$url, "obs_published_since=2024-06-01T00%3A00%3A00Z")
})

test_that("bdp_data follows next_page and keeps every series", {
  page = function(ids, values, next_page = NULL) {
    extension = list(
      series = lapply(ids, \(i) {
        list(
          id = i,
          label = paste0("s", i),
          dimension_category = list(list(dimension_id = 7L, category_id = i))
        )
      })
    )
    if (!is.null(next_page)) {
      extension$next_page = next_page
    }
    body = list(
      id = list("7", "reference_date"),
      size = list(length(ids), 2L),
      role = list(time = list("reference_date")),
      dimension = list(
        `7` = list(category = list(index = as.list(as.character(ids)))),
        reference_date = list(category = list(index = list("2020-01-01", "2020-02-01")))
      ),
      value = as.list(values),
      extension = extension
    )
    httr2::response(
      200L,
      headers = "content-type: application/json",
      body = charToRaw(jsonlite::toJSON(body, auto_unbox = TRUE, null = "null"))
    )
  }

  n = 0L
  httr2::local_mocked_responses(function(req) {
    n <<- n + 1L
    if (n == 1L) {
      page(c(1L, 2L), c(10, 11, 20, 21), next_page = "https://bpstat.bportugal.pt/data/v1/x?page=2")
    } else {
      page(c(3L, 4L), c(30, 31, 40, 41))
    }
  })

  actual = bdp_data(54L, "abc")
  expect_identical(n, 2L)
  expect_identical(sort(unique(actual$key)), 1:4)
  expect_identical(actual$value, c(10, 11, 20, 21, 30, 31, 40, 41))
})

test_that("bdp_series input validation works", {
  expect_error(bdp_series("abc"))
  expect_error(bdp_series(NULL))
  expect_error(bdp_series(1L, lang = "FR"))
})

test_that("bdp_dataset input validation works", {
  expect_error(bdp_dataset("a"))
  expect_error(bdp_dataset(1L, lang = "FR"))
})

test_that("bdp_dimension input validation works", {
  expect_error(bdp_dimension("a"))
  expect_error(bdp_dimension(1L, dimension_id = "a"))
  expect_error(bdp_dimension(1L, lang = "FR"))
})

test_that("bdp_domain input validation works", {
  expect_error(bdp_domain("a"))
  expect_error(bdp_domain(lang = "FR"))
})

test_that("parse_bdp_data works", {
  json = readRDS(test_path("fixtures", "bdp-data.rds"))
  actual = parse_bdp_data(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_names(names(actual), must.include = c("date", "value", "freq"))
})

test_that("parse_bdp_data keeps missing observations as NA instead of collapsing", {
  json = list(
    id = list("reference_date"),
    size = list(3L),
    role = list(time = list("reference_date")),
    dimension = list(
      reference_date = list(category = list(index = list("2020-01-01", "2020-02-01", "2020-03-01")))
    ),
    value = list(1.5, NULL, 2.0),
    status = list("F", "M", "F"),
    extension = list(series = list(list(id = 1L, label = "s1")))
  )
  actual = parse_bdp_data(json)
  expect_identical(actual$value, c(1.5, NA, 2.0))
  expect_identical(actual$date, as.Date(c("2020-01-01", "2020-02-01", "2020-03-01")))
})

test_that("parse_bdp_data maps sparse values onto the right series and date", {
  json = readRDS(test_path("fixtures", "bdp-data-multi.rds"))
  # the response is a sparse JSON-stat object whose `extension$series` order
  # differs from the order of the value array
  expect_false(is.null(names(json$value)))
  actual = parse_bdp_data(json)

  expect_data_table(actual, nrows = 3L * 346L)
  expect_date(actual$date)
  expect_identical(sort(unique(actual$key)), c(12558817L, 12558819L, 12558825L))
  expect_identical(uniqueN(actual, by = c("key", "date")), nrow(actual))

  # ground truth taken from one single-series request per series
  first = actual[actual[, .I[1L], by = key]$V1]
  expect_identical(first$date, rep(as.Date("1997-09-30"), 3L))
  expect_identical(first$key, c(12558817L, 12558819L, 12558825L))
  expect_identical(first$value, c(-68, 62011, 778))
})

test_that("bdp_cell_values matches sparse keys at or above 1e5 without scientific notation", {
  # cell offsets are doubles; as.character(1e5) would be "1e+05" and miss the key
  x = list(`100000` = 1.5, `3` = 2.5)
  expect_identical(bdp_cell_values(x, c(100000, 3), "numeric"), c(1.5, 2.5))
})

test_that("parse_bdp_data handles a dense value array", {
  json = list(
    id = list("7", "reference_date"),
    size = list(2L, 3L),
    role = list(time = list("reference_date")),
    dimension = list(
      `7` = list(category = list(index = list("20", "10"))),
      reference_date = list(category = list(index = list("2020-01-01", "2020-02-01", "2020-03-01")))
    ),
    value = list(1, 2, 3, 4, 5, 6),
    extension = list(
      series = list(
        list(
          id = 1L,
          label = "s1",
          dimension_category = list(list(dimension_id = 7L, category_id = 10L))
        ),
        list(
          id = 2L,
          label = "s2",
          dimension_category = list(list(dimension_id = 7L, category_id = 20L))
        )
      )
    )
  )
  actual = parse_bdp_data(json)
  # category "20" comes first in the index, so the first block belongs to series 2
  expect_identical(actual$key, c(rep(1L, 3L), rep(2L, 3L)))
  expect_identical(actual$value, c(4, 5, 6, 1, 2, 3))
})

test_that("parse_bdp_data returns a typed empty table when the window has no observations", {
  empty = parse_bdp_data(list(
    id = list("reference_date"),
    size = list(0L),
    role = list(time = list("reference_date")),
    dimension = list(reference_date = list(category = list(index = list()))),
    value = list(),
    extension = list(series = list())
  ))
  expect_data_table(empty, nrows = 0L)
  expect_date(empty$date)
  expect_names(names(empty), must.include = c("date", "key", "value", "freq"))
})

test_that("bdp_freq detects the observation frequency", {
  expect_identical(bdp_freq(c("2024-01-05", "2024-01-08", "2024-01-09")), "daily")
  expect_identical(bdp_freq(c("2024-01-01", "2024-01-08", "2024-01-15")), "weekly")
  expect_identical(bdp_freq(c("2024-01-01", "2024-01-16", "2024-02-01")), "biweekly")
  expect_identical(bdp_freq(c("2024-01-01", "2024-02-01", "2024-03-01")), "monthly")
  expect_identical(bdp_freq(c("2024-01-01", "2024-04-01", "2024-07-01")), "quarterly")
  expect_identical(bdp_freq(c("2024-01-01", "2024-07-01", "2025-01-01")), "semi-annual")
  expect_identical(bdp_freq(c("2023-12-31", "2024-12-31")), "annual")
  expect_identical(bdp_freq("2024-01-01"), NA_character_)
  expect_identical(bdp_freq(character()), NA_character_)
})

test_that("parse_bdp_series works", {
  json = readRDS(test_path("fixtures", "bdp-series.rds"))
  actual = parse_bdp_series(json)
  expect_data_table(actual, nrows = 1L)
  expect_names(
    names(actual),
    must.include = c("id", "label", "dataset_id", "domain_id")
  )
  expect_identical(actual$id, 12518356L)
})

test_that("parse_bdp_dataset works", {
  json = readRDS(test_path("fixtures", "bdp-dataset.rds"))
  actual = parse_bdp_dataset(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(
    names(actual),
    must.include = c("id", "label", "num_series", "obs_updated_at")
  )
})

test_that("parse_bdp_dimension works", {
  items = readRDS(test_path("fixtures", "bdp-dimension.rds"))
  actual = parse_bdp_dimension(items)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("id", "label", "description"))
})

test_that("parse_bdp_category works", {
  json = readRDS(test_path("fixtures", "bdp-category.rds"))
  actual = parse_bdp_category(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("id", "label"))
})

test_that("parse_bdp_domain works", {
  json = readRDS(test_path("fixtures", "bdp-domains.rds"))
  actual = parse_bdp_domain(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(
    names(actual),
    must.include = c("id", "label", "has_series", "num_series")
  )
})
