test_that("parse_timestamp parses ISO 8601 UTC timestamps", {
  x = parse_timestamp(c("2024-01-02T03:04:05Z", "2024-01-02T03:04:05.5Z", NA))
  expect_s3_class(x, "POSIXct")
  expect_identical(attr(x, "tzone"), "UTC")
  expect_equal(x, as.POSIXct(c("2024-01-02 03:04:05", "2024-01-02 03:04:05.5", NA), tz = "UTC"))
})
