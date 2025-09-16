test_that("boe_data input validation works", {
  expect_error(boe_data(c("id1", "id2")))
  expect_error(boe_data(123L))
  expect_error(boe_data(NULL))
  expect_error(boe_data(NA))
  # start_date should be a valid date
  expect_error(eob_data("abc", ""))
  expect_error(eob_data("abc", 1L))
  expect_error(eob_data("abc", "2020"))
  expect_error(eob_data("abc", end_date = ""))
  expect_error(eob_data("abc", end_date = 1L))
  expect_error(eob_data("abc", end_date = "2020"))
})

test_that("parse_boe_data() works", {
  body <- xml2::read_xml(test_path("fixtures", "boe-data.xml"))
  actual <- parse_boe_data(body)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
})
