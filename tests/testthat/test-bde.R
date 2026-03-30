test_that("bde_data input validation works", {
  # series should be a character()
  expect_error(bde_data(1L))
  expect_error(bde_data(TRUE))
  expect_error(bde_data(NULL))
})

test_that("bde_latest input validation works", {
  expect_error(bde_latest(1L))
  expect_error(bde_latest(TRUE))
  expect_error(bde_latest(NULL))
  expect_error(bde_latest("abc", lang = "fr"))
})

test_that("bde_latest works", {
  json <- readRDS(test_path("fixtures", "bde-latest.rds"))
  dt <- rbindlist(map(json, setDT))
  # fmt: skip
  old_cols <- c("serie", "descripcionCorta", "codFrecuencia", "decimales", "simbolo", "tendencia", "fechaValor", "valor") # nolint
  new_cols <- c("key", "title", "freq", "decimals", "symbol", "trend", "date", "value")
  setnames(dt, old_cols, new_cols)
  dt[, date := as.POSIXct(date, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]
  expect_data_table(dt, nrows = 2L)
  expect_names(names(dt), must.include = c("key", "title", "value", "date"))
  expect_posixct(dt$date)
})

test_that("parse_bde_data works", {
  json <- readRDS(test_path("fixtures", "bde-data.rds"))
  actual <- parse_bde_data(json)
  expect_data_table(actual, min.rows = 1L)
  expect_identical(
    unique(actual$key),
    c("DTNPDE2010_P0000P_PS_APU", "DTNSEC2010_S0000P_APU_SUMAMOVIL")
  )
  expect_posixct(actual$date)
  expect_false(any(unlist(map(actual, class)) == "list"))
})
