test_that("bde_data input validation works", {
  # series should be a character()
  expect_error(bde_data(1L))
  expect_error(bde_data(TRUE))
  expect_error(bde_data(NULL))
})

test_that("parse_bde_data works", {
  json <- readRDS(test_path("fixtures", "bde-data.rds"))
  actual <- parse_bde_data(json)
  expect_data_table(actual)
  expect_gt(nrow(actual), 0L)
  expect_identical(
    unique(actual$key),
    c("DTNPDE2010_P0000P_PS_APU", "DTNSEC2010_S0000P_APU_SUMAMOVIL")
  )
  expect_posixct(actual$date)
  expect_false(any(unlist(lapply(actual, class)) == "list"))
})
