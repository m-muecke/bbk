#' Fetch European Central Bank (ECB) data
#'
#' Retrieve time series data from the ECB SDMX Web Service.
#'
#' @param flow (`character(1)`)\cr
#'   Flow to query.
#' @param key (`character()`)\cr
#'   The series keys to query.
#' @param start_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   Start date of the data. Supported formats:
#'   * YYYY for annual data (e.g., `2019`)
#'   * YYYY-S\[1-2\] for semi-annual data (e.g., `"2019-S1"`)
#'   * YYYY-Q\[1-4\] for quarterly data (e.g., `"2019-Q1"`)
#'   * YYYY-MM for monthly data (e.g., `"2019-01"`)
#'   * YYYY-W\[01-53\] for weekly data (e.g., `"2019-W01"`)
#'   * YYYY-MM-DD for daily and business data (e.g., `"2019-01-01"`)
#'
#'   If `NULL`, no start date restriction is applied (data retrieved from the earliest available
#'   date). Default `NULL`.
#' @param end_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   End date of the data, in the same format as start_period. If `NULL`, no end date restriction is
#'   applied (data retrieved up to the most recent available date). Default `NULL`.
#' @param first_n (`NULL` | `numeric(1)`)\cr
#'   Number of observations to retrieve from the start of the series. If `NULL`, no restriction is
#'   applied. Default `NULL`.
#' @param last_n (`NULL` | `numeric(1)`)\cr
#'   Number of observations to retrieve from the end of the series. If `NULL`, no restriction is
#'   applied. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://data.ecb.europa.eu/help/api/data>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch US dollar/Euro exchange rate
#' ecb_data("EXR", "D.USD.EUR.SP00.A")
#' # fetch data for multiple keys
#' ecb_data("EXR", c("D.USD", "JPY.EUR.SP00.A"))
#' }
ecb_data <- function(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL
) {
  assert_string(flow, min.chars = 1L)
  assert_character(key, min.chars = 1L, null.ok = TRUE)
  assert_period(start_period)
  assert_period(end_period)
  first_n <- assert_count(first_n, null.ok = TRUE, positive = TRUE, coerce = TRUE)
  last_n <- assert_count(last_n, null.ok = TRUE, positive = TRUE, coerce = TRUE)

  key <- if (!is.null(key)) paste(key, collapse = "+") else "all"
  resource <- paste("data", flow, key, sep = "/")
  xml <- ecb(
    resource = resource,
    startPeriod = start_period,
    endPeriod = end_period,
    firstNObservations = first_n,
    lastNObservations = last_n
  )
  parse_ecb_data(xml)
}

#' Fetch European Central Bank (ECB) metadata
#'
#' Retrieve metadata from the ECB time series database via the SDMX Web Service.
#'
#' @param type (`character(1)`)\cr
#'   The type of metadata to query. One of: `"datastructure"`, `"dataflow"`, `"codelist"`, or
#'   `"concept"`.
#' @param agency (`NULL` | `character(1)`)\cr
#'   The id of the agency to query. Default `NULL`.
#' @param id (`NULL` | `character(1)`)\cr
#'   The id of the resource to query. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested metadata.
#' The columns are:
#'   \item{agency}{The agency of the metadata}
#'   \item{id}{The id of the metadata}
#'   \item{name}{The name of the metadata}
#' @source <https://data.ecb.europa.eu/help/api/metadata>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' ecb_metadata("datastructure")
#' ecb_metadata("datastructure", "ECB")
#' ecb_metadata("datastructure", "ECB", "ECB_EXR1")
#' ecb_metadata("datastructure", id = "ECB_EXR1")
#' }
ecb_metadata <- function(type, agency = NULL, id = NULL) {
  assert_choice(type, c("datastructure", "dataflow", "codelist", "concept"))
  args <- switch(
    type,
    datastructure = list("datastructure", "//str:DataStructure"),
    dataflow = list("dataflow", "//str:Dataflow"),
    codelist = list("codelist", "//str:Codelist"),
    concept = list("conceptscheme", "//str:ConceptScheme")
  )
  do.call(fetch_ecb_metadata, c(args, list(agency, id)))
}

fetch_ecb_metadata <- function(resource, xpath, agency = NULL, id = NULL) {
  assert_string(agency, min.chars = 1L, null.ok = TRUE)
  assert_string(id, min.chars = 1L, null.ok = TRUE)

  agency <- if (!is.null(agency)) toupper(agency) else "all"
  id <- if (!is.null(id)) toupper(id) else "all"
  resource <- paste(resource, agency, id, sep = "/")
  xml <- ecb(resource)
  entries <- xml2::xml_find_all(xml, xpath)
  parse_ecb_metadata(entries)
}

parse_ecb_data <- function(xml) {
  series <- xml2::xml_find_all(xml, ".//generic:Series")
  res <- lapply(series, function(x) {
    series_key <- x |>
      xml2::xml_find_first(".//generic:SeriesKey") |>
      xml2::xml_children()
    nms <- series_key |>
      xml2::xml_attr("id") |>
      tolower()
    series_key <- series_key |>
      xml2::xml_attr("value") |>
      setNames(nms) |>
      as.list()

    attrs <- x |>
      xml2::xml_find_first(".//generic:Attributes") |>
      xml2::xml_children()
    nms <- attrs |>
      xml2::xml_attr("id") |>
      tolower()
    nms <- replace(nms, nms == "title_compl", "description")
    attrs <- attrs |>
      xml2::xml_attr("value") |>
      setNames(nms) |>
      as.list()

    data <- c(series_key, attrs)
    data$key <- paste(series_key, collapse = ".")

    data$freq <- switch(
      data$freq,
      A = "annual",
      S = "semi-annual",
      Q = "quarterly",
      M = "monthly",
      W = "weekly",
      D = "daily"
    )

    entries <- xml2::xml_find_all(x, ".//generic:Obs[generic:ObsValue]")
    data$date <- x |>
      xml2::xml_find_all(".//generic:ObsDimension") |>
      xml2::xml_attr("value") |>
      parse_date(data$freq)

    data$value <- entries |>
      xml2::xml_find_all(".//generic:ObsValue") |>
      xml2::xml_attr("value") |>
      as.numeric()

    as.data.table(data)
  })
  res <- res |> rbindlist(fill = TRUE) |> setcolorder(the$col_order, skip_absent = TRUE)
  res
}

parse_ecb_metadata <- function(x, lang = "en") {
  rbindlist(lapply(x, function(node) {
    agency <- xml2::xml_attr(node, "agencyID")
    id <- xml2::xml_attr(node, "id")
    nms <- node |>
      xml2::xml_find_all(sprintf(".//com:Name[@xml:lang='%s']", lang)) |>
      xml2::xml_text()
    data.table(agency = agency, id = id, name = nms)
  }))
}

ecb_error_body <- function(resp) {
  message <- resp_body_string(resp, "UTF-8")
  docs <- "See docs at <https://data.ecb.europa.eu/help/api/status-codes>"
  c(message, docs)
}

ecb <- function(resource, ...) {
  request("https://data-api.ecb.europa.eu/service/") |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_path_append(resource) |>
    req_url_query(...) |>
    req_error(body = ecb_error_body) |>
    req_perform() |>
    resp_body_xml()
}
