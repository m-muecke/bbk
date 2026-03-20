#' Fetch Sveriges Riksbank (SRb) data
#'
#' Retrieve time series data from the Sveriges Riksbank SWEA API.
#'
#' @param series (`character(1)`)\cr
#'   The series ID to query. See [srb_series()] for available series.
#' @param start_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   Start date of the data (e.g., `"2024-01-01"`). If `NULL`, all available data is returned.
#'   Default `NULL`.
#' @param end_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   End date of the data, in the same format as start_date. If `NULL`, data up to the latest
#'   available date is returned. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://developer.api.riksbank.se/>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch USD/SEK exchange rate
#' srb_data("SEKUSDPMI", start_date = "2024-01-01")
#'
#' # fetch EUR/SEK exchange rate
#' srb_data("SEKEURPMI", start_date = "2024-01-01")
#' }
srb_data <- function(series, start_date = NULL, end_date = NULL) {
  assert_string(series, min.chars = 1L)
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)

  if (is.null(start_date) || is.null(end_date)) {
    meta <- srb("Observations/Latest", series)
    start_date <- start_date %??% as.Date("1900-01-01")
    end_date <- end_date %??% as.Date(meta$date)
  }

  json <- srb("Observations", series, format(start_date), format(end_date))
  parse_srb_data(json, series)
}

#' Fetch Sveriges Riksbank (SRb) series metadata
#'
#' Retrieve available series or group metadata from the Sveriges Riksbank SWEA API.
#'
#' @param type (`character(1)`)\cr
#'   The type of metadata to query. One of `"series"` or `"groups"`. Default `"series"`.
#' @returns A [data.table::data.table()] with the requested metadata.
#' @source <https://developer.api.riksbank.se/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' srb_series()
#' }
srb_series <- function(type = "series") {
  assert_choice(type, c("series", "groups"))
  json <- srb(if (type == "series") "Series" else "Groups")
  if (type == "series") parse_srb_series(json) else parse_srb_groups(json)
}

parse_srb_data <- function(json, series) {
  if (length(json) == 0L) {
    return(data.table(date = as.Date(character()), series = character(), value = numeric()))
  }
  value <- NULL
  dt <- rbindlist(lapply(json, setDT))
  dt[, let(
    date = as.Date(date),
    series = toupper(series),
    value = as.numeric(value)
  )]
  setcolorder(dt, c("date", "series", "value"))
  dt[]
}

parse_srb_series <- function(json) {
  dt <- json |>
    lapply(\(x) setDT(lapply(x, \(v) v %??% NA_character_))) |>
    rbindlist() |>
    setnames(convert_camel_case)
  dt[]
}

parse_srb_groups <- function(json) {
  flatten_groups <- function(groups) {
    res <- list()
    for (g in groups) {
      children <- g$childGroups
      g$childGroups <- NULL
      res <- c(res, list(setDT(lapply(g, \(v) v %??% NA_character_))))
      if (length(children) > 0L) {
        res <- c(res, flatten_groups(children))
      }
    }
    res
  }

  dt <- json |>
    flatten_groups() |>
    rbindlist() |>
    setnames(convert_camel_case)
  dt[]
}

#' Fetch Sveriges Riksbank (SRb) calendar days
#'
#' Retrieve Swedish banking calendar information from the Sveriges Riksbank SWEA API.
#'
#' @param start_date (`Date(1)` | `character(1)`)\cr
#'   Start date of the range (e.g., `"2024-01-01"`).
#' @param end_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   End date of the range. If `NULL`, data up to the latest available date is returned.
#'   Default `NULL`.
#' @returns A [data.table::data.table()] with the calendar day information.
#' @source <https://developer.api.riksbank.se/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' srb_calendar("2024-01-01", "2024-01-31")
#' }
srb_calendar <- function(start_date, end_date = NULL) {
  start_date <- assert_dateish(start_date)
  end_date <- assert_dateish(end_date, null.ok = TRUE)

  args <- list("CalendarDays", format(start_date))
  if (!is.null(end_date)) {
    args <- c(args, format(end_date))
  }
  json <- do.call(srb, args)
  parse_srb_calendar(json)
}

parse_srb_calendar <- function(json) {
  dt <- json |>
    lapply(setDT) |>
    rbindlist() |>
    setnames(convert_camel_case)
  dt[, calendar_date := as.Date(calendar_date)]
  dt[]
}

srb <- function(...) {
  request("https://api.riksbank.se/swea/v1") |>
    req_user_agent(bbk_user_agent()) |>
    req_url_path_append(...) |>
    req_error(body = srb_error_body) |>
    req_bbk_retry() |>
    req_bbk_cache() |>
    req_perform() |>
    resp_body_json()
}

srb_error_body <- function(resp) {
  resp_body_string(resp, "UTF-8")
}
