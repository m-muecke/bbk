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

  json <- srb("Observations", series, start_date, end_date)
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
#' srb_series("groups")
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
  dt <- rbindlist(lapply(json, function(x) {
    setDT(lapply(x, \(v) v %??% NA_character_))
  }))
  nms <- convert_camel_case(names(dt))
  setnames(dt, nms)
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
  dt <- rbindlist(flatten_groups(json))
  nms <- convert_camel_case(names(dt))
  setnames(dt, nms)
  dt[]
}

srb_error_body <- function(resp) {
  resp_body_string(resp, "UTF-8")
}

srb <- function(...) {
  request("https://api.riksbank.se/swea/v1") |>
    req_user_agent(bbk_user_agent()) |>
    req_url_path_append(...) |>
    req_error(body = srb_error_body) |>
    req_bbk_cache() |>
    req_perform() |>
    resp_body_json()
}
