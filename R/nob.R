#' Fetch Norges Bank (NoB) data
#'
#' Retrieve time series data from the Norges Bank SDMX Web Service.
#'
#' @param flow (`character(1)`)\cr
#'   The dataflow to query. See [nob_metadata()] for available dataflows.
#' @param key (`NULL` | `character(1)`)\cr
#'   The series key to query using dot-separated dimension values
#'   (e.g., `"B.USD.NOK.SP"`). Use `+` for multiple values in one dimension
#'   (e.g., `"B.USD+EUR.NOK.SP"`). If `NULL`, all data for the flow is returned.
#'   Default `NULL`.
#' @param start_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   Start date of the data (e.g., `"2024-01-01"` or `2024`). If `NULL`, no start date restriction
#'   is applied. Default `NULL`.
#' @param end_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   End date of the data, in the same format as start_period. If `NULL`, no end date restriction is
#'   applied. Default `NULL`.
#' @param last_n (`NULL` | `numeric(1)`)\cr
#'   Number of observations to retrieve from the end of the series. If `NULL`, no restriction is
#'   applied. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.norges-bank.no/en/topics/Statistics/open-data/>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch USD/NOK exchange rate
#' nob_data("EXR", "B.USD.NOK.SP", last_n = 5L)
#'
#' # fetch multiple exchange rates
#' nob_data("EXR", "B.USD+EUR+GBP.NOK.SP", start_period = "2024-01-01")
#'
#' # fetch policy rate
#' nob_data("IR", last_n = 5L)
#' }
nob_data <- function(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  last_n = NULL
) {
  assert_string(flow, min.chars = 1L)
  assert_string(key, min.chars = 1L, null.ok = TRUE)
  assert_period(start_period)
  assert_period(end_period)
  last_n <- assert_count(last_n, null.ok = TRUE, positive = TRUE, coerce = TRUE)

  flow <- toupper(flow)
  resource <- if (is.null(key)) sprintf("data/%s", flow) else sprintf("data/%s/%s", flow, key)
  xml <- nob(
    resource,
    startPeriod = start_period,
    endPeriod = end_period,
    lastNObservations = last_n
  )
  parse_nob_data(xml)
}

#' Fetch Norges Bank (NoB) metadata
#'
#' Retrieve metadata from the Norges Bank SDMX Web Service.
#'
#' @param type (`character(1)`)\cr
#'   The type of metadata to query.
#'   One of: `"datastructure"`, `"dataflow"`, or `"codelist"`.
#' @param id (`NULL` | `character(1)`)\cr
#'   The id to query. Default `NULL`.
#' @param lang (`character(1)`)\cr
#'   Language for names, either `"en"` or `"no"`. Default `"en"`.
#' @returns A [data.table::data.table()] with the requested metadata.
#' @source <https://www.norges-bank.no/en/topics/Statistics/open-data/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' nob_metadata("dataflow")
#' nob_metadata("datastructure")
#' nob_metadata("codelist", "CL_CURRENCY")
#' }
nob_metadata <- function(type, id = NULL, lang = "en") {
  assert_choice(type, c("datastructure", "dataflow", "codelist"))
  assert_string(id, min.chars = 1L, null.ok = TRUE)
  assert_choice(lang, c("en", "no"))

  xpath <- switch(
    type,
    datastructure = "//str:DataStructure",
    dataflow = "//str:Dataflow",
    codelist = "//str:Codelist"
  )
  resource <- if (is.null(id)) type else paste(type, "NB", toupper(id), sep = "/")
  xml <- nob(resource)
  entries <- xml2::xml_find_all(xml, xpath)
  parse_nob_metadata(entries, lang)
}

parse_nob_data <- function(xml) {
  ns <- xml2::xml_ns(xml)
  series <- xml2::xml_find_all(xml, ".//Series", ns)
  res <- lapply(series, function(x) {
    attrs <- xml2::xml_attrs(x)
    nms <- tolower(names(attrs))
    names(attrs) <- nms

    obs <- xml2::xml_find_all(x, ".//Obs", ns)
    obs_attrs <- lapply(obs, xml2::xml_attrs)
    date <- vapply(obs_attrs, \(x) x[["TIME_PERIOD"]], character(1L))
    value <- as.numeric(vapply(obs_attrs, \(x) x[["OBS_VALUE"]], character(1L)))

    key <- paste(
      attrs[!nms %in% c("collection", "calculated", "decimals", "unit_mult")],
      collapse = "."
    )

    freq <- switch(
      attrs[["freq"]],
      A = "annual",
      S = "semi-annual",
      Q = "quarterly",
      M = "monthly",
      W = "weekly",
      B = ,
      D = "daily"
    )

    extra <- attrs[!nms %in% c("freq", "collection", "calculated", "decimals", "unit_mult")]
    data <- c(
      list(date = parse_date(date, freq), key = key, value = value, freq = freq),
      as.list(extra)
    )
    as.data.table(data)
  })
  res <- res |>
    rbindlist(fill = TRUE) |>
    setcolorder(col_order, skip_absent = TRUE)
  res
}

parse_nob_metadata <- function(x, lang = "en") {
  rbindlist(lapply(x, function(node) {
    id <- xml2::xml_attr(node, "id")
    nms <- node |>
      xml2::xml_find_all(sprintf(".//com:Name[@xml:lang='%s']", lang)) |>
      xml2::xml_text()
    data.table(id = id, name = nms)
  }))
}

nob_error_body <- function(resp) {
  resp_body_string(resp, "UTF-8")
}

nob <- function(resource, ...) {
  request("https://data.norges-bank.no/api") |>
    req_user_agent(bbk_user_agent()) |>
    req_url_path_append(resource) |>
    req_url_query(...) |>
    req_error(body = nob_error_body) |>
    req_bbk_cache() |>
    req_perform() |>
    resp_body_xml()
}
