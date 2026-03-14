test_that("nob_data input validation works", {
  expect_error(nob_data(1L))
  expect_error(nob_data(TRUE))
  expect_error(nob_data(NULL))
  expect_error(nob_data(NA))
  expect_error(nob_data(c("EXR", "IR")))
  # key should be a character(1) or NULL
  expect_error(nob_data("EXR", 1L))
  expect_error(nob_data("EXR", TRUE))
  expect_error(nob_data("EXR", NA))
  # start_period
  expect_error(nob_data("EXR", "abc", start_period = TRUE))
  expect_error(nob_data("EXR", "abc", start_period = c("a", "b")))
  # end_period
  expect_error(nob_data("EXR", "abc", end_period = TRUE))
  expect_error(nob_data("EXR", "abc", end_period = c("a", "b")))
  # last_n
  expect_error(nob_data("EXR", "abc", last_n = "abc"))
  expect_error(nob_data("EXR", "abc", last_n = TRUE))
  expect_error(nob_data("EXR", "abc", last_n = -1L))
  expect_error(nob_data("EXR", "abc", last_n = 0L))
})

test_that("parse_nob_data works", {
  body <- xml2::read_xml(test_path("fixtures", "nob-data.xml"))
  actual <- parse_nob_data(body)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_true(all(c("date", "key", "value", "freq") %in% names(actual)))
})

test_that("nob_metadata input validation works", {
  expect_error(nob_metadata(1L))
  expect_error(nob_metadata(TRUE))
  expect_error(nob_metadata("data"))
  expect_error(nob_metadata(c("datastructure", "dataflow")))
  expect_error(nob_metadata("dataflow", id = 1L))
  expect_error(nob_metadata("dataflow", id = TRUE))
  expect_error(nob_metadata("dataflow", lang = "fr"))
})

test_that("parse_nob_metadata works", {
  body <- xml2::read_xml(test_path("fixtures", "nob-metadata.xml"))
  entries <- xml2::xml_find_all(body, "//str:Dataflow")
  actual <- parse_nob_metadata(entries)
  expect_data_table(actual, min.rows = 1L)
  expect_true(all(c("id", "name") %in% names(actual)))
  expect_true("EXR" %in% actual$id)
})
