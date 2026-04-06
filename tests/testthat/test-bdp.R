test_that("bdp_data input validation works", {
  expect_error(bdp_data("a", "b"))
  expect_error(bdp_data(1L, 123L))
  expect_error(bdp_data(1L, "b", series_ids = "abc"))
  expect_error(bdp_data(1L, "b", start_date = ""))
  expect_error(bdp_data(1L, "b", end_date = 1L))
  expect_error(bdp_data(1L, "b", lang = "FR"))
})

test_that("bdp_series input validation works", {
  expect_error(bdp_series("abc"))
  expect_error(bdp_series(NULL))
  expect_error(bdp_series(1L, lang = "FR"))
})

test_that("bdp_domains input validation works", {
  expect_error(bdp_domains(lang = "FR"))
})

test_that("parse_bdp_data works", {
  json <- readRDS(test_path("fixtures", "bdp-data.rds"))
  actual <- parse_bdp_data(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_names(names(actual), must.include = c("date", "value", "freq"))
})

test_that("parse_bdp_series works", {
  json <- readRDS(test_path("fixtures", "bdp-series.rds"))
  actual <- parse_bdp_series(json)
  expect_data_table(actual, nrows = 1L)
  expect_names(
    names(actual),
    must.include = c("id", "label", "dataset_id", "domain_id")
  )
  expect_identical(actual$id, 12518356L)
})

test_that("parse_bdp_domains works", {
  json <- readRDS(test_path("fixtures", "bdp-domains.rds"))
  actual <- parse_bdp_domains(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(
    names(actual),
    must.include = c("id", "label", "has_series", "num_series")
  )
})
