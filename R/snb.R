#' Returns Swiss National Bank (SNB) data a given id
#'
#' @param id `character(1)` id of the time series.
#' @param start_date `character(1)` | `Date(1)` start date of the time series.
#' @param end_date `character(1)` | `Date(1)` end date of the time series.
#' @param lang `character(1)` language to query, either `"en"` or `"de"`.
#'   Default `"en"`.
#' @returns A `data.table()` with the requested data.
#' @export
#' @source <https://data.snb.ch/en>
#' @family data
#' @examples
#' \dontrun{
#' snb_data("rendopar")
#' snb_data("zikrepro")
#' snb_data("devkum")
#' snb_data("ziverzq")
#' snb_data("zimoma")
#' }
snb_data <- function(id, start_date = NULL, end_date = NULL, lang = c("en", "de")) {
  stopifnot(is_valid_date(start_date), is_valid_date(end_date))
  lang <- match.arg(lang)
  res <- snb(id = id, fromDate = start_date, toDate = end_date, lang = lang)
  dt <- map(res$timeseries, function(x) {
    meta <- as.data.table(x$metadata)
    header <- x$header
    cols <- map_chr(header, "dim")
    cols <- gsub("[[:space:][:punct:]]", "_", tolower(cols))
    item <- setNames(map(header, "dimItem"), cols)
    ref <- setDT(item)

    values <- x$values
    res <- data.table(
      date = map_chr(values, "date"),
      value = map_dbl(values, "value")
    )
    cbind(meta, res, ref)
  }) |>
    rbindlist()
  dt[!nzchar(scale), scale := NA_character_]
  setnames(dt, "frequency", "freq")
  dt[, freq := substring(freq, 1L, 3L)]
  freq <- switch(dt[1, freq],
    P1M = "monthly",
    P3M = "quarterly",
    P1Y = "annual",
    P1D = "daily"
  )
  dt[, date := parse_date(date, ..freq)]
  setcolorder(dt, c("date", "key", "value", "freq"))[]
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
