test_that("boc_data input validation works", {
  expect_error(boc_data())
  expect_error(boc_data(group_name = "a", series_name = "b"))
  expect_error(boc_data(group_name = 1L))
  expect_error(boc_data(series_name = 1L))
})

test_that("boc_data returns an empty table for a window without observations", {
  series_detail = list(
    FXUSDCAD = list(
      label = "USD/CAD",
      description = "Daily average exchange rate",
      dimension = list(key = "d", name = "Date")
    )
  )
  group_detail = list(
    label = "Daily exchange rates",
    description = "The daily average exchange rates",
    link = "https://www.bankofcanada.ca/"
  )

  local_mocked_bindings(
    boc = function(...) list(seriesDetail = series_detail, observations = list())
  )
  dt = boc_data(series_name = "FXUSDCAD", start_date = "2024-01-06", end_date = "2024-01-07")
  expect_data_table(dt, nrows = 0L)
  expect_named(dt, c("label", "description", "name", "date", "value"))
  expect_date(dt$date)
  expect_double(dt$value)

  local_mocked_bindings(
    boc = function(...) {
      list(groupDetail = group_detail, seriesDetail = series_detail, observations = list())
    }
  )
  dt = boc_data(group_name = "FX_RATES_DAILY", start_date = "2024-01-06", end_date = "2024-01-07")
  expect_data_table(dt, nrows = 0L)
  expect_named(
    dt,
    c(
      "series_label",
      "series_description",
      "series_name",
      "date",
      "value",
      "group_label",
      "group_description",
      "group_link"
    )
  )
  expect_date(dt$date)
  expect_double(dt$value)
})
