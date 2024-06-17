test_that("ecb_data input validation works", {
  # flow should be a character(1)
  expect_error(ecb_data(1L, "D.USD.EUR.SP00.A"))
  expect_error(ecb_data(TRUE, "D.USD.EUR.SP00.A"))
  expect_error(ecb_data(NULL, "D.USD.EUR.SP00.A"))
  expect_error(ecb_data(NA, "D.USD.EUR.SP00.A"))
  expect_error(ecb_data(c("EXR", "EXR"), "D.USD.EUR.SP00.A"))
  # key should be a character(1) or NULL
  expect_error(ecb_data("EXR", 1L))
  expect_error(ecb_data("EXR", TRUE))
  expect_error(ecb_data("EXR", NA))
  expect_error(ecb_data("EXR", c("D.USD.EUR.SP00.A", "D.USD.EUR.SP00.A")))
})
