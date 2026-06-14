test_that("banxico_data input validation works", {
  expect_error(banxico_data(1L))
  expect_error(banxico_data(NA))
  expect_error(banxico_data(character()))
  expect_error(banxico_data("SF43718", start_date = TRUE))
  expect_error(banxico_data("SF43718", end_date = TRUE))
})

test_that("banxico_data requires both or neither date", {
  expect_snapshot(error = TRUE, {
    banxico_data("SF43718", start_date = "2024-01-01", api_key = "dummy")
    banxico_data("SF43718", end_date = "2024-01-31", api_key = "dummy")
  })
})

test_that("parse_banxico_data works", {
  json = jsonlite::fromJSON(test_path("fixtures", "banxico-data.json"), simplifyVector = FALSE)
  actual = parse_banxico_data(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_names(names(actual), permutation.of = c("date", "key", "value"))
  expect_identical(unique(actual$key), "SF43718")
})

test_that("parse_banxico_data handles empty response", {
  actual = parse_banxico_data(list(bmx = list(series = list())))
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), permutation.of = c("date", "key", "value"))
})

test_that("banxico_metadata input validation works", {
  expect_error(banxico_metadata(1L))
  expect_error(banxico_metadata(NA))
  expect_error(banxico_metadata(character()))
})

test_that("parse_banxico_metadata works", {
  json = jsonlite::fromJSON(test_path("fixtures", "banxico-metadata.json"), simplifyVector = FALSE)
  actual = parse_banxico_metadata(json)
  expect_data_table(actual, nrows = 1L)
  expect_names(names(actual), permutation.of = c("id", "title", "freq", "unit", "start", "end"))
  expect_identical(actual$id, "SF43718")
  expect_identical(actual$freq, "daily")
  expect_date(actual$start)
  expect_no_match(actual$title, "  ")
})

test_that("parse_banxico_metadata handles empty response", {
  actual = parse_banxico_metadata(list(bmx = list(series = list())))
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), permutation.of = c("id", "title", "freq", "unit", "start", "end"))
})

test_that("banxico_freq maps known and unknown codes", {
  expect_identical(banxico_freq(c("Diaria", "Mensual", "Anual")), c("daily", "monthly", "annual"))
  expect_identical(banxico_freq("Otra"), "Otra")
})

test_that("banxico_as_numeric coerces N/E to NA", {
  expect_identical(banxico_as_numeric(c("17.01", "N/E", "1,234.5")), c(17.01, NA, 1234.5))
})
