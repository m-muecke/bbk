#' Fetch National Bank of Belgium (NBB) data
#'
#' Retrieve time series data from the National Bank of Belgium SDMX Web Service (NBB.Stat).
#'
#' @param flow (`character(1)`)\cr
#'   The dataflow to query (e.g., `"DF_EXR"`). See [nbb_metadata()] for available dataflows.
#' @param key (`NULL` | `character(1)`)\cr
#'   The series key to query using dot-separated dimension values
#'   (e.g., `"D.USD"`). Use `+` for multiple values in one dimension
#'   (e.g., `"M.USD+GBP"`). If `NULL`, all data for the flow is returned.
#'   Default `NULL`.
#' @param start_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   Start date of the data (e.g., `"2024-01"` or `2024`). If `NULL`, no start date restriction
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
#' @source <https://stat.nbb.be/>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch daily EUR/USD reference rate
#' nbb_data("DF_EXR", "D.USD", last_n = 5L)
#'
#' # fetch multiple monthly average exchange rates
#' nbb_data("DF_EXR", "M.USD+GBP", start_period = "2024-01")
#'
#' # fetch Belgian HICP inflation
#' nbb_data("DF_HICP_2025", "M.BE.000000.2025.HCP.GROWTH_RATE", last_n = 5L)
#' }
nbb_data = function(
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

  resource = sdmx_data_resource(flow, key)
  xml = nbb(
    resource,
    startPeriod = start_period,
    endPeriod = end_period,
    firstNObservations = first_n,
    lastNObservations = last_n,
    accept = "application/vnd.sdmx.genericdata+xml;version=2.1"
  )
  parse_sdmx_data(xml)
}

#' Fetch National Bank of Belgium (NBB) metadata
#'
#' Retrieve metadata from the National Bank of Belgium SDMX Web Service (NBB.Stat).
#'
#' @param type (`character(1)`)\cr
#'   The type of metadata to query.
#'   One of: `"datastructure"`, `"dataflow"`, `"codelist"`, or `"concept"`.
#' @param id (`NULL` | `character(1)`)\cr
#'   The id to query. Default `NULL`.
#' @param lang (`character(1)`)\cr
#'   Language for names, one of `"en"`, `"fr"`, or `"nl"`. Default `"en"`.
#' @returns A [data.table::data.table()] with the requested metadata.
#' @source <https://stat.nbb.be/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' nbb_metadata("dataflow")
#' nbb_metadata("datastructure", "DSD_EXR")
#' nbb_metadata("codelist", "CL_EXR_CURRENCY")
#' nbb_metadata("dataflow", "DF_EXR", lang = "fr")
#' }
nbb_metadata = function(type, id = NULL, lang = "en") {
  assert_choice(type, c("datastructure", "dataflow", "codelist", "concept"))
  assert_string(id, min.chars = 1L, null.ok = TRUE)
  assert_choice(lang, c("en", "fr", "nl"))

  meta = sdmx_metadata_type(type, ns_prefix = "structure")
  resource = paste(c(meta$resource, "BE2", toupper(id)), collapse = "/")
  xml = nbb(resource)
  entries = xml2::xml_find_all(xml, meta$xpath)
  sdmx_metadata(entries, lang, ns_prefix = "common")
}

#' Fetch National Bank of Belgium (NBB) dimensions
#'
#' Retrieve the dimension structure for a given data structure from the National Bank of Belgium
#' SDMX Web Service (NBB.Stat).
#'
#' @param id (`character(1)`)\cr
#'   The id of the data structure definition to query (e.g., `"DSD_EXR"`).
#' @returns A [data.table::data.table()] with columns:
#'   \item{id}{The dimension id (e.g., `"FREQ"`, `"EXR_CURRENCY"`)}
#'   \item{position}{The position of the dimension in the series key}
#'   \item{codelist}{The id of the associated codelist (e.g., `"CL_FREQ"`)}
#' @source <https://stat.nbb.be/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' nbb_dimension("DSD_EXR")
#' }
nbb_dimension = function(id) {
  assert_string(id, min.chars = 1L)
  resource = paste("datastructure", "BE2", toupper(id), sep = "/")
  xml = nbb(resource)
  sdmx_dimension(xml, ns_prefix = "structure")
}

nbb = function(resource, ..., accept = NULL) {
  sdmx_request(
    "https://nsidisseminate-stat.nbb.be/rest",
    resource,
    \(resp) sdmx_error_body(resp),
    ...,
    accept = accept
  )
}
