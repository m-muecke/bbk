#' Fetch Bank of Israel (BoI) data
#'
#' Retrieve time series data from the Bank of Israel SDMX Web Service.
#'
#' @param flow (`character(1)`)\cr
#'   The dataflow to query. See [boi_metadata()] for available dataflows.
#' @param key (`NULL` | `character(1)`)\cr
#'   The series key to query using dot-separated dimension values
#'   (e.g., `"RER_GBP_ILS"`). Use `+` for multiple values in one dimension. If `NULL`, all data for
#'   the flow is returned. Default `NULL`.
#' @param start_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   Start date of the data (e.g., `"2024-01-01"` or `2024`). If `NULL`, no start date restriction
#'   is applied. Default `NULL`.
#' @param end_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   End date of the data, in the same format as start_period. If `NULL`, no end date restriction is
#'   applied. Default `NULL`.
#' @param first_n (`NULL` | `numeric(1)`)\cr
#'   Number of observations to retrieve from the start of the series. If `NULL`, no restriction is
#'   applied. Default `NULL`.
#' @param last_n (`NULL` | `numeric(1)`)\cr
#'   Number of observations to retrieve from the end of the series. If `NULL`, no restriction is
#'   applied. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.boi.org.il/en/>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch GBP/ILS exchange rate
#' boi_data("EXR", "RER_GBP_ILS", last_n = 5L)
#'
#' # fetch a range
#' boi_data("EXR", "RER_GBP_ILS", start_period = "2024-01-01", end_period = "2024-01-31")
#' }
boi_data = function(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL
) {
  assert_string(flow, min.chars = 1L)
  assert_string(key, min.chars = 1L, null.ok = TRUE)
  assert_period(start_period)
  assert_period(end_period)
  first_n = assert_count(first_n, null.ok = TRUE, positive = TRUE, coerce = TRUE)
  last_n = assert_count(last_n, null.ok = TRUE, positive = TRUE, coerce = TRUE)

  flow_ref = sprintf("BOI.STATISTICS,%s", toupper(flow))
  resource = sdmx_data_resource(flow_ref, key)
  xml = boi(
    resource,
    accept = "application/vnd.sdmx.genericdata+xml;version=2.1",
    startPeriod = start_period,
    endPeriod = end_period,
    firstNObservations = first_n,
    lastNObservations = last_n
  )
  parse_boi_data(xml)
}

#' Fetch Bank of Israel (BoI) metadata
#'
#' Retrieve metadata from the Bank of Israel SDMX Web Service.
#'
#' @param type (`character(1)`)\cr
#'   The type of metadata to query.
#'   One of: `"datastructure"`, `"dataflow"`, `"codelist"`, or `"concept"`.
#' @param id (`NULL` | `character(1)`)\cr
#'   The id to query. Default `NULL`.
#' @param lang (`character(1)`)\cr
#'   Language for names, either `"en"` or `"he"`. Default `"en"`.
#' @returns A [data.table::data.table()] with the requested metadata.
#' @source <https://www.boi.org.il/en/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' boi_metadata("dataflow")
#' boi_metadata("datastructure")
#' boi_metadata("codelist", "CL_FREQ")
#' }
boi_metadata = function(type, id = NULL, lang = "en") {
  assert_choice(type, c("datastructure", "dataflow", "codelist", "concept"))
  assert_string(id, min.chars = 1L, null.ok = TRUE)
  assert_choice(lang, c("en", "he"))

  meta = sdmx_metadata_type(type)
  resource = if (is.null(id)) {
    paste(meta$resource, "BOI.STATISTICS", sep = "/")
  } else {
    paste(meta$resource, "BOI.STATISTICS", toupper(id), sep = "/")
  }
  xml = boi(resource)
  entries = xml2::xml_find_all(xml, meta$xpath)
  sdmx_metadata(entries, lang)
}

#' Fetch Bank of Israel (BoI) dimensions
#'
#' Retrieve the dimension structure for a given dataflow from the Bank of Israel SDMX Web Service.
#'
#' @param id (`character(1)`)\cr
#'   The id of the data structure definition to query (e.g., `"EXR"`).
#' @returns A [data.table::data.table()] with columns:
#'   \item{id}{The dimension id (e.g., `"FREQ"`, `"BASE_CURRENCY"`)}
#'   \item{position}{The position of the dimension in the series key}
#'   \item{codelist}{The id of the associated codelist (e.g., `"CL_FREQ"`)}
#' @source <https://www.boi.org.il/en/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' boi_dimension("EXR")
#' }
boi_dimension = function(id) {
  assert_string(id, min.chars = 1L)
  resource = paste("datastructure", "BOI.STATISTICS", toupper(id), sep = "/")
  xml = boi(resource)
  sdmx_dimension(xml)
}

parse_boi_data = function(xml) {
  series = xml2::xml_find_all(xml, ".//generic:Series")
  res = map(series, function(x) {
    series_key = x |>
      xml2::xml_find_first("./generic:SeriesKey") |>
      xml2::xml_children()
    nms = series_key |>
      xml2::xml_attr("id") |>
      tolower()
    dims = series_key |>
      xml2::xml_attr("value") |>
      setNames(nms) |>
      as.list()

    obs = xml2::xml_find_all(x, "./generic:Obs[generic:ObsValue]")
    date = obs |>
      xml2::xml_find_all("./generic:ObsDimension") |>
      xml2::xml_attr("value")
    value = obs |>
      xml2::xml_find_all("./generic:ObsValue") |>
      xml2::xml_attr("value") |>
      as.numeric()

    key = paste(dims, collapse = ".")
    freq = if ("freq" %in% names(dims)) sdmx_freq(dims[["freq"]]) else NA_character_

    extra = dims[names(dims) %nin% "freq"]
    data = c(
      list(date = parse_date(date, freq), key = key, value = value, freq = freq),
      extra
    )
    as.data.table(data)
  })
  res = res |>
    rbindlist(fill = TRUE) |>
    setcolorder(col_order, skip_absent = TRUE)
  res[]
}

boi = function(resource, ..., accept = NULL) {
  sdmx_request(
    "https://edge.boi.gov.il/FusionEdgeServer/ws/public/sdmxapi/rest",
    resource,
    \(resp) sdmx_error_body(resp),
    ...,
    accept = accept
  )
}
