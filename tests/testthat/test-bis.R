test_that("bis_data input validation works", {
  expect_error(bis_data(1L))
  expect_error(bis_data(TRUE))
  expect_error(bis_data(NULL))
  expect_error(bis_data(NA))
  expect_error(bis_data(c("WS_CBPOL", "WS_EER")))
  # key
  expect_error(bis_data("WS_CBPOL", 1L))
  expect_error(bis_data("WS_CBPOL", TRUE))
  expect_error(bis_data("WS_CBPOL", NA))
  # start_period
  expect_error(bis_data("WS_CBPOL", start_period = TRUE))
  expect_error(bis_data("WS_CBPOL", start_period = c("a", "b")))
  # end_period
  expect_error(bis_data("WS_CBPOL", end_period = TRUE))
  expect_error(bis_data("WS_CBPOL", end_period = c("a", "b")))
  # first_n
  expect_error(bis_data("WS_CBPOL", first_n = "abc"))
  expect_error(bis_data("WS_CBPOL", first_n = TRUE))
  expect_error(bis_data("WS_CBPOL", first_n = -1L))
  expect_error(bis_data("WS_CBPOL", first_n = 0L))
  # last_n
  expect_error(bis_data("WS_CBPOL", last_n = "abc"))
  expect_error(bis_data("WS_CBPOL", last_n = TRUE))
  expect_error(bis_data("WS_CBPOL", last_n = -1L))
  expect_error(bis_data("WS_CBPOL", last_n = 0L))
})

test_that("parse_bis_data works", {
  body <- xml2::read_xml(test_path("fixtures", "bis-data.xml"))
  actual <- parse_bis_data(body)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_true(all(c("date", "key", "value", "freq") %in% names(actual)))
  expect_identical(unique(actual$freq), "monthly")
})

test_that("bis_metadata input validation works", {
  expect_error(bis_metadata(1L))
  expect_error(bis_metadata(TRUE))
  expect_error(bis_metadata("data"))
  expect_error(bis_metadata(c("datastructure", "dataflow")))
  expect_error(bis_metadata("dataflow", id = 1L))
  expect_error(bis_metadata("dataflow", id = TRUE))
})

test_that("sdmx_metadata works for bis", {
  body <- xml2::read_xml(test_path("fixtures", "bis-metadata.xml"))
  entries <- xml2::xml_find_all(body, "//str:Dataflow")
  actual <- sdmx_metadata(entries)
  expect_data_table(actual, min.rows = 1L)
  expect_true(all(c("id", "name") %in% names(actual)))
  expect_true("WS_CBPOL" %in% actual$id)
})
