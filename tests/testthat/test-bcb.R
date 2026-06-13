test_that("bcb_data input validation works", {
  expect_error(bcb_data("a"))
  expect_error(bcb_data(TRUE))
  expect_error(bcb_data(NULL))
  expect_error(bcb_data(NA))
  expect_error(bcb_data(-1))
  expect_error(bcb_data(c(1, 2)))
  # start_date
  expect_error(bcb_data(1, start_date = TRUE))
  expect_error(bcb_data(1, start_date = c("a", "b")))
  # end_date
  expect_error(bcb_data(1, end_date = TRUE))
  expect_error(bcb_data(1, end_date = c("a", "b")))
})

test_that("parse_bcb_data works", {
  json = jsonlite::fromJSON(test_path("fixtures", "bcb-data.json"), simplifyVector = FALSE)
  actual = parse_bcb_data(json, 1L)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_names(names(actual), permutation.of = c("date", "key", "value"))
  expect_identical(unique(actual$key), "1")
})

test_that("parse_bcb_data handles empty response", {
  actual = parse_bcb_data(list(), 1L)
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), permutation.of = c("date", "key", "value"))
})

test_that("bcb_fx_rates input validation works", {
  expect_error(bcb_fx_rates(1L, "2024-01-01"))
  expect_error(bcb_fx_rates(NA, "2024-01-01"))
  expect_error(bcb_fx_rates(character(), "2024-01-01"))
  expect_error(bcb_fx_rates("US", "2024-01-01"))
  expect_error(bcb_fx_rates("USD", NULL))
  expect_error(bcb_fx_rates("USD", "2024-01-01", end_date = TRUE))
})

test_that("parse_bcb_fx_rates works", {
  json = jsonlite::fromJSON(test_path("fixtures", "bcb-fx-rates.json"), simplifyVector = FALSE)
  actual = parse_bcb_fx_rates(json, "USD")
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$bid)
  expect_numeric(actual$ask)
  expect_names(names(actual), permutation.of = c("date", "currency", "bid", "ask"))
  expect_identical(unique(actual$currency), "USD")
})

test_that("parse_bcb_fx_rates handles empty response", {
  actual = parse_bcb_fx_rates(list(value = list()), "USD")
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), permutation.of = c("date", "currency", "bid", "ask"))
})

test_that("parse_bcb_currencies works", {
  json = jsonlite::fromJSON(test_path("fixtures", "bcb-currencies.json"), simplifyVector = FALSE)
  actual = parse_bcb_currencies(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), permutation.of = c("code", "name", "type"))
  expect_true("USD" %in% actual$code)
})
