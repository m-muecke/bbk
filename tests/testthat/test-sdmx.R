test_that("sdmx_data_resource builds correct paths", {
  expect_identical(sdmx_data_resource("exr", NULL), "data/EXR")
  expect_identical(sdmx_data_resource("exr", "d.usd"), "data/EXR/D.USD")
  expect_identical(sdmx_data_resource("exr", c("d.usd", "d.eur")), "data/EXR/D.USD+D.EUR")
  expect_identical(sdmx_data_resource("exr", NULL, default_key = "all"), "data/EXR/all")
})

test_that("sdmx_metadata_type maps types to resources and xpaths", {
  expect_identical(
    sdmx_metadata_type("datastructure"),
    list(resource = "datastructure", xpath = "//str:DataStructure")
  )
  expect_identical(
    sdmx_metadata_type("dataflow"),
    list(resource = "dataflow", xpath = "//str:Dataflow")
  )
  expect_identical(
    sdmx_metadata_type("codelist"),
    list(resource = "codelist", xpath = "//str:Codelist")
  )
  expect_identical(
    sdmx_metadata_type("concept"),
    list(resource = "conceptscheme", xpath = "//str:ConceptScheme")
  )
})

test_that("sdmx_freq maps codes correctly", {
  expect_identical(sdmx_freq("P1D"), "daily")
  expect_identical(sdmx_freq("P1M"), "monthly")
  expect_identical(sdmx_freq("P3M"), "quarterly")
  expect_identical(sdmx_freq("P1Y"), "annual")
  expect_identical(sdmx_freq("A"), "annual")
  expect_identical(sdmx_freq("S"), "semi-annual")
  expect_identical(sdmx_freq("H"), "semi-annual")
  expect_identical(sdmx_freq("Q"), "quarterly")
  expect_identical(sdmx_freq("M"), "monthly")
  expect_identical(sdmx_freq("W"), "weekly")
  expect_identical(sdmx_freq("P7D"), "weekly")
  expect_identical(sdmx_freq("P6M"), "semi-annual")
  expect_identical(sdmx_freq("D"), "daily")
  expect_identical(sdmx_freq("B"), "daily")
})

test_that("sdmx_freq passes unknown codes through instead of returning NULL", {
  expect_identical(sdmx_freq("N"), "N")
  expect_identical(sdmx_freq("P1W"), "P1W")
})

test_that("parse_date returns the date unchanged for an unknown or missing freq", {
  expect_identical(parse_date("2020-01", "H"), "2020-01")
  expect_identical(parse_date("2020-01", NULL), "2020-01")
  expect_identical(parse_date("2020-01", NA_character_), "2020-01")
})

test_that("parse_date maps annual periods to the first day of the year", {
  expect_identical(parse_date(c("2020", "2021"), "annual"), as.Date(c("2020-01-01", "2021-01-01")))
  expect_identical(parse_date(NA_character_, "annual"), as.Date(NA))
})

test_that("parse_date maps sub-annual periods to the first day", {
  expect_identical(
    parse_date(c("2020-01", "2020-12"), "monthly"),
    as.Date(c("2020-01-01", "2020-12-01"))
  )
  expect_identical(
    parse_date(c("2020-Q1", "2020-Q4"), "quarterly"),
    as.Date(c("2020-01-01", "2020-10-01"))
  )
  expect_identical(
    parse_date(c("2020-S1", "2020-S2"), "semi-annual"),
    as.Date(c("2020-01-01", "2020-07-01"))
  )
})

test_that("parse_date maps weekly periods to the Monday of the ISO week", {
  # ISO week 1 is the week holding 4 January, so it can start in the previous calendar year
  weeks = c("2020-W01", "2020-W53", "2021-W01", "2015-W53", "2026-W33")
  actual = parse_date(weeks, "weekly")
  expect_identical(
    actual,
    as.Date(c("2019-12-30", "2020-12-28", "2021-01-04", "2015-12-28", "2026-08-10"))
  )
  expect_identical(format(actual, "%G-W%V"), weeks)
})

test_that("sdmx_metadata parses entries", {
  body = xml2::read_xml(test_path("fixtures", "nob-metadata.xml"))
  entries = xml2::xml_find_all(body, "//str:Dataflow")
  actual = sdmx_metadata(entries)
  expect_data_table(actual, min.rows = 1L)
  expect_true(all(c("id", "name") %in% names(actual)))
  expect_true("EXR" %in% actual$id)
})

test_that("sdmx_metadata ignores names of nested codes", {
  xml = xml2::read_xml(
    '<str:Codelist id="CL_TEST"
      xmlns:str="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/structure"
      xmlns:com="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/common">
      <com:Name xml:lang="en">Test codelist</com:Name>
      <str:Code id="A"><com:Name xml:lang="en">Alpha</com:Name></str:Code>
      <str:Code id="B"><com:Name xml:lang="en">Beta</com:Name></str:Code>
    </str:Codelist>'
  )
  actual = sdmx_metadata(list(xml))
  expect_identical(actual, data.table(id = "CL_TEST", name = "Test codelist"))
})

test_that("sdmx_error_body extracts the message from an SDMX error response", {
  body = paste0(
    '<?xml version="1.0"?>',
    '<message:Error xmlns:message="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/message"',
    ' xmlns:com="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/common">',
    '<message:ErrorMessage code="100"><com:Text>No data found</com:Text></message:ErrorMessage>',
    "</message:Error>"
  )
  resp = httr2::response(
    404L,
    headers = "Content-Type: application/xml;charset=UTF-8",
    body = charToRaw(body)
  )
  expect_identical(sdmx_error_body(resp), "No data found")
})

test_that("sdmx_error_body extracts the detail from a JSON problem response", {
  body = '{"title":"Not Found","status":404,"detail":"No Series was returned for the query: <?xml version=\\"1.0\\"?><DataQuery/>"}'
  resp = httr2::response(
    404L,
    headers = "Content-Type: application/problem+json",
    body = charToRaw(body)
  )
  expect_identical(
    sdmx_error_body(resp, docs = "See docs"),
    c("No Series was returned for the query", "See docs")
  )
})

test_that("sdmx_error_body suppresses html and empty bodies", {
  html = httr2::response(
    522L,
    headers = "Content-Type: text/html",
    body = charToRaw("<!DOCTYPE html> <html>Connection timed out</html>")
  )
  expect_null(sdmx_error_body(html))
  expect_identical(sdmx_error_body(html, docs = "See docs"), "See docs")
  expect_null(sdmx_error_body(httr2::response(500L)))
})

test_that("sdmx_error_body passes plain text bodies through", {
  resp = httr2::response(
    404L,
    headers = "Content-Type: text/plain",
    body = charToRaw("No results found for the query")
  )
  expect_identical(sdmx_error_body(resp), "No results found for the query")
})
