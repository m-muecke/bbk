test_that("snb_data input validation works", {
  expect_error(snb_data(c("id1", "id2")))
  expect_error(snb_data(123L))
  expect_error(snb_data(NULL))
  expect_error(snb_data(NA))
  # start_date should be a valid date
  expect_error(snb_data("abc", ""))
  expect_error(snb_data("abc", 1L))
  expect_error(snb_data("abc", "2020"))
  expect_error(snb_data("abc", end_date = ""))
  expect_error(snb_data("abc", end_date = 1L))
  expect_error(snb_data("abc", end_date = "2020"))
  # lang should be one of "en", "de"
  expect_error(snb_data("abc", lang = "fr"))
})

test_that("snb_dimension input validation works", {
  expect_error(snb_dimension(c("id1", "id2")))
  expect_error(snb_dimension(123L))
  expect_error(snb_dimension(NULL))
  expect_error(snb_dimension("abc", lang = "fr"))
})

test_that("parse_snb_dimension() works", {
  body = readRDS(test_path("fixtures", "snb-dimensions.rds"))
  actual = parse_snb_dimension(body)
  expect_data_table(actual, min.rows = 1L)
  expect_names(names(actual), must.include = c("dim_id", "dim_name", "item_id", "item_name"))
})

test_that("parse_snb_data() works", {
  body = readRDS(test_path("fixtures", "snb-data.rds"))
  actual = parse_snb_data(body)
  expect_data_table(actual, min.rows = 1L)
  expect_match(actual$key, "^EPB@SNB.rendopar")
  expect_date(actual$date)
})

test_that("snb_metadata input validation works", {
  expect_error(snb_metadata(c("a", "b")))
  expect_error(snb_metadata(123L))
  expect_error(snb_metadata(NULL))
  expect_error(snb_metadata("abc", lang = "fr"))
})

test_that("parse_snb_metadata() works", {
  json = readRDS(test_path("fixtures", "snb-metadata.rds"))
  actual = parse_snb_metadata(json, "rendopar")
  expect_data_table(actual, nrows = 1L)
  expect_names(
    names(actual),
    identical.to = c(
      "key",
      "title",
      "sub_title",
      "publishing_title",
      "public_since_date",
      "frequency",
      "source",
      "has_multiple_sources"
    )
  )
  expect_equal(actual$key, "rendopar")
  expect_date(actual$public_since_date)
})

test_that("snb_toc input validation works", {
  expect_error(snb_toc(lang = "fr"))
  expect_error(snb_toc(lang = NULL))
})

test_that("parse_snb_toc() works", {
  json = readRDS(test_path("fixtures", "snb-toc.rds"))
  actual = parse_snb_toc(json)
  expect_data_table(actual, min.rows = 1L)
  expect_names(
    names(actual),
    identical.to = c("topic_id", "topic", "sub_topic", "cube_id", "chart_id", "doc_id")
  )
  expect_character(actual$topic_id, any.missing = FALSE)
})

test_that("parse_snb_toc() handles empty input", {
  actual = parse_snb_toc(list(publicationTopics = list()))
  expect_data_table(actual, nrows = 0L)
  expect_names(
    names(actual),
    identical.to = c("topic_id", "topic", "sub_topic", "cube_id", "chart_id", "doc_id")
  )
})
