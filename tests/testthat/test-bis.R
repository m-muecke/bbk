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
  # updated_after
  expect_error(bis_data("WS_CBPOL", updated_after = 1L))
  expect_error(bis_data("WS_CBPOL", updated_after = TRUE))
  expect_error(bis_data("WS_CBPOL", updated_after = NA))
})

test_that("bis_data passes updated_after as updatedAfter", {
  captured = NULL
  httr2::local_mocked_responses(function(req) {
    captured <<- req
    httr2::response(200L, headers = "content-type: application/xml", body = charToRaw("<x/>"))
  })
  local_mocked_bindings(parse_bis_data = function(xml) data.table())
  bis_data("WS_CBPOL", "M.CH", updated_after = as.Date("2024-06-01"))
  expect_match(captured$url, "updatedAfter=2024-06-01T00%3A00%3A00")
})

test_that("parse_bis_data works", {
  body = xml2::read_xml(test_path("fixtures", "bis-data.xml"))
  actual = parse_bis_data(body)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
  expect_numeric(actual$value)
  expect_true(all(c("date", "key", "value", "freq") %in% names(actual)))
  expect_identical(unique(actual$freq), "monthly")
})

test_that("parse_bis_data drops observations without a value and keeps alignment", {
  body = xml2::read_xml(
    '<message:GenericData xmlns:message="m" xmlns:generic="http://generic">
      <message:DataSet>
        <generic:Series>
          <generic:SeriesKey>
            <generic:Value id="FREQ" value="M"/>
            <generic:Value id="REF_AREA" value="US"/>
          </generic:SeriesKey>
          <generic:Attributes><generic:Value id="TITLE" value="t"/></generic:Attributes>
          <generic:Obs><generic:ObsDimension value="2020-01"/><generic:ObsValue value="1"/></generic:Obs>
          <generic:Obs><generic:ObsDimension value="2020-02"/></generic:Obs>
          <generic:Obs><generic:ObsDimension value="2020-03"/><generic:ObsValue value="3"/></generic:Obs>
        </generic:Series>
      </message:DataSet>
    </message:GenericData>'
  )
  actual = parse_bis_data(body)
  expect_identical(actual$date, as.Date(c("2020-01-01", "2020-03-01")))
  expect_identical(actual$value, c(1, 3))
})

test_that("bis_dimension input validation works", {
  expect_error(bis_dimension(1L))
  expect_error(bis_dimension(TRUE))
  expect_error(bis_dimension(NULL))
  expect_error(bis_dimension(c("a", "b")))
})

test_that("bis_metadata input validation works", {
  expect_error(bis_metadata(1L))
  expect_error(bis_metadata(TRUE))
  expect_error(bis_metadata("data"))
  expect_error(bis_metadata(c("datastructure", "dataflow")))
  expect_error(bis_metadata("dataflow", id = 1L))
  expect_error(bis_metadata("dataflow", id = TRUE))
})

test_that("bis_data returns rows from the live endpoint", {
  skip_if_offline()
  skip_on_cran()
  skip_on_ci()

  x = bis_data("WS_CBPOL", "M.CH", last_n = 5L)
  expect_data_table(x, min.rows = 1L)
  expect_true(all(c("date", "key", "value", "freq") %in% names(x)))
})

test_that("sdmx_metadata works for bis", {
  body = xml2::read_xml(test_path("fixtures", "bis-metadata.xml"))
  entries = xml2::xml_find_all(body, "//str:Dataflow")
  actual = sdmx_metadata(entries)
  expect_data_table(actual, min.rows = 1L)
  expect_true(all(c("id", "name") %in% names(actual)))
  expect_true("WS_CBPOL" %in% actual$id)
})
