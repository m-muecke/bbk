#' Fetch Banco de Portugal (BdP) data
#'
#' Retrieve time series data from the BPstat API.
#'
#' @details
#' The BPstat API uses a two-step workflow: first look up the series metadata with
#' [bdp_series()] to find the `domain_id` and `dataset_id`, then use those to fetch the actual
#' observations.
#'
#' You can browse available series at the [BPstat portal](https://bpstat.bportugal.pt).
#'
#' @param domain_id (`integer(1)`)\cr
#'   The domain ID. Use [bdp_domain()] to list available domains.
#' @param dataset_id (`character(1)`)\cr
#'   The dataset ID within the domain.
#' @param series_ids (`NULL` | `integer()`)\cr
#'   Optional series IDs to filter the dataset.
#' @param start_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   Start date of the data.
#' @param end_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   End date of the data.
#' @param last_n (`NULL` | `integer(1)`)\cr
#'   Return only the last `n` observations per series.
#' @param lang (`character(1)`)\cr
#'   Language for labels, either `"en"` or `"pt"`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://bpstat.bportugal.pt/data/docs>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # Portuguese GDP (annual, current prices)
#' bdp_data(54L, "ce3e4e50cda325537eff729ef64037cd", series_ids = 12518356L)
#' }
bdp_data <- function(
  domain_id,
  dataset_id,
  series_ids = NULL,
  start_date = NULL,
  end_date = NULL,
  last_n = NULL,
  lang = "en"
) {
  domain_id <- assert_count(domain_id, positive = TRUE, coerce = TRUE)
  assert_string(dataset_id, min.chars = 1L)
  assert_integerish(series_ids, lower = 1L, null.ok = TRUE)
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)
  last_n <- assert_count(last_n, positive = TRUE, null.ok = TRUE, coerce = TRUE)
  assert_choice(lang, c("en", "pt"))

  json <- bdp(
    "domains",
    domain_id,
    "datasets",
    dataset_id,
    lang = lang,
    series_ids = series_ids,
    obs_since = start_date,
    obs_to = end_date,
    obs_last_n = last_n
  )
  parse_bdp_data(json)
}

parse_bdp_data <- function(json) {
  time_dim <- json$role$time[[1L]]
  dates <- unlist(json$dimension[[time_dim]]$category$index, use.names = FALSE)
  n_dates <- length(dates)
  values <- unlist(json$value, use.names = FALSE)
  n_series <- length(values) %/% n_dates

  dt <- data.table(
    date = as.Date(rep(dates, times = n_series)),
    value = values,
    status = unlist(json$status, use.names = FALSE)
  )

  series <- json$extension$series
  if (!is.null(series)) {
    dt[, "key" := rep(map_int(series, "id"), each = n_dates)]
    dt[, "title" := rep(map_chr(series, "label"), each = n_dates)]
  }

  dt[, "freq" := bdp_freq(dates)]
  setcolorder(dt, col_order, skip_absent = TRUE)
  dt[]
}

bdp_freq <- function(dates) {
  if (length(dates) < 2L) {
    return("annual")
  }
  d <- as.Date(dates)
  diff_days <- as.integer(diff(d[1:2]))
  if (diff_days <= 1L) {
    "daily"
  } else if (diff_days <= 35L) {
    "monthly"
  } else if (diff_days <= 100L) {
    "quarterly"
  } else {
    "annual"
  }
}

#' Fetch Banco de Portugal (BdP) series metadata
#'
#' Retrieve metadata for one or more series from the BPstat API. This is useful to discover the
#' `domain_id` and `dataset_id` needed for [bdp_data()].
#'
#' @param series_ids (`integer()`)\cr
#'   One or more series IDs to look up.
#' @param lang (`character(1)`)\cr
#'   Language for labels, either `"en"` or `"pt"`.
#' @returns A [data.table::data.table()] with series metadata including `domain_id` and
#'   `dataset_id`.
#' @source <https://bpstat.bportugal.pt/data/docs>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bdp_series(12518356L)
#' }
bdp_series <- function(series_ids, lang = "en") {
  assert_integerish(series_ids, lower = 1L, min.len = 1L)
  assert_choice(lang, c("en", "pt"))

  json <- bdp("series", lang = lang, series_ids = series_ids)
  parse_bdp_series(json)
}

parse_bdp_series <- function(json) {
  dt <- data.table(
    id = map_int(json, "id"),
    label = map_chr(json, "label"),
    short_label = map_chr(json, "short_label"),
    description = map_chr(json, "description"),
    dataset_id = map_chr(json, "dataset_id"),
    domain_id = map_int(json, \(x) x$domain_ids[[1L]]),
    obs_updated_at = map_chr(json, "obs_updated_at")
  )
  obs_updated_at <- NULL
  dt[, obs_updated_at := as.POSIXct(obs_updated_at, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]
  dt[]
}

#' Fetch Banco de Portugal (BdP) datasets
#'
#' Retrieve the list of datasets for a given domain from the BPstat API.
#'
#' @inheritParams bdp_data
#' @returns A [data.table::data.table()] with available datasets.
#' @source <https://bpstat.bportugal.pt/data/docs>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bdp_dataset(54L)
#' }
bdp_dataset <- function(domain_id, lang = "en") {
  domain_id <- assert_count(domain_id, positive = TRUE, coerce = TRUE)
  assert_choice(lang, c("en", "pt"))

  req <- bdp_request("domains", domain_id, "datasets", lang = lang)
  items <- req |>
    req_perform_iterative(next_req = bdp_next_req, max_reqs = Inf) |>
    resps_data(\(resp) resp_body_json(resp)$link$item)
  parse_bdp_dataset(items)
}

bdp_next_req <- function(resp, req) {
  next_url <- resp_body_json(resp)$extension$next_page
  if (is.null(next_url)) {
    return()
  }
  req_url(req, next_url)
}

parse_bdp_dataset <- function(items) {
  data.table(
    id = map_chr(items, \(x) x$extension$id),
    label = map_chr(items, "label"),
    num_series = map_int(items, \(x) x$extension$num_series),
    obs_updated_at = as.POSIXct(
      map_chr(items, \(x) x$extension$obs_updated_at),
      format = "%Y-%m-%dT%H:%M:%SZ",
      tz = "UTC"
    )
  )
}

#' Fetch Banco de Portugal (BdP) dimensions
#'
#' Retrieve the list of dimensions for a given domain, or the categories within a single dimension.
#'
#' @inheritParams bdp_data
#' @param dimension_id (`NULL` | `integer(1)`)\cr
#'   Optional dimension ID. If `NULL`, all dimensions for the domain are returned. If specified,
#'   the categories within that dimension are returned.
#' @returns A [data.table::data.table()] with dimensions or categories.
#' @source <https://bpstat.bportugal.pt/data/docs>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bdp_dimension(54L)
#' }
bdp_dimension <- function(domain_id, dimension_id = NULL, lang = "en") {
  domain_id <- assert_count(domain_id, positive = TRUE, coerce = TRUE)
  dimension_id <- assert_count(dimension_id, positive = TRUE, null.ok = TRUE, coerce = TRUE)
  assert_choice(lang, c("en", "pt"))

  if (is.null(dimension_id)) {
    req <- bdp_request("domains", domain_id, "dimensions", lang = lang)
    items <- req |>
      req_perform_iterative(next_req = bdp_next_req, max_reqs = Inf) |>
      resps_data(\(resp) resp_body_json(resp)$link$item)
    parse_bdp_dimension(items)
  } else {
    json <- bdp("domains", domain_id, "dimensions", dimension_id, lang = lang)
    parse_bdp_category(json)
  }
}

parse_bdp_dimension <- function(items) {
  data.table(
    id = map_int(items, \(x) x$extension$id),
    label = map_chr(items, "label"),
    description = map_chr(items, \(x) x$extension$description)
  )
}

parse_bdp_category <- function(json) {
  labels <- json$category$label
  data.table(
    id = as.integer(names(labels)),
    label = unlist(labels, use.names = FALSE)
  )
}

#' Fetch Banco de Portugal (BdP) domains
#'
#' Retrieve the list of available statistical domains from the BPstat API, or details for a single
#' domain.
#'
#' @param domain_id (`NULL` | `integer(1)`)\cr
#'   Optional domain ID. If `NULL`, all domains are returned.
#' @inheritParams bdp_series
#' @returns A [data.table::data.table()] with available domains.
#' @source <https://bpstat.bportugal.pt/data/docs>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bdp_domain()
#' }
bdp_domain <- function(domain_id = NULL, lang = "en") {
  domain_id <- assert_count(domain_id, positive = TRUE, null.ok = TRUE, coerce = TRUE)
  assert_choice(lang, c("en", "pt"))

  json <- bdp("domains", domain_id, lang = lang)
  if (!is.null(domain_id)) {
    json <- list(json)
  }
  parse_bdp_domain(json)
}

parse_bdp_domain <- function(json) {
  data.table(
    id = map_int(json, "id"),
    parent_id = map_int(json, \(x) x$parent_id %??% NA_integer_),
    label = map_chr(json, "label"),
    short_label = map_chr(json, "short_label"),
    has_series = map_lgl(json, "has_series"),
    num_series = map_int(json, \(x) x$num_series %??% NA_integer_),
    num_datasets = map_int(json, \(x) x$num_datasets %??% NA_integer_)
  )
}

bdp <- function(
  ...,
  lang = "en",
  series_ids = NULL,
  obs_since = NULL,
  obs_to = NULL,
  obs_last_n = NULL
) {
  bdp_request(
    ...,
    lang = lang,
    series_ids = series_ids,
    obs_since = obs_since,
    obs_to = obs_to,
    obs_last_n = obs_last_n
  ) |>
    req_perform() |>
    resp_body_json()
}

bdp_request <- function(
  ...,
  lang = "en",
  series_ids = NULL,
  obs_since = NULL,
  obs_to = NULL,
  obs_last_n = NULL
) {
  request("https://bpstat.bportugal.pt/data/v1") |>
    req_user_agent(bbk_user_agent()) |>
    req_url_path_append(...) |>
    req_url_query(
      lang = toupper(lang),
      series_ids = series_ids,
      obs_since = obs_since,
      obs_to = obs_to,
      obs_last_n = obs_last_n,
      .multi = "comma"
    ) |>
    req_error(body = bdp_error_body) |>
    req_bbk_retry() |>
    req_bbk_cache()
}

bdp_error_body <- function(resp) {
  content_type <- resp_content_type(resp)
  if (identical(content_type, "application/json")) {
    json <- resp_body_json(resp)
    msg <- json$detail %??% json$message
    docs <- "See docs at <https://bpstat.bportugal.pt/data/docs>"
    c(msg, docs)
  }
}
