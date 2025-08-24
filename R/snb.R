#' Fetch Swiss National Bank (SNB) data
#'
#' Retrieve time series data from the SNB data portal.
#'
#' @param key (`character(1)`)\cr
#'   The series key to query.
#' @param start_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   Start date of the data.
#' @param end_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   End date of the data.
#' @param lang (`character(1)`)\cr
#'   Language to query, either `"en"` or `"de"`. Default `"en"`.
#' @returns A [data.table::data.table()] with the requested data.
#' @export
#' @source <https://data.snb.ch/en>
#' @family data
#' @examplesIf curl::has_internet()
#' \donttest{
#' snb_data("rendopar")
#' # or filter for date range
#' snb_data("rendopar", "2020-01-01", "2020-12-31")
#' }
snb_data <- function(key, start_date = NULL, end_date = NULL, lang = "en") {
  assert_string(key, min.chars = 1L)
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)
  assert_choice(lang, c("en", "de"))

  json <- snb(id = key, fromDate = start_date, toDate = end_date, lang = lang)
  parse_snb_data(json)
}

parse_snb_data <- function(json) {
  dt <- json$timeseries |>
    lapply(function(x) {
      meta <- as.data.table(x$metadata)
      header <- x$header
      cols <- vapply(header, \(x) x$dim, character(1L))
      cols <- gsub("[[:space:][:punct:]]", "_", tolower(cols))
      item <- setNames(lapply(header, \(x) x$dimItem), cols)
      ref <- setDT(item)
      vals <- x$values
      vals <- data.table(
        date = vapply(vals, \(x) x$date, character(1L)),
        value = vapply(vals, \(x) x$value, numeric(1L))
      )
      vals[, names(meta) := meta]
      vals[, names(ref) := ref]
    }) |>
    rbindlist()

  dt[!nzchar(scale), scale := NA_character_]
  setnames(dt, "frequency", "duration")
  duration <- NULL
  dt[, duration := substring(duration, 1L, 3L)]
  freq <- switch(
    dt[1L, duration],
    P1M = "monthly",
    P3M = "quarterly",
    P1Y = "annual",
    P1D = "daily"
  )
  dt[, let(date = parse_date(date, freq), freq = freq)]
  setcolorder(dt, the$col_order, skip_absent = TRUE)
  dt[]
}

snb <- function(id, ..., lang = "en") {
  url <- sprintf("https://data.snb.ch/api/cube/%s/data/json", id)
  request(url) |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_path_append(lang) |>
    req_url_query(...) |>
    req_error(body = snb_error_body) |>
    req_perform() |>
    resp_body_json(check_type = FALSE)
}

snb_error_body <- function(resp) {
  body <- resp_body_string(resp, "UTF-8")
  msg <- jsonlite::fromJSON(body)
  docs <- "See docs at <https://data.snb.ch/en>"
  c(msg$message, docs)
}
