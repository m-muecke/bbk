test_that("bdf_dimension input validation works", {
  expect_error(bdf_dimension(NULL))
  expect_error(bdf_dimension(123L))
  expect_error(bdf_dimension(c("a", "b")))
  expect_error(bdf_dimension("a", lang = ""))
  expect_error(bdf_dimension("a", api_key = ""))
})

test_that("parse_bdf_dimension() works", {
  dt <- readRDS(test_path("fixtures", "bdf-dimension.rds"))
  actual <- parse_bdf_dimension(dt)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), identical.to = c("id", "position", "codelist"))
  expect_character(actual$id, any.missing = FALSE)
  expect_integer(actual$position, any.missing = FALSE)
  expect_character(actual$codelist)
  expect_equal(actual$position, seq_len(nrow(actual)))
})

test_that("parse_bdf_dimension() handles empty input", {
  empty <- data.table(dimensions_and_codelists = character())
  actual <- parse_bdf_dimension(empty)
  expect_data_table(actual, nrows = 0L)
  expect_names(names(actual), identical.to = c("id", "position", "codelist"))
})
