test_that("onb_data input validation works", {
  expect_error(onb_data(11L, NA_character_), "Contains missing values")
  expect_error(onb_data(11L, character()), "Must have length >= 1")
})

test_that("onb_frequency input validation works", {
  expect_error(onb_frequency(11L), "missing")
  expect_error(onb_frequency(11L, NULL), "Must be of type 'string'")
  expect_error(onb_frequency(11L, NA_character_), "May not be NA")
})

test_that("onb_hierarchy input validation works", {
  expect_error(onb_hierarchy(11L, lang = NULL), "Must be of type 'string'")
  expect_error(onb_hierarchy(11L, lang = c("en", "de")), "Must have length 1")
  expect_error(onb_hierarchy(11L, lang = "eng"), "exactly 2 characters")
})

test_that("parse_onb_data handles empty data", {
  xml = xml2::read_xml("<data_content><dataSets/></data_content>")
  actual = parse_onb_data(xml)
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), identical.to = c("date", "key", "value", "freq", "title"))
  expect_double(actual$value)
})

test_that("parse_onb_metadata keeps the scalar fields", {
  xml = xml2::read_xml(test_path("fixtures", "onb-metadata.xml"))
  actual = parse_onb_metadata(xml)
  expect_data_table(actual, nrows = 1L)
  expect_names(
    names(actual),
    identical.to = c(
      "title",
      "region",
      "unit",
      "comment",
      "classification",
      "breaks",
      "frequency",
      "last_update",
      "source",
      "lag"
    )
  )
  expect_identical(actual$title, "Loans to euro area residents - total")
  expect_identical(actual$frequency, "month")
  # "-" stands in for a missing value
  expect_identical(actual$region, NA_character_)
})

test_that("parse_onb_metadata drops <releases> however many entries it holds", {
  release = function(n) {
    paste0(
      "<metainfo><meta><title>t</title><releases>",
      strrep("<release><release_date>d</release_date><reference/><revision/></release>", n),
      "</releases></meta></metainfo>"
    )
  }
  # a single <release> used to survive the scalar filter and then expand into its children
  for (n in 0:2) {
    actual = parse_onb_metadata(xml2::read_xml(release(n)))
    expect_data_table(actual, nrows = 1L)
    expect_names(names(actual), identical.to = "title")
  }
})

test_that("onb_error_body reads errors served as application/xml or text/xml", {
  resp = function(type) {
    body = "<xml>\n\n<errors>\nWrong Value for param \"pos\" (NOTAKEY)\n</errors>\n</xml>"
    httr2::response(200L, headers = list("content-type" = type), body = charToRaw(body))
  }
  msg = "Wrong Value for param \"pos\" (NOTAKEY)"
  expect_identical(onb_error_body(resp("application/xml;charset=UTF-8")), msg)
  expect_identical(onb_error_body(resp("text/xml;charset=UTF-8")), msg)
  expect_null(onb_error_body(resp("text/html")))
})
