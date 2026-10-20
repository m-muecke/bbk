test_that("boc_data input validation works", {
  expect_error(boc_data())
  expect_error(boc_data(group_name = "a", series_name = "b"))
  expect_error(boc_data(group_name = 1L))
  expect_error(boc_data(series_name = 1L))
  expect_error(boc_data(series_name = NA_character_), "Contains missing values")
  expect_error(boc_data(series_name = character()), "Must have length >= 1")
})

test_that("boc_data returns an empty table for a window without observations", {
  series_detail = list(
    FXUSDCAD = list(
      label = "USD/CAD",
      description = "Daily average exchange rate",
      dimension = list(key = "d", name = "Date"),
      metadata = list(unit = "Canadian dollars per US dollar", frequency = "Business daily")
    )
  )
  group_detail = list(
    label = "Daily exchange rates",
    description = "The daily average exchange rates",
    link = "https://www.bankofcanada.ca/",
    metadata = list(
      unit = "Canadian dollars per foreign currency unit",
      frequency = "Business daily"
    )
  )

  local_mocked_bindings(
    boc = \(...) list(seriesDetail = series_detail, observations = list())
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

test_that("boc_metadata works for a series", {
  series_details = list(
    name = "FXUSDCAD",
    label = "USD/CAD",
    description = "Daily average exchange rate",
    dateFormat = "daily",
    metadata = list(frequency = "Business daily", unit = "Canadian dollars per US dollar")
  )
  local_mocked_bindings(boc = \(...) list(seriesDetails = series_details))
  dt = boc_metadata(series_name = "FXUSDCAD")
  expect_data_table(dt, nrows = 1L)
  expect_named(dt, c("name", "label", "description", "dateFormat"))
})

test_that("boc_metadata works for a group with a single series", {
  group_detail = list(
    name = "G",
    label = "Group",
    description = "A group",
    metadata = list(unit = "Canadian dollars"),
    groupSeries = list(S1 = list(label = "Series 1", link = "https://www.bankofcanada.ca/"))
  )
  local_mocked_bindings(boc = \(...) list(groupDetail = group_detail))
  dt = boc_metadata(group_name = "G")
  expect_named(
    dt,
    c(
      "group_name",
      "group_label",
      "group_description",
      "series_label",
      "series_link",
      "series_name"
    )
  )
  expect_identical(dt$series_name, "S1")
})
