#' Returns Swiss National Bank (SNB) data for a given id
#'
#' @param id (`character(1)`) id of the time series.
#' @param start_date (`character(1)` | `Date(1)`) start date of the time series.
#' @param end_date (`character(1)` | `Date(1)`) end date of the time series.
#' @param lang (`character(1)`) language to query, either `"en"` or `"de"`.
#'   Default `"en"`.
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
snb_data <- function(id, start_date = NULL, end_date = NULL, lang = c("en", "de")) {
  stopifnot(
    is_string(id),
    is_valid_date(start_date),
    is_valid_date(end_date)
  )
  lang <- match.arg(lang)
  body <- snb(id = id, fromDate = start_date, toDate = end_date, lang = lang)
  dt <- parse_snb_data(body)
  dt
}

parse_snb_data <- function(body) {
  res <- lapply(body$timeseries, function(x) {
    meta <- as.data.table(x$metadata)
    header <- x$header
    cols <- vapply(header, \(x) x$dim, character(1))
    cols <- gsub("[[:space:][:punct:]]", "_", tolower(cols))
    item <- setNames(lapply(header, \(x) x$dimItem), cols)
    ref <- setDT(item)

    values <- x$values
    res <- data.table(
      date = vapply(values, \(x) x$date, character(1L)),
      value = vapply(values, \(x) x$value, numeric(1L))
    )
    cbind(meta, res, ref)
  })
  dt <- rbindlist(res)
  dt[!nzchar(scale), scale := NA_character_]
  setnames(dt, "frequency", "duration")
  dt[, duration := substring(duration, 1L, 3L)]
  freq <- switch(dt[1L, duration],
    P1M = "monthly",
    P3M = "quarterly",
    P1Y = "annual",
    P1D = "daily"
  )
  dt[, let(date = parse_date(date, freq), freq = freq)]
  setcolorder(dt, c("date", "key", "value", "freq"))
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
    resp_body_string("UTF-8") |>
    jsonlite::fromJSON(simplifyDataFrame = FALSE)
}

snb_error_body <- function(resp) {
  body <- resp_body_string(resp, "UTF-8")
  msg <- jsonlite::fromJSON(body)
  docs <- "See docs at <https://data.snb.ch/en>"
  c(msg$message, docs)
}
