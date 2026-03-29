#' Fetch Bank of Japan (BoJ) data
#'
#' Retrieve time series data from the Bank of Japan Statistics API.
#'
#' @param db (`character(1)`)\cr
#'   The database code to query (e.g., `"FM08"` for foreign exchange rates). See the
#'   [API manual](https://www.stat-search.boj.or.jp/info/api_manual_en.pdf) for available databases.
#' @param code (`character()`)\cr
#'   One or more series codes to query (e.g., `"FXERD01"` for USD/JPY spot rate). Maximum 250
#'   codes per request. All codes must have the same frequency. Use [boj_metadata()] to find
#'   available codes.
#' @param start_date (`NULL` | `character(1)` | `integer(1)`)\cr
#'   Start date of the data. Format depends on frequency: `"YYYYMMDD"` or `YYYY` for daily,
#'   `"YYYYMM"` for monthly, `"YYYYQQ"` for quarterly (where QQ is 01-04), `"YYYY"` for annual.
#'   If `NULL`, all available data is returned. Default `NULL`.
#' @param end_date (`NULL` | `character(1)` | `integer(1)`)\cr
#'   End date of the data, in the same format as start_date. If `NULL`, data up to the latest
#'   available date is returned. Default `NULL`.
#' @param lang (`character(1)`)\cr
#'   Language for series names, either `"en"` or `"jp"`. Default `"en"`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.stat-search.boj.or.jp/ssi/html/nme_a_en.html>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch USD/JPY exchange rate
#' boj_data("FM08", "FXERD01", start_date = "202401")
#'
#' # fetch multiple exchange rates
#' boj_data("FM08", c("FXERD01", "FXERD02"), start_date = "202401")
#' }
boj_data <- function(db, code, start_date = NULL, end_date = NULL, lang = "en") {
  assert_string(db, min.chars = 1L)
  assert_character(code, min.chars = 1L, min.len = 1L, max.len = 250L)
  assert_boj_date(start_date)
  assert_boj_date(end_date)
  assert_choice(lang, c("en", "jp"))

  json <- boj(
    "getDataCode",
    db = toupper(db),
    code = code,
    startDate = start_date,
    endDate = end_date,
    lang = lang
  )
  parse_boj_data(json)
}

#' Fetch Bank of Japan (BoJ) metadata
#'
#' Retrieve series metadata from the Bank of Japan Statistics API.
#'
#' @param db (`character(1)`)\cr
#'   The database code to query (e.g., `"FM08"` for foreign exchange rates).
#' @param lang (`character(1)`)\cr
#'   Language for names, either `"en"` or `"jp"`. Default `"en"`.
#' @returns A [data.table::data.table()] with the requested metadata.
#' @source <https://www.stat-search.boj.or.jp/ssi/html/nme_a_en.html>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' boj_metadata("FM08")
#' }
boj_metadata <- function(db, lang = "en") {
  assert_string(db, min.chars = 1L)
  assert_choice(lang, c("en", "jp"))

  json <- boj("getMetadata", db = toupper(db), lang = lang)
  parse_boj_metadata(json)
}

parse_boj_data <- function(json) {
  results <- json$RESULTSET
  if (length(results) == 0L) {
    return(setDT(list(
      date = as.Date(character()),
      key = character(),
      value = numeric(),
      freq = character(),
      name = character(),
      unit = character()
    )))
  }

  res <- rbindlist(map(results, function(x) {
    dates <- unlist(x$VALUES$SURVEY_DATES)
    values <- as.numeric(map(x$VALUES$VALUES, \(x) x %||% NA_real_))
    freq <- tolower(x$FREQUENCY)

    data <- list(
      date = parse_boj_date(dates, freq),
      key = x$SERIES_CODE,
      value = values,
      freq = boj_freq(freq),
      name = x$NAME_OF_TIME_SERIES %||% x$NAME_OF_TIME_SERIES_J,
      unit = x$UNIT %||% x$UNIT_J
    )
    dt <- as.data.table(data)
    na.omit(dt, cols = "value")
  }))
  res[]
}

parse_boj_metadata <- function(json) {
  results <- json$RESULTSET
  if (length(results) == 0L) {
    return(data.table(
      code = character(),
      name = character(),
      unit = character(),
      frequency = character(),
      category = character()
    ))
  }

  res <- rbindlist(map(results, function(x) {
    code <- x$SERIES_CODE
    if (is.null(code) || !nzchar(code)) {
      return(NULL)
    }
    data.table(
      code = code,
      name = x$NAME_OF_TIME_SERIES %||% x$NAME_OF_TIME_SERIES_J %||% NA_character_,
      unit = x$UNIT %||% x$UNIT_J %||% NA_character_,
      frequency = x$FREQUENCY %||% NA_character_,
      category = x$CATEGORY %||% x$CATEGORY_J %||% NA_character_
    )
  }))
  res[]
}

parse_boj_date <- function(dates, freq) {
  switch(
    freq,
    daily = ,
    `weekly(monday)` = ,
    `weekly(tuesday)` = ,
    `weekly(wednesday)` = ,
    `weekly(thursday)` = ,
    `weekly(friday)` = ,
    `weekly(saturday)` = ,
    `weekly(sunday)` = {
      as.Date(as.character(dates), format = "%Y%m%d")
    },
    monthly = as.Date(paste0(dates, "01"), format = "%Y%m%d"),
    quarterly = {
      dates_chr <- as.character(dates)
      year <- substr(dates_chr, 1L, 4L)
      quarter <- as.integer(substr(dates_chr, 5L, 6L))
      month <- sprintf("%02d", (quarter - 1L) * 3L + 1L)
      as.Date(paste0(year, month, "01"), format = "%Y%m%d")
    },
    semiannual = ,
    `semiannual(sep)` = {
      dates_chr <- as.character(dates)
      year <- substr(dates_chr, 1L, 4L)
      half <- as.integer(substr(dates_chr, 5L, 6L))
      month <- sprintf("%02d", (half - 1L) * 6L + 1L)
      as.Date(paste0(year, month, "01"), format = "%Y%m%d")
    },
    annual = ,
    `annual(mar)` = as.integer(dates),
    as.character(dates)
  )
}

boj_freq <- function(freq) {
  switch(
    freq,
    daily = "daily",
    monthly = "monthly",
    quarterly = "quarterly",
    semiannual = ,
    `semiannual(sep)` = "semi-annual",
    annual = ,
    `annual(mar)` = "annual",
    `weekly(monday)` = ,
    `weekly(tuesday)` = ,
    `weekly(wednesday)` = ,
    `weekly(thursday)` = ,
    `weekly(friday)` = ,
    `weekly(saturday)` = ,
    `weekly(sunday)` = "weekly",
    freq
  )
}

assert_boj_date <- function(x, .var.name = vname(x)) {
  assert(
    check_null(x),
    check_string(x, min.chars = 4L, pattern = "^\\d+$"),
    check_count(x, positive = TRUE),
    .var.name = .var.name
  )
  invisible(x)
}

boj_error_body <- function(resp) {
  json <- resp_body_json(resp)
  json$MESSAGE
}

boj <- function(resource, ...) {
  request("https://www.stat-search.boj.or.jp/api/v1") |>
    req_user_agent(bbk_user_agent()) |>
    req_url_path_append(resource) |>
    req_url_query(..., .multi = "comma") |>
    req_error(body = boj_error_body) |>
    req_bbk_retry() |>
    req_bbk_cache() |>
    req_perform() |>
    resp_body_json()
}
