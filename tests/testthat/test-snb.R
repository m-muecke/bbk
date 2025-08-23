test_that("snb_data input validation works", {
  expect_error(snb_data(c("id1", "id2")))
  expect_error(snb_data(123L))
  expect_error(snb_data(NULL))
  expect_error(snb_data(NA))
  # start_date should be a valid date
  expect_error(snb_data("abc", ""))
  expect_error(snb_data("abc", 1L))
  expect_error(snb_data("abc", "2020"))
  expect_error(snb_data("abc", end_date = ""))
  expect_error(snb_data("abc", end_date = 1L))
  expect_error(snb_data("abc", end_date = "2020"))
  # lang should be one of "en", "de"
  expect_error(snb_data("abc", lang = "fr"))
})

test_that("parse_snb_data() works", {
  body <- readRDS(test_path("fixtures", "snb-data.rds"))
  actual <- parse_snb_data(body)
  expect_data_table(actual)
  expect_gt(nrow(actual), 0L)
  expect_match(actual$key, "^EPB@SNB.rendopar")
  expect_date(actual$date)
})
