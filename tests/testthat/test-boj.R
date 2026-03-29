test_that("boj_data input validation works", {
  expect_error(boj_data(1L, "FXERD01"))
  expect_error(boj_data(TRUE, "FXERD01"))
  expect_error(boj_data(NULL, "FXERD01"))
  expect_error(boj_data(NA, "FXERD01"))
  # code
  expect_error(boj_data("FM08", 1L))
  expect_error(boj_data("FM08", TRUE))
  expect_error(boj_data("FM08", NULL))
  # start_date
  expect_error(boj_data("FM08", "FXERD01", start_date = TRUE))
  expect_error(boj_data("FM08", "FXERD01", start_date = c("a", "b")))
  # end_date
  expect_error(boj_data("FM08", "FXERD01", end_date = TRUE))
  expect_error(boj_data("FM08", "FXERD01", end_date = c("a", "b")))
  # lang
  expect_error(boj_data("FM08", "FXERD01", lang = "fr"))
})

test_that("parse_boj_data works", {
  json <- jsonlite::fromJSON(test_path("fixtures", "boj-data.json"), simplifyVector = FALSE)
  actual <- parse_boj_data(json)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_true(all(c("date", "key", "value", "freq") %in% names(actual)))
  expect_true("FXERD01" %in% actual$key)
  expect_identical(unique(actual$freq), "daily")
})

test_that("parse_boj_data handles empty response", {
  json <- list(RESULTSET = list())
  actual <- parse_boj_data(json)
  expect_data_table(actual, nrows = 0L)
  expect_true(all(c("date", "key", "value") %in% names(actual)))
})

test_that("boj_metadata input validation works", {
  expect_error(boj_metadata(1L))
  expect_error(boj_metadata(TRUE))
  expect_error(boj_metadata(NULL))
  expect_error(boj_metadata(NA))
  expect_error(boj_metadata("FM08", lang = "fr"))
})

test_that("parse_boj_metadata works", {
  json <- jsonlite::fromJSON(test_path("fixtures", "boj-metadata.json"), simplifyVector = FALSE)
  actual <- parse_boj_metadata(json)
  expect_data_table(actual, min.rows = 1L)
  expect_true(all(c("code", "name", "unit", "frequency", "category") %in% names(actual)))
  expect_true("FXERD01" %in% actual$code)
  expect_false(any(actual$code == ""))
})

test_that("parse_boj_metadata handles empty response", {
  json <- list(RESULTSET = list())
  actual <- parse_boj_metadata(json)
  expect_data_table(actual, nrows = 0L)
})

test_that("parse_boj_date handles different frequencies", {
  expect_equal(parse_boj_date(20250115, "daily"), as.Date("2025-01-15"))
  expect_equal(parse_boj_date(202501, "monthly"), as.Date("2025-01-01"))
  expect_equal(parse_boj_date(202501, "quarterly"), as.Date("2025-01-01"))
  expect_equal(parse_boj_date(202503, "quarterly"), as.Date("2025-07-01"))
  expect_equal(parse_boj_date(2025, "annual"), 2025L)
})

test_that("boj_freq maps correctly", {
  expect_identical(boj_freq("daily"), "daily")
  expect_identical(boj_freq("monthly"), "monthly")
  expect_identical(boj_freq("quarterly"), "quarterly")
  expect_identical(boj_freq("annual"), "annual")
  expect_identical(boj_freq("annual(mar)"), "annual")
  expect_identical(boj_freq("semiannual"), "semi-annual")
  expect_identical(boj_freq("weekly(monday)"), "weekly")
})

test_that("assert_boj_date works", {
  expect_silent(assert_boj_date(NULL))
  expect_silent(assert_boj_date("202501"))
  expect_silent(assert_boj_date("2025"))
  expect_silent(assert_boj_date(2025L))
  expect_error(assert_boj_date(TRUE))
  expect_error(assert_boj_date("abc"))
  expect_error(assert_boj_date(c("a", "b")))
})
