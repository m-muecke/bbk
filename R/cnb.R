#' Fetch Czech National Bank (CNB) exchange rates
#'
#' Retrieve the central bank exchange rate fixing (Czech koruna against foreign currencies) from the
#' CNB API.
#'
#' @param date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   The date to query, returning rates for all currencies on that day. If `NULL`, the latest
#'   available fixing is returned. Mutually exclusive with `year`. Default `NULL`.
#' @param year (`NULL` | `integer(1)`)\cr
#'   A calendar year, returning rates for all currencies on every working day of that year. Mutually
#'   exclusive with `date`. Default `NULL`.
#' @param lang (`character(1)`)\cr
#'   Language for the country and currency names, either `"EN"` or `"CZ"`. Default `"EN"`.
#' @returns A [data.table::data.table()] with the requested exchange rates. The `rate` is the amount
#'   of Czech koruna per `amount` units of the foreign currency.
#' @source <https://api.cnb.cz/cnbapi/swagger-ui.html>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # latest fixing for all currencies
#' cnb_fx_rates()
#'
#' # all fixings for a given year
#' cnb_fx_rates(year = 2024L)
#' }
cnb_fx_rates <- function(date = NULL, year = NULL, lang = "EN") {
  date <- assert_dateish(date, null.ok = TRUE)
  year <- assert_count(year, positive = TRUE, null.ok = TRUE, coerce = TRUE)
  assert_choice(lang, c("EN", "CZ"))
  if (!is.null(date) && !is.null(year)) {
    stop("`date` and `year` are mutually exclusive.", call. = FALSE)
  }

  json <- if (is.null(year)) {
    cnb("exrates/daily", date = date %&&% format(date), lang = lang)
  } else {
    cnb("exrates/daily-year", year = year, lang = lang)
  }
  parse_cnb_fx_rates(json)
}

#' Fetch Czech National Bank (CNB) PRIBOR rates
#'
#' Retrieve the Prague Interbank Offered Rate (PRIBOR) reference rates for all maturities from the
#' CNB API.
#'
#' @param date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   The date to query. If `NULL`, the latest available rates are returned. Mutually exclusive with
#'   `year`. Default `NULL`.
#' @param year (`NULL` | `integer(1)`)\cr
#'   A calendar year, returning rates for every working day of that year. Mutually exclusive with
#'   `date`. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested rates. The `period` column holds the
#'   maturity (e.g. `"ONE_DAY"`, `"THREE_MONTH"`) and `pribor` the rate in percent.
#' @source <https://api.cnb.cz/cnbapi/swagger-ui.html>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # latest rates for all maturities
#' cnb_pribor()
#'
#' # all rates for a given year
#' cnb_pribor(year = 2024L)
#' }
cnb_pribor <- function(date = NULL, year = NULL) {
  date <- assert_dateish(date, null.ok = TRUE)
  year <- assert_count(year, positive = TRUE, null.ok = TRUE, coerce = TRUE)
  if (!is.null(date) && !is.null(year)) {
    stop("`date` and `year` are mutually exclusive.", call. = FALSE)
  }

  json <- if (is.null(year)) {
    cnb("pribor/daily", date = date %&&% format(date))
  } else {
    cnb("pribor/daily-year", year = year)
  }
  parse_cnb_pribor(json)
}

parse_cnb_fx_rates <- function(json) {
  date <- NULL
  dt <- json$rates |>
    map(as.data.table) |>
    rbindlist(fill = TRUE) |>
    setnames(convert_camel_case) |>
    setnames("valid_for", "date")
  dt[, "date" := as.Date(date)]
  cols <- c("date", "currency_code", "currency", "country", "amount", "rate")
  dt[, intersect(cols, names(dt)), with = FALSE]
}

parse_cnb_pribor <- function(json) {
  date <- NULL
  dt <- json$pribs |>
    map(\(x) as.data.table(x[lengths(x) == 1L])) |>
    rbindlist(fill = TRUE) |>
    setnames(convert_camel_case) |>
    setnames("valid_for", "date")
  dt[, "date" := as.Date(date)]
  dt[, c("date", "period", "pribor")]
}

cnb <- function(resource, ...) {
  request("https://api.cnb.cz/cnbapi") |>
    req_user_agent(bbk_user_agent()) |>
    req_url_path_append(resource) |>
    req_url_query(...) |>
    req_error(body = cnb_error_body) |>
    req_bbk_retry() |>
    req_bbk_cache() |>
    req_perform() |>
    resp_body_json()
}

cnb_error_body <- function(resp) {
  resp_body_json(resp)$description
}

#' Fetch Czech National Bank (CNB) ARAD time series data
#'
#' Retrieve time series observations from the CNB ARAD database. ARAD is the CNB's full statistical
#' database, covering monetary, financial-market, balance-of-payments, and government finance
#' statistics. Access requires an API key, which can be generated from a free account at
#' <https://www.cnb.cz/arad/>.
#'
#' @param indicator_id (`NULL` | `character()`)\cr
#'   One or more indicator identifiers to retrieve (e.g. `"SMV5M603"`). Exactly one of
#'   `indicator_id`, `set_id`, `base_id`, or `selection_id` must be provided.
#' @param set_id (`NULL` | `character(1)`)\cr
#'   A set ("sestava") identifier, returning all of its indicators.
#' @param base_id (`NULL` | `character(1)`)\cr
#'   A base identifier, returning all of its indicators.
#' @param selection_id (`NULL` | `character(1)`)\cr
#'   The identifier of a named selection ("My selections") created in your ARAD account.
#' @param start_period (`NULL` | `character(1)` | `Date(1)`)\cr
#'   Start of the period to retrieve. If `NULL`, no start restriction is applied. Default `NULL`.
#' @param end_period (`NULL` | `character(1)` | `Date(1)`)\cr
#'   End of the period to retrieve, in the same format as `start_period`. Default `NULL`.
#' @param snapshot_id (`NULL` | `character()`)\cr
#'   One or more snapshot ids to retrieve historical vintages, or `"ALL"` for every snapshot. If
#'   `NULL`, the current (non-snapshot) data is returned. See [cnb_snapshots()]. Default `NULL`.
#' @param api_key (`character(1)`)\cr
#'   API key to use for the request. Defaults to the value returned by `cnb_arad_key()`, which reads
#'   from the `CNB_ARAD_KEY` environment variable.
#' @returns A [data.table::data.table()] with columns:
#'   \item{date}{The observation period}
#'   \item{indicator_id}{The indicator identifier}
#'   \item{snapshot_id}{The snapshot identifier, or `NA` for non-snapshot data}
#'   \item{value}{The observation value}
#' @source <https://www.cnb.cz/docs/arad20/dokumentace/arad_rest_api_cs.pdf>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' # a single indicator over 24 months
#' cnb_data("SMV5M603", start_period = "2023-01-01")
#'
#' # every indicator in a set
#' cnb_data(set_id = "1058")
#' }
cnb_data <- function(
  indicator_id = NULL,
  set_id = NULL,
  base_id = NULL,
  selection_id = NULL,
  start_period = NULL,
  end_period = NULL,
  snapshot_id = NULL,
  api_key = cnb_arad_key()
) {
  assert_character(indicator_id, min.chars = 1L, null.ok = TRUE)
  assert_string(set_id, min.chars = 1L, null.ok = TRUE)
  assert_string(base_id, min.chars = 1L, null.ok = TRUE)
  assert_string(selection_id, min.chars = 1L, null.ok = TRUE)
  start_period <- assert_dateish(start_period, null.ok = TRUE)
  end_period <- assert_dateish(end_period, null.ok = TRUE)
  assert_character(snapshot_id, min.chars = 1L, null.ok = TRUE)
  assert_string(api_key, min.chars = 1L)
  indicator_id_list <- arad_scope(indicator_id, set_id, base_id, selection_id)

  dt <- arad(
    "data",
    api_key = api_key,
    indicator_id_list = indicator_id_list,
    set_id = set_id,
    base_id = base_id,
    selection_id = selection_id,
    period_from = arad_period(start_period),
    period_to = arad_period(end_period),
    snapshot_id_list = snapshot_id %&&% paste(snapshot_id, collapse = ",")
  )
  parse_cnb_data(dt)
}

#' Fetch Czech National Bank (CNB) ARAD indicators
#'
#' Retrieve the available indicators and their attributes from the CNB ARAD database. Use this to
#' discover indicator identifiers for [cnb_data()].
#'
#' @inheritParams cnb_data
#' @param lang (`character(1)`)\cr
#'   Language for the textual attributes, either `"en"` or `"cs"`. Default `"en"`.
#' @returns A [data.table::data.table()] with one row per indicator and columns including
#'   `indicator_id`, `indicator_name`, `frequency_code`, `frequency_name`, `unit_mult_code`,
#'   `unit_mult_name`, and `unit`.
#' @source <https://www.cnb.cz/docs/arad20/dokumentace/arad_rest_api_cs.pdf>
#' @family metadata
#' @export
#' @examples
#' \dontrun{
#' cnb_indicators(set_id = "1058")
#' }
cnb_indicators <- function(
  indicator_id = NULL,
  set_id = NULL,
  base_id = NULL,
  selection_id = NULL,
  lang = "en",
  api_key = cnb_arad_key()
) {
  arad_metadata("indicators", indicator_id, set_id, base_id, selection_id, lang, api_key)
}

#' Fetch Czech National Bank (CNB) ARAD dimensions
#'
#' Retrieve the dimension structure of indicators from the CNB ARAD database, returning one row per
#' indicator dimension.
#'
#' @inheritParams cnb_indicators
#' @returns A [data.table::data.table()] with columns including `indicator_id`, `base_code`,
#'   `base_name`, `dim_code`, `dim_name`, `dim_value_code`, `dim_value_name`, and `dim_rank`.
#' @source <https://www.cnb.cz/docs/arad20/dokumentace/arad_rest_api_cs.pdf>
#' @family metadata
#' @export
#' @examples
#' \dontrun{
#' cnb_dimension(indicator_id = "MIRFMDF12ERATPECD")
#' }
cnb_dimension <- function(
  indicator_id = NULL,
  set_id = NULL,
  base_id = NULL,
  selection_id = NULL,
  lang = "en",
  api_key = cnb_arad_key()
) {
  dt <- arad_metadata(
    "indicators-dims",
    indicator_id,
    set_id,
    base_id,
    selection_id,
    lang,
    api_key
  )
  parse_cnb_dimension(dt)
}

#' Fetch Czech National Bank (CNB) ARAD indicator tree
#'
#' Retrieve the placement of indicators within the ARAD topic tree.
#'
#' @inheritParams cnb_indicators
#' @returns A [data.table::data.table()] with columns `indicator_id` and `path`, where `path` is the
#'   slash-separated location of the indicator in the ARAD tree.
#' @source <https://www.cnb.cz/docs/arad20/dokumentace/arad_rest_api_cs.pdf>
#' @family metadata
#' @export
#' @examples
#' \dontrun{
#' cnb_tree(indicator_id = "MIRFMDF12ERATPECD")
#' }
cnb_tree <- function(
  indicator_id = NULL,
  set_id = NULL,
  base_id = NULL,
  selection_id = NULL,
  lang = "en",
  api_key = cnb_arad_key()
) {
  arad_metadata("indicators-tree", indicator_id, set_id, base_id, selection_id, lang, api_key)
}

#' Fetch Czech National Bank (CNB) ARAD snapshots
#'
#' Retrieve the list of available snapshots (data vintages) from the CNB ARAD database. Snapshot ids
#' can be passed to the `snapshot_id` argument of [cnb_data()].
#'
#' @inheritParams cnb_indicators
#' @returns A [data.table::data.table()] with columns `snapshot_id` and `snapshot_name`.
#' @source <https://www.cnb.cz/docs/arad20/dokumentace/arad_rest_api_cs.pdf>
#' @family metadata
#' @export
#' @examples
#' \dontrun{
#' cnb_snapshots()
#' }
cnb_snapshots <- function(lang = "en", api_key = cnb_arad_key()) {
  assert_choice(lang, c("en", "cs"))
  assert_string(api_key, min.chars = 1L)
  arad("snapshots", api_key = api_key, lang = lang)
}

arad_metadata <- function(resource, indicator_id, set_id, base_id, selection_id, lang, api_key) {
  assert_character(indicator_id, min.chars = 1L, null.ok = TRUE)
  assert_string(set_id, min.chars = 1L, null.ok = TRUE)
  assert_string(base_id, min.chars = 1L, null.ok = TRUE)
  assert_string(selection_id, min.chars = 1L, null.ok = TRUE)
  assert_choice(lang, c("en", "cs"))
  assert_string(api_key, min.chars = 1L)
  indicator_id_list <- arad_scope(indicator_id, set_id, base_id, selection_id)

  arad(
    resource,
    api_key = api_key,
    lang = lang,
    indicator_id_list = indicator_id_list,
    set_id = set_id,
    base_id = base_id,
    selection_id = selection_id
  )
}

arad_scope <- function(indicator_id, set_id, base_id, selection_id) {
  n <- sum(is.null(indicator_id), is.null(set_id), is.null(base_id), is.null(selection_id))
  if (n != 3L) {
    stop(
      "Exactly one of `indicator_id`, `set_id`, `base_id`, or `selection_id` must be provided.",
      call. = FALSE
    )
  }
  indicator_id %&&% paste(indicator_id, collapse = ",")
}

arad_period <- function(date) {
  date %&&% format(date, "%Y%m%d")
}

parse_cnb_data <- function(dt) {
  cols <- c("date", "indicator_id", "snapshot_id", "value")
  if (nrow(dt) == 0L) {
    return(data.table(
      date = as.Date(character()),
      indicator_id = character(),
      snapshot_id = character(),
      value = numeric()
    ))
  }
  period <- value <- snapshot_id <- NULL
  dt[, let(
    date = as.Date(as.character(period), "%Y%m%d"),
    value = as.numeric(gsub("[ \u00a0]", "", chartr(",", ".", value))),
    snapshot_id = replace(snapshot_id, snapshot_id %in% c("NULL", ""), NA_character_)
  )]
  dt[, cols, with = FALSE]
}

parse_cnb_dimension <- function(dt) {
  if (nrow(dt) > 0L && "dim_rank" %in% names(dt)) {
    dim_rank <- NULL
    dt[, dim_rank := as.integer(dim_rank)]
  }
  dt[]
}

arad <- function(resource, ..., api_key = cnb_arad_key()) {
  body <- request("https://www.cnb.cz/aradb/api/v1") |>
    req_user_agent(bbk_user_agent()) |>
    req_url_path_append(resource) |>
    req_url_query(..., api_key = api_key, delimiter = "pipe") |>
    req_error(body = arad_error_body) |>
    req_bbk_retry() |>
    req_bbk_cache() |>
    req_perform() |>
    resp_body_string(encoding = "windows-1250")
  fread(text = body, sep = "|", colClasses = "character")
}

arad_error_body <- function(resp) {
  if (identical(resp_content_type(resp), "application/json")) {
    json <- resp_body_json(resp)
    json$message$en %??% json$message$cs
  }
}

cnb_arad_key <- function() {
  key <- Sys.getenv("CNB_ARAD_KEY")
  if (nzchar(key)) {
    return(key)
  }
  if (is_testing()) {
    testthat::skip("CNB_ARAD_KEY env var is not configured")
  }
  stop(
    "No API key found, please supply with `api_key` argument or with CNB_ARAD_KEY env var.",
    call. = FALSE
  )
}
