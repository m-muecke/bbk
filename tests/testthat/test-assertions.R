test_that("assert_timestampish formats timestamps in UTC", {
  expect_identical(assert_timestampish(as.Date("2024-06-01")), "2024-06-01T00:00:00Z")
  ct = as.POSIXct("2024-06-01 12:00", tz = "America/New_York")
  expect_identical(assert_timestampish(ct), "2024-06-01T16:00:00Z")
  expect_identical(assert_timestampish(as.POSIXlt(ct)), "2024-06-01T16:00:00Z")
  expect_identical(assert_timestampish("2024-06-01T12:00:00Z"), "2024-06-01T12:00:00Z")
  expect_null(assert_timestampish(NULL, null.ok = TRUE))
})

test_that("assert_dateish converts date strings", {
  expect_identical(assert_dateish("2024-02-29"), as.Date("2024-02-29"))
  expect_identical(assert_dateish(as.Date("2024-02-29")), as.Date("2024-02-29"))
  expect_null(assert_dateish(NULL, null.ok = TRUE))
})

test_that("assert_dateish rejects impossible dates", {
  start_date = "2024-02-30"
  expect_snapshot(assert_dateish(start_date), error = TRUE)
  end_date = "2024-13-01"
  expect_snapshot(assert_dateish(end_date, null.ok = TRUE), error = TRUE)
})

test_that("assert_one_of requires exactly one non-NULL argument", {
  w = 1L
  x = 2L
  y = NULL
  z = NULL
  expect_null(assert_one_of(w, y, z))
  expect_snapshot(assert_one_of(y, z), error = TRUE)
  expect_snapshot(assert_one_of(w, x, y), error = TRUE)
})
