#' Fetch Bank for International Settlements (BIS) data
#'
#' Retrieve time series data from the BIS SDMX Web Service.
#'
#' @param flow (`character(1)`)\cr
#'   The dataflow to query. See [bis_metadata()] for available dataflows.
#' @param key (`NULL` | `character()`)\cr
#'   The series keys to query using dot-separated dimension values
#'   (e.g., `"M.CH"`). Use `+` for multiple values in one dimension
#'   (e.g., `"M.CH+US"`). If `NULL`, all data for the flow is returned.
#'   Default `NULL`.
#' @param start_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   Start date of the data. Supported formats:
#'   * YYYY for annual data (e.g., `2019`)
#'   * YYYY-S\[1-2\] for semi-annual data (e.g., `"2019-S1"`)
#'   * YYYY-Q\[1-4\] for quarterly data (e.g., `"2019-Q1"`)
#'   * YYYY-MM for monthly data (e.g., `"2019-01"`)
#'   * YYYY-MM-DD for daily data (e.g., `"2019-01-01"`)
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
#' @source <https://stats.bis.org/api-doc/v1/>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch Swiss central bank policy rate
#' bis_data("WS_CBPOL", "M.CH", last_n = 5L)
#'
#' # fetch effective exchange rates
#' bis_data("WS_EER", "M.N.B.CH", start_period = "2020-01")
#' }
bis_data <- function(
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

  resource <- sdmx_data_resource(flow, key)
  xml <- bis(
    resource,
    startPeriod = start_period,
    endPeriod = end_period,
    firstNObservations = first_n,
    lastNObservations = last_n
  )
  parse_bis_data(xml)
}

#' Fetch Bank for International Settlements (BIS) metadata
#'
#' Retrieve metadata from the BIS SDMX Web Service.
#'
#' @param type (`character(1)`)\cr
#'   The type of metadata to query.
#'   One of: `"datastructure"`, `"dataflow"`, `"codelist"`, or `"concept"`.
#' @param id (`NULL` | `character(1)`)\cr
#'   The id to query. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested metadata.
#' @source <https://stats.bis.org/api-doc/v1/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bis_metadata("dataflow")
#' bis_metadata("datastructure", "BIS_CBPOL")
#' bis_metadata("codelist", "CL_FREQ")
#' }
bis_metadata <- function(type, id = NULL) {
  assert_choice(type, c("datastructure", "dataflow", "codelist", "concept"))
  assert_string(id, min.chars = 1L, null.ok = TRUE)

  xpath <- switch(
    type,
    datastructure = "//str:DataStructure",
    dataflow = "//str:Dataflow",
    codelist = "//str:Codelist",
    concept = "//str:ConceptScheme"
  )
  type <- if (type == "concept") "conceptscheme" else type
  resource <- if (is.null(id)) type else paste(type, "BIS", toupper(id), sep = "/")
  xml <- bis(resource)
  entries <- xml2::xml_find_all(xml, xpath)
  sdmx_metadata(entries)
}

#' Fetch Bank for International Settlements (BIS) dimensions
#'
#' Retrieve the dimension structure for a given dataflow from the BIS SDMX Web Service.
#'
#' @param id (`character(1)`)\cr
#'   The id of the data structure definition to query (e.g., `"BIS_CBPOL"`).
#' @returns A [data.table::data.table()] with columns:
#'   \item{id}{The dimension id (e.g., `"FREQ"`, `"REF_AREA"`)}
#'   \item{position}{The position of the dimension in the series key}
#'   \item{codelist}{The id of the associated codelist (e.g., `"CL_FREQ"`)}
#' @source <https://stats.bis.org/api-doc/v1/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bis_dimension("BIS_CBPOL")
#' }
bis_dimension <- function(id) {
  assert_string(id, min.chars = 1L)
  resource <- paste("datastructure", "BIS", toupper(id), sep = "/")
  xml <- bis(resource)
  sdmx_dimension(xml)
}

parse_bis_data <- function(xml) {
  series <- xml2::xml_find_all(xml, ".//generic:Series")
  res <- map(series, function(x) {
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
    attrs <- attrs |>
      xml2::xml_attr("value") |>
      setNames(nms) |>
      as.list()

    data <- c(series_key, attrs)
    data$key <- paste(series_key, collapse = ".")
    data$freq <- sdmx_freq(data$freq)
    data$title <- trimws(data$title)

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
  res <- res |>
    rbindlist(fill = TRUE) |>
    setcolorder(col_order, skip_absent = TRUE)
  res[]
}

bis_error_body <- function(resp) {
  resp_body_string(resp, "UTF-8")
}

bis <- function(resource, ...) {
  sdmx_request("https://stats.bis.org/api/v1", resource, bis_error_body, ...)
}
