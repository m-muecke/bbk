test_that("boe_data input validation works", {
  expect_error(boe_data(c("id1", "id2")))
  expect_error(boe_data(123L))
  expect_error(boe_data(NULL))
  expect_error(boe_data(NA))
  # start_date should be a valid date
  expect_error(boe_data("abc", ""))
  expect_error(boe_data("abc", 1L))
  expect_error(boe_data("abc", "2020"))
  expect_error(boe_data("abc", end_date = ""))
  expect_error(boe_data("abc", end_date = 1L))
  expect_error(boe_data("abc", end_date = "2020"))
})

test_that("boe_date() formats dates for the BoE API", {
  expect_identical(boe_date(as.Date("2015-01-01")), "01/Jan/2015")
  expect_identical(boe_date("2024-09-30"), "30/Sep/2024")
  expect_identical(
    boe_date(as.Date(c("2015-01-01", "2024-12-25"))),
    c("01/Jan/2015", "25/Dec/2024")
  )
})

test_that("boe_date() does not depend on the session locale", {
  old = Sys.getlocale("LC_TIME")
  on.exit(Sys.setlocale("LC_TIME", old), add = TRUE)
  skip_if(
    !nzchar(suppressWarnings(Sys.setlocale("LC_TIME", "de_DE.UTF-8"))),
    "no German locale available"
  )
  expect_identical(boe_date(as.Date("2015-01-01")), "01/Jan/2015")
  expect_identical(Sys.getlocale("LC_TIME"), "de_DE.UTF-8")
})

test_that("parse_boe_data() works", {
  body = xml2::read_xml(test_path("fixtures", "boe-data.xml"))
  actual = parse_boe_data(body)
  expect_data_table(actual, min.rows = 1L)
  expect_date(actual$date)
})
