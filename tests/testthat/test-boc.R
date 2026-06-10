test_that("boc_data input validation works", {
  expect_error(boc_data())
  expect_error(boc_data(group_name = "a", series_name = "b"))
  expect_error(boc_data(group_name = 1L))
  expect_error(boc_data(series_name = 1L))
})
