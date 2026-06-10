test_that("parse_onb_data handles empty data", {
  xml = xml2::read_xml("<data_content><dataSets/></data_content>")
  actual = parse_onb_data(xml)
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), identical.to = c("date", "key", "value", "freq", "title"))
  expect_double(actual$value)
})
