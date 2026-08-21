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
  body = xml2::read_xml(test_path("fixtures", "nob-data.xml"))
  actual = parse_nob_data(body)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_true(all(c("date", "key", "value", "freq") %in% names(actual)))
})

test_that("parse_nob_data drops observations without a value and keeps alignment", {
  body = xml2::read_xml(
    '<message:GenericData xmlns:message="m" xmlns:generic="http://generic">
      <message:DataSet>
        <generic:Series>
          <generic:SeriesKey>
            <generic:Value id="FREQ" value="B"/>
            <generic:Value id="BASE_CUR" value="USD"/>
          </generic:SeriesKey>
          <generic:Obs><generic:ObsDimension value="2024-01-02"/><generic:ObsValue value="1"/></generic:Obs>
          <generic:Obs><generic:ObsDimension value="2024-01-03"/></generic:Obs>
          <generic:Obs><generic:ObsDimension value="2024-01-04"/><generic:ObsValue value="3"/></generic:Obs>
        </generic:Series>
      </message:DataSet>
    </message:GenericData>'
  )
  actual = parse_nob_data(body)
  expect_identical(actual$date, as.Date(c("2024-01-02", "2024-01-04")))
  expect_identical(actual$value, c(1, 3))
})

test_that("parse_nob_data works without a FREQ dimension", {
  body = xml2::read_xml(
    '<message:GenericData xmlns:message="m" xmlns:generic="http://generic">
      <message:DataSet>
        <generic:Series>
          <generic:SeriesKey>
            <generic:Value id="INSTRUMENT_TYPE" value="KPRA"/>
          </generic:SeriesKey>
          <generic:Obs><generic:ObsDimension value="2024-01-02"/><generic:ObsValue value="4.25"/></generic:Obs>
        </generic:Series>
      </message:DataSet>
    </message:GenericData>'
  )
  actual = parse_nob_data(body)
  expect_identical(actual$date, "2024-01-02")
  expect_identical(actual$value, 4.25)
  expect_identical(actual$key, "KPRA")
  expect_identical(actual$freq, NA_character_)
})

test_that("parse_nob_data builds the key from dimensions only", {
  body = xml2::read_xml(
    '<message:GenericData xmlns:message="m" xmlns:generic="http://generic">
      <message:DataSet>
        <generic:Series>
          <generic:SeriesKey>
            <generic:Value id="FREQ" value="B"/>
            <generic:Value id="SECURITY" value="NO0013737973"/>
            <generic:Value id="UNIT_MEASURE" value="AY"/>
          </generic:SeriesKey>
          <generic:Attributes>
            <generic:Value id="DECIMALS" value="4"/>
            <generic:Value id="ISSUE_DATE" value="2026-03-18"/>
            <generic:Value id="MATURITY" value="2027-03-17"/>
          </generic:Attributes>
          <generic:Obs><generic:ObsDimension value="2026-08-21"/><generic:ObsValue value="4.4295"/></generic:Obs>
        </generic:Series>
      </message:DataSet>
    </message:GenericData>'
  )
  actual = parse_nob_data(body)
  expect_identical(actual$key, "B.NO0013737973.AY")
  expect_identical(actual$issue_date, "2026-03-18")
  expect_identical(actual$maturity, "2027-03-17")
  expect_names(names(actual), disjunct.from = "decimals")
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
  expect_true(all(c("id", "name") %in% names(actual)))
  expect_true("EXR" %in% actual$id)
})
