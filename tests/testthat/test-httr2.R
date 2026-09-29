test_that("bbk_progress respects the bbk.progress option", {
  withr::local_options(bbk.progress = NULL)
  expect_identical(bbk_progress(), TRUE)
  withr::local_options(bbk.progress = FALSE)
  expect_identical(bbk_progress(), FALSE)
  withr::local_options(bbk.progress = NA)
  expect_identical(bbk_progress(), FALSE)
})
