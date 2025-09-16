test_that("ecb_fx_rates works", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  expect_error(ecb_fx_rates("monthly"))
  expect_error(ecb_fx_rates(NA))
  expect_error(ecb_fx_rates(""))

  x <- ecb_fx_rates("latest")
  expect_data_table(x, nrows = 30L, ncols = 3L)
  expect_named(x, c("date", "currency", "rate"))
  expect_date(x$date)
  expect_character(x$currency)
  expect_double(x$rate)

  x <- ecb_fx_rates("history")
  expect_data_table(x, min.rows = 31L)
  expect_named(x, c("date", "currency", "rate"))
  expect_date(x$date)
  expect_character(x$currency)
  expect_double(x$rate)
})
