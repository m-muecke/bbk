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
