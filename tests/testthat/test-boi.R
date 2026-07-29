test_that("boi_data input validation works", {
  expect_snapshot(error = TRUE, {
    boi_data(1L)
    boi_data(TRUE)
    boi_data(NULL)
    boi_data(NA)
    boi_data(c("EXR", "IR"))
    boi_data("EXR", 1L)
    boi_data("EXR", TRUE)
    boi_data("EXR", NA)
    boi_data("EXR", "abc", start_period = TRUE)
    boi_data("EXR", "abc", start_period = c("a", "b"))
    boi_data("EXR", "abc", end_period = TRUE)
    boi_data("EXR", "abc", end_period = c("a", "b"))
    boi_data("EXR", "abc", last_n = "abc")
    boi_data("EXR", "abc", last_n = TRUE)
    boi_data("EXR", "abc", last_n = -1L)
    boi_data("EXR", "abc", last_n = 0L)
  })
})

test_that("boi_data builds the flow reference without a version", {
  local_mocked_bindings(boi = function(resource, ...) resource)
  local_mocked_bindings(parse_boi_data = function(xml) xml)
  expect_identical(boi_data("exr", "RER_GBP_ILS"), "data/BOI.STATISTICS,EXR/RER_GBP_ILS")
  expect_identical(boi_data("EXR"), "data/BOI.STATISTICS,EXR")
})

test_that("parse_boi_data works", {
  body = xml2::read_xml(test_path("fixtures", "boi-data.xml"))
  actual = parse_boi_data(body)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_names(names(actual), must.include = c("date", "key", "value", "freq"))
})

test_that("parse_boi_data key contains only dimension values", {
  body = xml2::read_xml(test_path("fixtures", "boi-data.xml"))
  actual = parse_boi_data(body)
  expect_identical(unique(actual$key), "RER_GBP_ILS.D.GBP.ILS.ILS.OF00")
})

test_that("parse_boi_data drops observations without a value and keeps alignment", {
  body = xml2::read_xml(
    '<message:GenericData xmlns:message="m"
       xmlns:generic="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/data/generic">
      <message:DataSet>
        <generic:Series>
          <generic:SeriesKey>
            <generic:Value id="SERIES_CODE" value="S1"/>
            <generic:Value id="FREQ" value="D"/>
          </generic:SeriesKey>
          <generic:Obs>
            <generic:ObsDimension value="2024-01-02"/>
            <generic:ObsValue value="1"/>
          </generic:Obs>
          <generic:Obs>
            <generic:ObsDimension value="2024-01-03"/>
          </generic:Obs>
          <generic:Obs>
            <generic:ObsDimension value="2024-01-04"/>
            <generic:ObsValue value="3"/>
          </generic:Obs>
        </generic:Series>
      </message:DataSet>
    </message:GenericData>'
  )
  actual = parse_boi_data(body)
  expect_identical(actual$date, as.Date(c("2024-01-02", "2024-01-04")))
  expect_identical(actual$value, c(1, 3))
})

test_that("parse_boi_data works for a flow without a FREQ dimension", {
  body = xml2::read_xml(
    '<message:GenericData xmlns:message="m"
       xmlns:generic="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/data/generic">
      <message:DataSet>
        <generic:Series>
          <generic:SeriesKey>
            <generic:Value id="SERIES_CODE" value="S1"/>
            <generic:Value id="UNIT_MEASURE" value="ILS"/>
          </generic:SeriesKey>
          <generic:Obs>
            <generic:ObsDimension value="2024-01"/>
            <generic:ObsValue value="1"/>
          </generic:Obs>
          <generic:Obs>
            <generic:ObsDimension value="2024-02"/>
            <generic:ObsValue value="2"/>
          </generic:Obs>
        </generic:Series>
      </message:DataSet>
    </message:GenericData>'
  )
  actual = parse_boi_data(body)
  expect_identical(actual$date, c("2024-01", "2024-02"))
  expect_identical(actual$freq, c(NA_character_, NA_character_))
  expect_identical(unique(actual$key), "S1.ILS")
})

test_that("boi_dimension input validation works", {
  expect_snapshot(error = TRUE, {
    boi_dimension(1L)
    boi_dimension(TRUE)
    boi_dimension(NULL)
    boi_dimension(c("a", "b"))
  })
})

test_that("boi_dimension works", {
  body = xml2::read_xml(test_path("fixtures", "boi-dimension.xml"))
  actual = sdmx_dimension(body)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("id", "position", "codelist"))
  expect_subset("FREQ", actual$id)
})

test_that("boi_metadata input validation works", {
  expect_snapshot(error = TRUE, {
    boi_metadata(1L)
    boi_metadata(TRUE)
    boi_metadata("data")
    boi_metadata(c("datastructure", "dataflow"))
    boi_metadata("dataflow", id = 1L)
    boi_metadata("dataflow", id = TRUE)
    boi_metadata("dataflow", lang = "fr")
  })
})

test_that("sdmx_metadata works for boi", {
  body = xml2::read_xml(test_path("fixtures", "boi-metadata.xml"))
  entries = xml2::xml_find_all(body, "//str:Dataflow")
  actual = sdmx_metadata(entries)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("id", "name"))
  expect_subset("EXR", actual$id)
})
