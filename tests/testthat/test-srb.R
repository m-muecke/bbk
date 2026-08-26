test_that("srb_data input validation works", {
  expect_error(srb_data(1L))
  expect_error(srb_data(TRUE))
  expect_error(srb_data(NULL))
  expect_error(srb_data(NA))
  expect_error(srb_data(c("a", "b")))
  # start_date
  expect_error(srb_data("SEKUSDPMI", start_date = TRUE))
  expect_error(srb_data("SEKUSDPMI", start_date = c("a", "b")))
  # end_date
  expect_error(srb_data("SEKUSDPMI", end_date = TRUE))
  expect_error(srb_data("SEKUSDPMI", end_date = c("a", "b")))
})

test_that("parse_srb_data works", {
  json = jsonlite::fromJSON(test_path("fixtures", "srb-data.json"), simplifyVector = FALSE)
  actual = parse_srb_data(json, "SEKUSDPMI")
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_true(all(c("date", "key", "value") %in% names(actual)))
})

test_that("parse_srb_data handles empty response", {
  actual = parse_srb_data(list(), "SEKUSDPMI")
  expect_data_table(actual, nrows = 0L)
  expect_true(all(c("date", "key", "value") %in% names(actual)))
})

test_that("srb_data returns an empty table when the API answers 204 No Content", {
  httr2::local_mocked_responses(function(req) httr2::response(204L))
  actual = srb_data("SEKUSDPMI", start_date = "2024-01-06", end_date = "2024-01-07")
  expect_data_table(actual, nrows = 0L)
  expect_true(all(c("date", "key", "value") %in% names(actual)))
})

test_that("srb_cross_rates input validation works", {
  expect_error(srb_cross_rates(1L, "b", "2024-01-01"))
  expect_error(srb_cross_rates("a", 1L, "2024-01-01"))
  expect_error(srb_cross_rates("a", "b", NULL))
  expect_error(srb_cross_rates("a", "b", "2024-01-01", end_date = TRUE))
})

test_that("srb_cross_rates works", {
  json = readRDS(test_path("fixtures", "srb-crossrates.rds"))
  actual = parse_srb_data(json, "SEKUSDPMI/SEKEURPMI")
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_identical(unique(actual$key), "SEKUSDPMI/SEKEURPMI")
})

test_that("srb_calendar input validation works", {
  expect_error(srb_calendar(1L))
  expect_error(srb_calendar(NULL))
  expect_error(srb_calendar("2024-01-01", end_date = TRUE))
})

test_that("parse_srb_calendar works", {
  json = readRDS(test_path("fixtures", "srb-calendar.rds"))
  actual = parse_srb_calendar(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$calendar_date)
  expect_logical(actual$swedish_bankday)
  expect_names(names(actual), must.include = c("calendar_date", "swedish_bankday", "week_number"))
})

test_that("parse_srb_calendar handles empty response", {
  actual = parse_srb_calendar(list())
  expect_data_table(actual, nrows = 0L)
  expect_date(actual$calendar_date)
  expect_names(names(actual), must.include = c("calendar_date", "swedish_bankday", "week_number"))
})

test_that("srb_series input validation works", {
  expect_error(srb_series(1L))
  expect_error(srb_series("invalid"))
})

test_that("parse_srb_series works", {
  json = jsonlite::fromJSON(test_path("fixtures", "srb-series.json"), simplifyVector = FALSE)
  actual = parse_srb_series(json)
  expect_data_table(actual, min.rows = 1L)
  expect_true(all(c("series_id", "source", "long_description") %in% names(actual)))
  expect_true("SEKUSDPMI" %in% actual$series_id)
})

test_that("parse_srb_groups handles a single root group and nested children", {
  json = list(
    groupId = 1L,
    name = "Interest rates and exchange rates",
    description = "",
    childGroups = list(
      list(groupId = 11L, name = "Exchange rates", description = "d", childGroups = list()),
      list(groupId = 137L, name = "Riksbank interest rates", description = "e")
    )
  )
  actual = parse_srb_groups(json)
  expect_data_table(actual, nrows = 3L)
  expect_identical(actual$group_id, c(1L, 11L, 137L))
  expect_identical(actual$name[[2L]], "Exchange rates")
})

test_that("parse_srb_groups works", {
  json = jsonlite::fromJSON(test_path("fixtures", "srb-groups.json"), simplifyVector = FALSE)
  actual = parse_srb_groups(json)
  expect_data_table(actual, min.rows = 1L)
  expect_true(all(c("group_id", "name") %in% names(actual)))
})
