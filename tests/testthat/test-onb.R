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
