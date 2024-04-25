test_that("bb_data input validation works", {
  # flow should be a character(1) with 5 <= nchar <= 8
  expect_error(bb_data(1L, "abc"))
  expect_error(bb_data(TRUE, "abc"))
  expect_error(bb_data(NULL, "abc"))
  expect_error(bb_data(c("a", "b"), "abc"))
  expect_error(bb_data("a", "abc"))
  expect_error(bb_data("abcd", "abc"))
  # key should be a character(1)
  expect_error(bb_data("abcde", 1L))
  expect_error(bb_data("abcde", TRUE))
  expect_error(bb_data("abcde", NULL))
  expect_error(bb_data("abcde", c("a", "b")))
  # start_period should be a character(1) or NULL
  expect_error(bb_data("abcde", "abc", start_period = 1L))
  expect_error(bb_data("abcde", "abc", start_period = TRUE))
  expect_error(bb_data("abcde", "abc", start_period = c("a", "b")))
  # end_period should be a character(1) or NULL
  expect_error(bb_data("abcde", "abc", TRUE))
  expect_error(bb_data("abcde", "abc", end_period = 1L))
  expect_error(bb_data("abcde", "abc", end_period = c("a", "b")))
  # first_n should be a whole number or NULL
  expect_error(bb_data("abcde", "abc", first_n = "abc"))
  expect_error(bb_data("abcde", "abc", first_n = 1:2))
  expect_error(bb_data("abcde", "abc", first_n = TRUE))
  expect_error(bb_data("abcde", "abc", first_n = 1.5))
  expect_error(bb_data("abcde", "abc", first_n = -1L))
  expect_error(bb_data("abcde", "abc", first_n = 0L))
  # last_n should be a whole number or NULL
  expect_error(bb_data("abcde", "abc", last_n = "abc"))
  expect_error(bb_data("abcde", "abc", last_n = TRUE))
  expect_error(bb_data("abcde", "abc", last_n = 1:2))
  expect_error(bb_data("abcde", "abc", last_n = 1.5))
  expect_error(bb_data("abcde", "abc", last_n = -1L))
  expect_error(bb_data("abcde", "abc", last_n = 0L))
})

test_that("parse_bb_data works", {
  body <- xml2::read_xml(test_path("fixtures", "bb-data.xml"))
  actual <- parse_bb_data(body, "BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A")
  nms <- c(
    "date", "value", "key", "title", "frequency", "category", "unit", "unit_multiplier"
  )
  expect_s3_class(actual, "data.frame")
  expect_named(actual, nms)
  expect_gt(nrow(actual), 0)
  expect_identical(
    unique(actual$key), "BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A"
  )
  expect_s3_class(actual$date, "Date")
})

test_that("parse_bb_series works", {
  body <- readRDS(test_path("fixtures", "bb-series.rds"))
  actual <- parse_bb_series(
    body, "BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A"
  )
  nms <- c(
    "date", "value", "key", "title", "frequency", "category", "unit", "unit_multiplier",
    "last_update", "source", "comment"
  )
  expect_s3_class(actual, "data.frame")
  expect_named(actual, nms)
  expect_gt(nrow(actual), 0)
  expect_identical(
    unique(actual$key), "BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A"
  )
  expect_s3_class(actual$date, "Date")
})

test_that("bb_series input validation works", {
  expect_error(bb_series(1L))
  expect_error(bb_series(character(0L)))
  expect_error(bb_series(NA))
  expect_error(bb_series())
  expect_error(bb_series(NULL))
  expect_error(bb_series(c("BBEX3.M.DKK.EUR.BB.AC.A01", "BBEX3.M.DKK.EUR.BB.AC.A02")))
})

test_that("metadata input validation works", {
  # type should be one of datastructure, dataflow, codelist, concept
  expect_error(bb_metadata(1L))
  expect_error(bb_metadata(TRUE))
  expect_error(bb_metadata(c("datastructure", "dataflow")))
  expect_error(bb_metadata("data"))
  # id should be a character(1) or NULL
  expect_error(bb_metadata("datastructure", id = 1L))
  expect_error(bb_metadata("datastructure", id = TRUE))
  expect_error(bb_metadata("datastructure", id = c("a", "b")))
  # lang shoula be en or de
  expect_error(bb_metadata(lang = "abc"))
  expect_error(bb_metadata(lang = 1L))
  expect_error(bb_metadata(lang = NA))
})

test_that("bb_series does frequency conversion", {
  skip_on_cran()
  skip_on_ci()

  x <- bb_series("BBEX3.M.DKK.EUR.BB.AC.A01")
  expect_true(all(x$frequency == "monthly"))
  x <- bb_series("BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B")
  expect_true(all(x$frequency == "quarterly"))
  x <- bb_series("BBBK11.D.TTA000")
  expect_true(all(x$frequency == "daily"))
})
