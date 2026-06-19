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

test_that("nbp_fx_rates builds path with ISO date strings", {
  local_mocked_bindings(nbp = function(path) path)
  local_mocked_bindings(parse_nbp_fx_rates = function(json, table, code) json)
  expect_equal(
    nbp_fx_rates("a", "usd", "2024-01-01", "2024-01-31"),
    "exchangerates/rates/a/usd/2024-01-01/2024-01-31"
  )
  expect_equal(
    nbp_fx_rates("a", "usd", last_n = 10L),
    "exchangerates/rates/a/usd/last/10"
  )
})

test_that("nbp_gold builds path with ISO date strings", {
  local_mocked_bindings(nbp = function(path) path)
  local_mocked_bindings(parse_nbp_gold = function(json) json)
  expect_equal(
    nbp_gold("2024-01-01", "2024-01-31"),
    "cenyzlota/2024-01-01/2024-01-31"
  )
})

test_that("parse_nbp_fx_rates works for single currency", {
  json = readRDS(test_path("fixtures", "nbp-fx-rates.rds"))
  actual = parse_nbp_fx_rates(json, "a", "eur")
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("date", "code", "currency", "mid"))
  expect_date(actual$date)
})

test_that("parse_nbp_fx_rates works for table", {
  json = readRDS(test_path("fixtures", "nbp-fx-table.rds"))
  actual = parse_nbp_fx_rates(json, "a", NULL)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("date", "code", "currency", "mid"))
})

test_that("parse_nbp_fx_rates works for bid/ask", {
  json = readRDS(test_path("fixtures", "nbp-fx-rates-c.rds"))
  actual = parse_nbp_fx_rates(json, "c", "eur")
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("date", "code", "currency", "bid", "ask"))
})

test_that("parse_nbp_gold works", {
  json = readRDS(test_path("fixtures", "nbp-gold.rds"))
  actual = parse_nbp_gold(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("date", "price"))
  expect_date(actual$date)
})
