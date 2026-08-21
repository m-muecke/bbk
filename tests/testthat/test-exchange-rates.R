test_that("parse_ecb_fx_date parses both file layouts", {
  expect_identical(
    parse_ecb_fx_date(c("2026-07-29", "2026-07-28")),
    as.Date(c("2026-07-29", "2026-07-28"))
  )
  expect_identical(parse_ecb_fx_date("29 July 2026"), as.Date("2026-07-29"))
})

test_that("parse_ecb_fx_date does not depend on the session locale", {
  old = Sys.getlocale("LC_TIME")
  on.exit(Sys.setlocale("LC_TIME", old), add = TRUE)
  skip_if(
    !nzchar(suppressWarnings(Sys.setlocale("LC_TIME", "de_DE.UTF-8"))),
    "no German locale available"
  )
  expect_identical(parse_ecb_fx_date("29 July 2026"), as.Date("2026-07-29"))
  expect_identical(Sys.getlocale("LC_TIME"), "de_DE.UTF-8")
})

test_that("boc_fx_rates returns an empty table when there are no rates", {
  httr2::local_mocked_responses(function(req) {
    httr2::response(
      200L,
      headers = "content-type: application/json",
      body = charToRaw('{"ForeignExchangeRates":[]}')
    )
  })
  actual = boc_fx_rates(start_date = "2030-01-01", end_date = "2030-01-02")
  expect_data_table(actual, nrows = 0L)
  expect_names(
    names(actual),
    must.include = c("rate", "from_currency", "to_currency")
  )
  expect_posixct(actual$exchange_rate_effective_timestamp)
})

test_that("ecb_fx_rates works", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  expect_error(ecb_fx_rates("monthly"))
  expect_error(ecb_fx_rates(NA))
  expect_error(ecb_fx_rates(""))

  x = ecb_fx_rates("latest")
  expect_data_table(x, min.rows = 1L, ncols = 3L)
  expect_named(x, c("date", "currency", "rate"))
  expect_date(x$date)
  expect_character(x$currency)
  expect_double(x$rate)

  x = ecb_fx_rates("history")
  expect_data_table(x, min.rows = 31L)
  expect_named(x, c("date", "currency", "rate"))
  expect_date(x$date)
  expect_character(x$currency)
  expect_double(x$rate)
})
