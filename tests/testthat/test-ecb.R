test_that("ecb_data input validation works", {
  # flow should be a character(1)
  expect_error(ecb_data(1L, "D.USD.EUR.SP00.A"))
  expect_error(ecb_data(TRUE, "D.USD.EUR.SP00.A"))
  expect_error(ecb_data(NULL, "D.USD.EUR.SP00.A"))
  expect_error(ecb_data(NA, "D.USD.EUR.SP00.A"))
  expect_error(ecb_data(c("EXR", "EXR"), "D.USD.EUR.SP00.A"))
  # key should be a character() or NULL
  expect_error(ecb_data("EXR", 1L))
  expect_error(ecb_data("EXR", TRUE))
  expect_error(ecb_data("EXR", NA))
  expect_error(ecb_data("EXR", c("D.USD.EUR.SP00.A", "D.USD.EUR.SP00.A")))
  # start_period should be a character(1) or NULL
  expect_error(ecb_data("abcde", "abc", start_period = 1L))
  expect_error(ecb_data("abcde", "abc", start_period = TRUE))
  expect_error(ecb_data("abcde", "abc", start_period = c("a", "b")))
  # end_period should be a character(1) or NULL
  expect_error(ecb_data("abcde", "abc", TRUE))
  expect_error(ecb_data("abcde", "abc", end_period = 1L))
  expect_error(ecb_data("abcde", "abc", end_period = c("a", "b")))
  # first_n should be a whole number or NULL
  expect_error(ecb_data("abcde", "abc", first_n = "abc"))
  expect_error(ecb_data("abcde", "abc", first_n = 1:2))
  expect_error(ecb_data("abcde", "abc", first_n = TRUE))
  expect_error(ecb_data("abcde", "abc", first_n = 1.5))
  expect_error(ecb_data("abcde", "abc", first_n = -1L))
  expect_error(ecb_data("abcde", "abc", first_n = 0L))
  # last_n should be a whole number or NULL
  expect_error(ecb_data("abcde", "abc", last_n = "abc"))
  expect_error(ecb_data("abcde", "abc", last_n = TRUE))
  expect_error(ecb_data("abcde", "abc", last_n = 1:2))
  expect_error(ecb_data("abcde", "abc", last_n = 1.5))
  expect_error(ecb_data("abcde", "abc", last_n = -1L))
  expect_error(ecb_data("abcde", "abc", last_n = 0L))
})

test_that("parse_bbk_data works", {
  body <- xml2::read_xml(test_path("fixtures", "ecb-data.xml"))
  actual <- parse_ecb_data(body)
  expect_s3_class(actual, "data.frame")
  expect_gt(nrow(actual), 0L)
  expect_identical(unique(actual$key), "D.USD.EUR.SP00.A")
  expect_s3_class(actual$date, "Date")

  body <- xml2::read_xml(test_path("fixtures", "ecb-data-fm.xml"))
  actual <- parse_ecb_data(body)
  expect_s3_class(actual, "data.frame")
  expect_gt(nrow(actual), 0L)
  expect_gt(length(unique(actual$key)), 0L)
  expect_s3_class(actual$date, "Date")
})

test_that("metadata input validation works", {
  # type should be one of datastructure, dataflow, codelist, concept
  expect_error(ecb_metadata(1L))
  expect_error(ecb_metadata(TRUE))
  expect_error(ecb_metadata(c("datastructure", "dataflow")))
  expect_error(ecb_metadata("data"))
  # id should be a character(1) or NULL
  expect_error(ecb_metadata("datastructure", id = 1L))
  expect_error(ecb_metadata("datastructure", id = TRUE))
  expect_error(ecb_metadata("datastructure", id = c("a", "b")))
})
