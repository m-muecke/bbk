test_that("parse_bde_data works", {
  json <- readRDS(test_path("fixtures", "bde-data.rds"))
  actual <- parse_bde_data(json)
  expect_s3_class(actual, "data.frame")
  expect_gt(nrow(actual), 0L)
  expect_identical(
    unique(actual$series),
    c("DTNPDE2010_P0000P_PS_APU", "DTNSEC2010_S0000P_APU_SUMAMOVIL")
  )
  expect_s3_class(actual$date, "POSIXct")
  expect_true(!any(unlist(lapply(actual, class)) == "list"))
})
