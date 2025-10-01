#' Fetch Bank of Canada (BoC) data
#'
#' Retrieve time series data from the Bank of Canada Valet API.
#'
#' @param group_name (`NULL` | `character(1)`)\cr
#'   Name of the group. Only one of `group_name` or `series_name` can be used.
#' @param series_name (`NULL` | `character()`)\cr
#'   Name of the series.
#' @param start_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   Start date of the data. Default `NULL`.
#' @param end_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   End date of the data. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.bankofcanada.ca/valet/docs>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' # fetch all data for a single group
#' dt <- boc_data(group_name = "FX_RATES_DAILY")
#' head(dt)
#'
#' # or for multiple series ids
#' dt <- boc_data(
#'   series_name = c("FXUSDCAD", "FXEURCAD"),
#'   start_date = "2023-01-23",
#'   end_date = "2023-07-19"
#' )
#' head(dt)
#' }
boc_data <- function(group_name = NULL, series_name = NULL, start_date = NULL, end_date = NULL) {
  assert_string(group_name, min.chars = 1L, null.ok = TRUE)
  assert_character(series_name, min.chars = 1L, min.len = 1L, null.ok = TRUE)
  if (!is.null(group_name) && !is.null(series_name)) {
    stop("Only one of `group_name` or `series_name` must be provided.", call. = FALSE)
  }
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)
  if (!is.null(group_name)) {
    boc_group_obs(group_name, start_date, end_date)
  } else {
    boc_series_obs(series_name, start_date, end_date)
  }
}

#' Fetch Bank of Canada (BoC) metadata (details)
#'
#' @inheritParams boc_data
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.bankofcanada.ca/valet/docs>
#' @export
#' @examples
#' \dontrun{
#' boc_metadata(group_name = "FX_RATES_DAILY")
#' boc_metadata(series_name = "FXUSDCAD")
#' }
boc_metadata <- function(group_name = NULL, series_name = NULL) {
  assert_string(group_name, min.chars = 1L, null.ok = TRUE)
  assert_string(series_name, min.chars = 1L, null.ok = TRUE)
  if (!is.null(group_name) && !is.null(series_name)) {
    stop("Only one of `group_name` or `series_name` must be provided.", call. = FALSE)
  }
  if (!is.null(group_name)) boc_details_group(group_name) else boc_details_series(series_name)
}

#' Fetch Bank of Canada (BoC) available series or group
#'
#' Access all available series or groups from the Bank of Canada Valet API.
#'
#' @param type (`character(1)`)\cr
#'   Set of data to return. One of `"groups"` or `"series"`. Default `"groups"`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.bankofcanada.ca/valet/docs>
#' @export
#' @examples
#' \dontrun{
#' catalog <- boc_catalog()
#' head(catalog)
#'
#' # filter for effective exchange rate series
#' dt <- catalog[grepl("CEER", label)]
#' head(dt)
#' }
boc_catalog <- function(type = "groups") {
  assert_choice(type, c("groups", "series"))
  json <- boc("lists", type)
  lst <- json[[type]]
  dt <- rbindlist(lapply(lst, setDT))
  dt[, "name" := names(lst)]
  dt[]
}

boc_details_series <- function(name) {
  json <- boc("series", name)
  dt <- setDT(json$seriesDetails)
  dt
}

boc_details_group <- function(name) {
  json <- boc("groups", name)
  grp <- json$groupDetails
  meta <- setDT(grp[lengths(grp) == 1L])
  setnames(meta, \(x) paste("group", x, sep = "_"))
  series <- rbindlist(lapply(grp$groupSeries, setDT))
  series[, "name" := names(grp$groupSeries)]
  setnames(series, \(x) paste("series", x, sep = "_"))
  series[, names(meta) := meta]
  cols <- names(series)
  setcolorder(series, cols[startsWith(cols, "group_")])
  series[]
}

boc_series_obs <- function(name, start_date, end_date) {
  name <- paste(name, collapse = ",")
  json <- boc("observations", name, start_date = start_date, end_date = end_date)

  meta <- rbindlist(lapply(json$seriesDetail, \(x) setDT(x[lengths(x) == 1])))
  meta[, "name" := names(json$seriesDetail)]

  obs <- json$observations |>
    lapply(function(x) {
      nms <- names(x)
      x |>
        unlist(recursive = FALSE, use.names = FALSE) |>
        setDT() |>
        setnames(nms)
    }) |>
    rbindlist(fill = TRUE) |>
    setnames("d", "date") |>
    melt(
      id.vars = "date",
      variable.name = "name",
      value.name = "rate",
      na.rm = TRUE,
      variable.factor = FALSE
    )

  obs <- obs[meta, on = "name"]
  rate <- NULL
  obs[, let(date = as.Date(date), rate = as.numeric(rate))]
  obs[]
}

boc_group_obs <- function(name = "FX_RATES_DAILY", start_date = NULL, end_date = NULL) {
  json <- boc("observations/group", name)
  grp <- setDT(lapply(json$groupDetail, \(x) x %||% NA_character_))
  setnames(grp, \(x) paste("group", x, sep = "_"))
  meta <- rbindlist(lapply(json$seriesDetail, \(x) setDT(x[lengths(x) == 1])))
  meta[, "name" := names(json$seriesDetail)]
  setnames(meta, \(x) paste("series", x, sep = "_"))

  obs <- json$observations |>
    lapply(function(x) {
      nms <- names(x)
      x |>
        unlist(recursive = FALSE, use.names = FALSE) |>
        setDT() |>
        setnames(nms)
    }) |>
    rbindlist(fill = TRUE) |>
    setnames("d", "date") |>
    melt(
      id.vars = "date",
      variable.name = "name",
      value.name = "rate",
      na.rm = TRUE,
      variable.factor = FALSE
    )
  rate <- NULL
  obs[, let(date = as.Date(date), rate = as.numeric(rate))]
  setnames(obs, "name", "series_name")

  obs <- obs[meta, on = "series_name"]
  obs[, names(grp) := grp]
  obs[]
}

boc <- function(resource, name, ...) {
  request("https://www.bankofcanada.ca/valet") |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_path_append(resource, name, "json") |>
    req_url_query(...) |>
    req_error(body = boc_error_body) |>
    req_perform() |>
    resp_body_json()
}

boc_error_body <- function(resp) {
  content_type <- resp_content_type(resp)
  if (identical(content_type, "application/json")) {
    json <- resp_body_json(resp)
    msg <- json$message
    docs <- sprintf("See docs at <%s>", json$docs)
    c(msg, docs)
  }
}
