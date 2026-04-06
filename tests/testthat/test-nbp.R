test_that("nbp_fx_rates input validation works", {
  expect_error(nbp_fx_rates("d"))
  expect_error(nbp_fx_rates("a", code = 1L))
  expect_error(nbp_fx_rates("a", start_date = ""))
  expect_error(nbp_fx_rates("a", last_n = -1L))
  expect_error(nbp_fx_rates("a", start_date = "2025-01-01", last_n = 5L), "mutually exclusive")
})

test_that("nbp_gold input validation works", {
  expect_error(nbp_gold(start_date = ""))
  expect_error(nbp_gold(last_n = -1L))
  expect_error(nbp_gold(start_date = "2025-01-01", last_n = 5L), "mutually exclusive")
})

test_that("parse_nbp_fx_rates works for single currency", {
  json <- readRDS(test_path("fixtures", "nbp-fx-rates.rds"))
  actual <- parse_nbp_fx_rates(json, "a", "eur")
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("date", "code", "currency", "mid"))
  expect_date(actual$date)
})

test_that("parse_nbp_fx_rates works for table", {
  json <- readRDS(test_path("fixtures", "nbp-fx-table.rds"))
  actual <- parse_nbp_fx_rates(json, "a", NULL)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("date", "code", "currency", "mid"))
})

test_that("parse_nbp_fx_rates works for bid/ask", {
  json <- readRDS(test_path("fixtures", "nbp-fx-rates-c.rds"))
  actual <- parse_nbp_fx_rates(json, "c", "eur")
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("date", "code", "currency", "bid", "ask"))
})

test_that("parse_nbp_gold works", {
  json <- readRDS(test_path("fixtures", "nbp-gold.rds"))
  actual <- parse_nbp_gold(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("date", "price"))
  expect_date(actual$date)
})
