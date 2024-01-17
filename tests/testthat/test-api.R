test_that("bb_data input validation works", {
  # flow should be a character(1) with 5 <= nchar <= 8
  expect_error(bb_data(1L, "abc"))
  expect_error(bb_data(TRUE, "abc"))
  expect_error(bb_data(NULL, "abc"))
  expect_error(bb_data(c("a", "b"), "abc"))
  expect_error(bb_data("a", "abc"))
  expect_error(bb_data("abcd", "abc"))
  # key should be a character(1)
  expect_error(bb_data("abc", 1L))
  expect_error(bb_data("abc", TRUE))
  expect_error(bb_data("abc", NULL))
  expect_error(bb_data("abc", c("a", "b")))
  # start_period should be a character(1) or NULL
  expect_error(bb_data("abc", "abc", start_period = 1L))
  expect_error(bb_data("abc", "abc", start_period = TRUE))
  expect_error(bb_data("abc", "abc", start_period = c("a", "b")))
  # end_period should be a character(1) or NULL
  expect_error(bb_data("abc", "abc", TRUE))
  expect_error(bb_data("abc", "abc", end_period = 1L))
  expect_error(bb_data("abc", "abc", end_period = c("a", "b")))
  # first_n should be a whole number or NULL
  expect_error(bb_data("abc", "abc", first_n = "abc"))
  expect_error(bb_data("abc", "abc", first_n = TRUE))
  expect_error(bb_data("abc", "abc", first_n = c(1, 2)))
  expect_error(bb_data("abc", "abc", first_n = 1.5))
  # last_n should be a whole number or NULL
  expect_error(bb_data("abc", "abc", last_n = "abc"))
  expect_error(bb_data("abc", "abc", last_n = TRUE))
  expect_error(bb_data("abc", "abc", last_n = c(1, 2)))
  expect_error(bb_data("abc", "abc", last_n = 1.5))
})

test_that("metadata input validation works", {
  for (fn in list(bb_data_structure, bb_dataflow, bb_codelist, bb_concept)) {
    # id should be a character(1) or NULL
    expect_error(fn(1L))
    expect_error(fn(TRUE))
    expect_error(fn(c("a", "b")))
    # lang should be en or de
    expect_error(fn(lang = "abc"))
    expect_error(fn(lang = 1L))
    expect_error(fn(lang = NA))
  }
})
