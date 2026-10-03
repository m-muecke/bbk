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

test_that("nob_dimension input validation works", {
  expect_error(nob_dimension(1L))
  expect_error(nob_dimension(TRUE))
  expect_error(nob_dimension(NULL))
  expect_error(nob_dimension(c("a", "b")))
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

test_that("sdmx_metadata works for nob", {
  body = xml2::read_xml(test_path("fixtures", "nob-metadata.xml"))
  entries = xml2::xml_find_all(body, "//str:Dataflow")
  actual = sdmx_metadata(entries)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("id", "name"))
  expect_choice("EXR", actual$id)
})
