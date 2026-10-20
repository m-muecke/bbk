test_that("assert_timestampish formats timestamps in UTC", {
  expect_identical(assert_timestampish(as.Date("2024-06-01")), "2024-06-01T00:00:00Z")
  ct = as.POSIXct("2024-06-01 12:00", tz = "America/New_York")
  expect_identical(assert_timestampish(ct), "2024-06-01T16:00:00Z")
  expect_identical(assert_timestampish(as.POSIXlt(ct)), "2024-06-01T16:00:00Z")
  expect_identical(assert_timestampish("2024-06-01T12:00:00Z"), "2024-06-01T12:00:00Z")
  expect_null(assert_timestampish(NULL, null.ok = TRUE))
})
