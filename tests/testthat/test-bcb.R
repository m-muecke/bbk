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

test_that("bcb_expectations input validation works", {
  expect_error(bcb_expectations("yearly"))
  expect_error(bcb_expectations(1L))
  expect_error(bcb_expectations("annual", indicator = 1L))
  expect_error(bcb_expectations("annual", start_date = TRUE))
  expect_error(bcb_expectations("annual", end_date = TRUE))
})

test_that("parse_bcb_expectations works", {
  json = jsonlite::fromJSON(test_path("fixtures", "bcb-expectations.json"), simplifyVector = FALSE)
  actual = parse_bcb_expectations(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$mean)
  expect_integer(actual$respondents)
  expect_names(
    names(actual),
    permutation.of = c(
      "date",
      "indicator",
      "detail",
      "reference",
      "mean",
      "median",
      "sd",
      "min",
      "max",
      "respondents",
      "base"
    )
  )
  expect_identical(unique(actual$indicator), "IPCA")
})

test_that("parse_bcb_expectations handles empty response", {
  actual = parse_bcb_expectations(list(value = list()))
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), must.include = c("date", "indicator", "mean"))
})

test_that("bcb_top5 input validation works", {
  expect_error(bcb_top5("yearly"))
  expect_error(bcb_top5(1L))
  expect_error(bcb_top5("annual", indicator = 1L))
  expect_error(bcb_top5("annual", start_date = TRUE))
  expect_error(bcb_top5("annual", end_date = TRUE))
})

test_that("parse_bcb_top5 works", {
  json = jsonlite::fromJSON(test_path("fixtures", "bcb-top5.json"), simplifyVector = FALSE)
  actual = parse_bcb_top5(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$mean)
  expect_names(
    names(actual),
    permutation.of = c(
      "date",
      "indicator",
      "type_calc",
      "reference",
      "mean",
      "median",
      "sd",
      "min",
      "max"
    )
  )
  expect_identical(unique(actual$indicator), "IPCA")
})

test_that("parse_bcb_top5 handles the Selic resource's lower-case schema", {
  json = jsonlite::fromJSON(test_path("fixtures", "bcb-top5-selic.json"), simplifyVector = FALSE)
  actual = parse_bcb_top5(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$mean)
  expect_identical(unique(actual$indicator), "Selic")
  expect_match(actual$reference, "^R[0-9]+/[0-9]{4}$")
})

test_that("parse_bcb_top5 handles empty response", {
  actual = parse_bcb_top5(list(value = list()))
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), must.include = c("date", "indicator", "mean"))
})

test_that("bcb_inflation input validation works", {
  expect_error(bcb_inflation("36m"))
  expect_error(bcb_inflation(1L))
  expect_error(bcb_inflation("12m", indicator = 1L))
  expect_error(bcb_inflation("12m", start_date = TRUE))
  expect_error(bcb_inflation("12m", end_date = TRUE))
})

test_that("parse_bcb_inflation works", {
  json = jsonlite::fromJSON(test_path("fixtures", "bcb-inflation.json"), simplifyVector = FALSE)
  actual = parse_bcb_inflation(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_logical(actual$smoothed)
  expect_integer(actual$respondents)
  expect_names(
    names(actual),
    permutation.of = c(
      "date",
      "indicator",
      "smoothed",
      "mean",
      "median",
      "sd",
      "min",
      "max",
      "respondents",
      "base"
    )
  )
  expect_identical(unique(actual$indicator), "IPCA")
})

test_that("parse_bcb_inflation handles empty response", {
  actual = parse_bcb_inflation(list(value = list()))
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), must.include = c("date", "indicator", "smoothed"))
})

test_that("bcb_selic input validation works", {
  expect_error(bcb_selic(start_date = TRUE))
  expect_error(bcb_selic(end_date = TRUE))
})

test_that("parse_bcb_selic works", {
  json = jsonlite::fromJSON(test_path("fixtures", "bcb-selic.json"), simplifyVector = FALSE)
  actual = parse_bcb_selic(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_character(actual$meeting)
  expect_integer(actual$respondents)
  expect_names(
    names(actual),
    permutation.of = c(
      "date",
      "meeting",
      "mean",
      "median",
      "sd",
      "min",
      "max",
      "respondents",
      "base"
    )
  )
})

test_that("parse_bcb_selic handles empty response", {
  actual = parse_bcb_selic(list(value = list()))
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), must.include = c("date", "meeting", "mean"))
})
