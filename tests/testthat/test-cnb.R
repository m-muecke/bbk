test_that("cnb_fx_rates input validation works", {
  expect_error(cnb_fx_rates(date = ""))
  expect_error(cnb_fx_rates(year = -1L))
  expect_error(cnb_fx_rates(lang = "DE"))
  expect_error(cnb_fx_rates(date = "2024-01-01", year = 2024L), "mutually exclusive")
})

test_that("cnb_pribor input validation works", {
  expect_error(cnb_pribor(date = ""))
  expect_error(cnb_pribor(year = -1L))
  expect_error(cnb_pribor(date = "2024-01-01", year = 2024L), "mutually exclusive")
})

test_that("cnb_czeonia input validation works", {
  expect_error(cnb_czeonia(date = ""))
  expect_error(cnb_czeonia(year = -1L))
  expect_error(cnb_czeonia(date = "2024-01-01", year = 2024L), "mutually exclusive")
})

test_that("cnb_fx_other_rates input validation works", {
  expect_error(cnb_fx_other_rates(year_month = "2024"))
  expect_error(cnb_fx_other_rates(year = -1L))
  expect_error(cnb_fx_other_rates(lang = "DE"))
  expect_error(cnb_fx_other_rates(year_month = "2024-01", year = 2024L), "mutually exclusive")
})

test_that("parse_cnb_czeonia works", {
  json = list(
    rates = list(
      list(rate = 6.5, validFor = "2024-01-02", volumeInCZKmio = 100L),
      list(rate = 6.4, validFor = "2024-01-03", volumeInCZKmio = 120L)
    )
  )
  actual = parse_cnb_czeonia(json)
  expect_names(names(actual), identical.to = c("date", "czeonia", "volume"))
  expect_date(actual$date)
  expect_identical(actual$czeonia, c(6.5, 6.4))
})

test_that("parse_cnb_czeonia handles a single daily record", {
  json = list(czeoniaDaily = list(rate = 6.5, validFor = "2024-01-02", volumeInCZKmio = 100L))
  actual = parse_cnb_czeonia(json)
  expect_identical(nrow(actual), 1L)
  expect_identical(actual$czeonia, 6.5)
})

test_that("parse_cnb_fx_rates works", {
  json = readRDS(test_path("fixtures", "cnb-fx-rates.rds"))
  actual = parse_cnb_fx_rates(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(
    names(actual),
    identical.to = c("date", "currency_code", "currency", "country", "amount", "rate")
  )
  expect_date(actual$date)
  expect_double(actual$rate)
})

test_that("parse_cnb_fx_rates handles no rates", {
  actual = parse_cnb_fx_rates(list(rates = list()))
  expect_data_table(actual, nrows = 0L)
  expect_names(
    names(actual),
    identical.to = c("date", "currency_code", "currency", "country", "amount", "rate")
  )
  expect_date(actual$date)
})

test_that("parse_cnb_pribor works", {
  json = readRDS(test_path("fixtures", "cnb-pribor.rds"))
  actual = parse_cnb_pribor(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), identical.to = c("date", "period", "pribor"))
  expect_date(actual$date)
  expect_double(actual$pribor)
})

test_that("cnb_data input validation works", {
  expect_error(cnb_data(api_key = "x"), "Exactly one")
  expect_error(cnb_data("a", set_id = "b", api_key = "x"), "Exactly one")
  expect_error(cnb_data("a", api_key = ""))
  expect_error(cnb_data("a", start_period = "", api_key = "x"))
})

test_that("cnb_indicators input validation works", {
  expect_error(cnb_indicators(api_key = "x"), "Exactly one")
  expect_error(cnb_indicators(set_id = "a", base_id = "b", api_key = "x"), "Exactly one")
  expect_error(cnb_indicators(set_id = "a", lang = "de", api_key = "x"))
  expect_error(cnb_indicators(set_id = "a", api_key = ""))
})

test_that("cnb_snapshots input validation works", {
  expect_error(cnb_snapshots(lang = "de", api_key = "x"))
  expect_error(cnb_snapshots(api_key = ""))
})

test_that("parse_cnb_data works", {
  dt = readRDS(test_path("fixtures", "cnb-arad-data.rds"))
  actual = parse_cnb_data(dt)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), identical.to = c("date", "indicator_id", "snapshot_id", "value"))
  expect_date(actual$date)
  expect_character(actual$indicator_id, any.missing = FALSE)
  expect_double(actual$value)
})

test_that("parse_cnb_data parses values and snapshot ids", {
  dt = data.table(
    indicator_id = c("X", "X", "X"),
    snapshot_id = c("NULL", "", "29"),
    period = c("20230131", "20230228", "20230331"),
    value = c("1 234,56", "2,5", "-3,0")
  )
  actual = parse_cnb_data(dt)
  expect_equal(actual$date, as.Date(c("2023-01-31", "2023-02-28", "2023-03-31")))
  expect_equal(actual$value, c(1234.56, 2.5, -3))
  expect_equal(actual$snapshot_id, c(NA_character_, NA_character_, "29"))
})

test_that("parse_cnb_data handles empty input", {
  empty = data.table(
    indicator_id = character(),
    snapshot_id = character(),
    period = character(),
    value = character()
  )
  actual = parse_cnb_data(empty)
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), identical.to = c("date", "indicator_id", "snapshot_id", "value"))
  expect_date(actual$date)
  expect_double(actual$value)
})

test_that("parse_cnb_dimension coerces dim_rank", {
  dt = readRDS(test_path("fixtures", "cnb-arad-dimension.rds"))
  actual = parse_cnb_dimension(dt)
  expect_data_table(actual, min.rows = 1L)
  expect_integer(actual$dim_rank, any.missing = FALSE)
})
