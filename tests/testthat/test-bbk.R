test_that("bbk_data input validation works", {
  # flow should be a character(1) with 5 <= nchar <= 8
  expect_error(bbk_data(1L, "abc"))
  expect_error(bbk_data(TRUE, "abc"))
  expect_error(bbk_data(NULL, "abc"))
  expect_error(bbk_data(c("a", "b"), "abc"))
  expect_error(bbk_data("a", "abc"))
  expect_error(bbk_data("abcd", "abc"))
  # key should be a character()
  expect_error(bbk_data("abcde", 1L))
  expect_error(bbk_data("abcde", TRUE))
  expect_error(bbk_data("abcde", NULL))
  # start_period should be a character(1) or NULL
  expect_error(bbk_data("abcde", "abc", start_period = 1L))
  expect_error(bbk_data("abcde", "abc", start_period = TRUE))
  expect_error(bbk_data("abcde", "abc", start_period = c("a", "b")))
  # end_period should be a character(1) or NULL
  expect_error(bbk_data("abcde", "abc", TRUE))
  expect_error(bbk_data("abcde", "abc", end_period = 1L))
  expect_error(bbk_data("abcde", "abc", end_period = c("a", "b")))
  # first_n should be a whole number or NULL
  expect_error(bbk_data("abcde", "abc", first_n = "abc"))
  expect_error(bbk_data("abcde", "abc", first_n = 1:2))
  expect_error(bbk_data("abcde", "abc", first_n = TRUE))
  expect_error(bbk_data("abcde", "abc", first_n = 1.5))
  expect_error(bbk_data("abcde", "abc", first_n = -1L))
  expect_error(bbk_data("abcde", "abc", first_n = 0L))
  # last_n should be a whole number or NULL
  expect_error(bbk_data("abcde", "abc", last_n = "abc"))
  expect_error(bbk_data("abcde", "abc", last_n = TRUE))
  expect_error(bbk_data("abcde", "abc", last_n = 1:2))
  expect_error(bbk_data("abcde", "abc", last_n = 1.5))
  expect_error(bbk_data("abcde", "abc", last_n = -1L))
  expect_error(bbk_data("abcde", "abc", last_n = 0L))
})

test_that("parse_bbk_data works", {
  body <- xml2::read_xml(test_path("fixtures", "bbk-data.xml"))
  actual <- parse_bbk_data(body)
  expect_s3_class(actual, "data.frame")
  expect_gt(nrow(actual), 0L)
  expect_identical(
    unique(actual$key), "BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A"
  )
  expect_s3_class(actual$date, "Date")
})

test_that("parse_bbk_series works", {
  body <- readRDS(test_path("fixtures", "bbk-series.rds"))
  actual <- parse_bbk_series(
    body, "BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A"
  )
  nms <- c(
    "date", "key", "value", "title", "freq", "category", "unit", "unit_mult",
    "last_update", "comment", "source"
  )
  expect_s3_class(actual, "data.frame")
  expect_named(actual, nms)
  expect_gt(nrow(actual), 0L)
  expect_identical(
    unique(actual$key), "BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A"
  )
  expect_s3_class(actual$date, "Date")
})

test_that("bbk_series input validation works", {
  expect_error(bbk_series(1L))
  expect_error(bbk_series(character(0L)))
  expect_error(bbk_series(NA))
  expect_error(bbk_series())
  expect_error(bbk_series(NULL))
  expect_error(bbk_series(c("BBEX3.M.DKK.EUR.BB.AC.A01", "BBEX3.M.DKK.EUR.BB.AC.A02")))
})

test_that("metadata input validation works", {
  # type should be one of datastructure, dataflow, codelist, concept
  expect_error(bbk_metadata(1L))
  expect_error(bbk_metadata(TRUE))
  expect_error(bbk_metadata(c("datastructure", "dataflow")))
  expect_error(bbk_metadata("data"))
  # id should be a character(1) or NULL
  expect_error(bbk_metadata("datastructure", id = 1L))
  expect_error(bbk_metadata("datastructure", id = TRUE))
  expect_error(bbk_metadata("datastructure", id = c("a", "b")))
  # lang shoula be en or de
  expect_error(bbk_metadata(lang = "abc"))
  expect_error(bbk_metadata(lang = 1L))
  expect_error(bbk_metadata(lang = NA))
})

test_that("bbk_series does frequency conversion", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  x <- bbk_series("BBEX3.M.DKK.EUR.BB.AC.A01")
  expect_true(all(x$freq == "monthly"))
  x <- bbk_series("BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B")
  expect_true(all(x$freq == "quarterly"))
  x <- bbk_series("BBBK11.D.TTA000")
  expect_true(all(x$freq == "daily"))
})
