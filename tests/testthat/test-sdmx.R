test_that("sdmx_data_resource builds correct paths", {
  expect_identical(sdmx_data_resource("exr", NULL), "data/EXR")
  expect_identical(sdmx_data_resource("exr", "d.usd"), "data/EXR/D.USD")
  expect_identical(sdmx_data_resource("exr", c("d.usd", "d.eur")), "data/EXR/D.USD+D.EUR")
  expect_identical(sdmx_data_resource("exr", NULL, default_key = "all"), "data/EXR/all")
})

test_that("sdmx_freq maps codes correctly", {
  expect_identical(sdmx_freq("P1D"), "daily")
  expect_identical(sdmx_freq("P1M"), "monthly")
  expect_identical(sdmx_freq("P3M"), "quarterly")
  expect_identical(sdmx_freq("P1Y"), "annual")
  expect_identical(sdmx_freq("A"), "annual")
  expect_identical(sdmx_freq("S"), "semi-annual")
  expect_identical(sdmx_freq("Q"), "quarterly")
  expect_identical(sdmx_freq("M"), "monthly")
  expect_identical(sdmx_freq("W"), "weekly")
  expect_identical(sdmx_freq("D"), "daily")
  expect_identical(sdmx_freq("B"), "daily")
})

test_that("sdmx_metadata parses entries", {
  body <- xml2::read_xml(test_path("fixtures", "nob-metadata.xml"))
  entries <- xml2::xml_find_all(body, "//str:Dataflow")
  actual <- sdmx_metadata(entries)
  expect_data_table(actual, min.rows = 1L)
  expect_true(all(c("id", "name") %in% names(actual)))
  expect_true("EXR" %in% actual$id)
})
