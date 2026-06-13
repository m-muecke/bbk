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
