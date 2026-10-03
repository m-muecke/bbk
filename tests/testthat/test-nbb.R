test_that("nbb_data input validation works", {
  expect_snapshot(error = TRUE, {
    nbb_data(1L)
    nbb_data(TRUE)
    nbb_data(NULL)
    nbb_data(NA)
    nbb_data(c("DF_EXR", "DF_HICP"))
    nbb_data("DF_EXR", 1L)
    nbb_data("DF_EXR", TRUE)
    nbb_data("DF_EXR", NA)
    nbb_data("DF_EXR", "abc", start_period = TRUE)
    nbb_data("DF_EXR", "abc", start_period = c("a", "b"))
    nbb_data("DF_EXR", "abc", end_period = TRUE)
    nbb_data("DF_EXR", "abc", end_period = c("a", "b"))
    nbb_data("DF_EXR", "abc", last_n = "abc")
    nbb_data("DF_EXR", "abc", last_n = TRUE)
    nbb_data("DF_EXR", "abc", last_n = -1L)
    nbb_data("DF_EXR", "abc", last_n = 0L)
  })
})

test_that("nbb_data builds the data resource", {
  local_mocked_bindings(nbb = \(resource, ...) resource)
  local_mocked_bindings(parse_sdmx_data = \(xml) xml)
  expect_identical(nbb_data("df_exr", "m.usd"), "data/DF_EXR/M.USD")
  expect_identical(nbb_data("DF_EXR"), "data/DF_EXR")
})

test_that("parse_sdmx_data works for nbb", {
  body = xml2::read_xml(test_path("fixtures", "nbb-data.xml"))
  actual = parse_sdmx_data(body)
  expect_data_table(actual, nrows = 6L)
  expect_date(actual$date)
  usd = actual$date[actual$key == "M.USD"]
  expect_identical(usd, sort(usd))
  expect_numeric(actual$value, any.missing = FALSE)
  expect_set_equal(actual$key, c("M.USD", "M.GBP"))
  expect_set_equal(actual$freq, "monthly")
  expect_names(names(actual), must.include = c("date", "key", "value", "freq", "exr_currency"))
})

test_that("nbb_dimension input validation works", {
  expect_snapshot(error = TRUE, {
    nbb_dimension(1L)
    nbb_dimension(TRUE)
    nbb_dimension(NULL)
    nbb_dimension(c("a", "b"))
  })
})

test_that("nbb_dimension works", {
  local_mocked_bindings(nbb = \(resource, ...) {
    xml2::read_xml(test_path("fixtures", "nbb-dimension.xml"))
  })
  actual = nbb_dimension("DSD_EXR")
  expect_identical(
    actual,
    data.table(
      id = c("FREQ", "EXR_CURRENCY"),
      position = 1:2,
      codelist = c("CL_FREQ", "CL_EXR_CURRENCY")
    )
  )
})

test_that("nbb_metadata input validation works", {
  expect_snapshot(error = TRUE, {
    nbb_metadata(1L)
    nbb_metadata(TRUE)
    nbb_metadata("data")
    nbb_metadata(c("datastructure", "dataflow"))
    nbb_metadata("dataflow", id = 1L)
    nbb_metadata("dataflow", id = TRUE)
    nbb_metadata("dataflow", lang = "de")
  })
})

test_that("nbb_metadata works", {
  local_mocked_bindings(nbb = \(resource, ...) {
    xml2::read_xml(test_path("fixtures", "nbb-metadata.xml"))
  })
  expect_identical(
    nbb_metadata("dataflow", "DF_EXR"),
    data.table(
      id = "DF_EXR",
      name = "Reference exchange rates of the euro in national currency units"
    )
  )
  expect_identical(
    nbb_metadata("dataflow", "DF_EXR", lang = "nl")$name,
    "Referentiewisselkoersen van de euro in nationale munteenheden"
  )
})

test_that("nbb_metadata builds the resource for the BE2 agency", {
  requested = NULL
  local_mocked_bindings(nbb = function(resource, ...) {
    requested <<- resource
    xml2::read_xml(test_path("fixtures", "nbb-metadata.xml"))
  })
  nbb_metadata("codelist", "cl_freq")
  expect_identical(requested, "codelist/BE2/CL_FREQ")
  nbb_metadata("dataflow")
  expect_identical(requested, "dataflow/BE2")
})
