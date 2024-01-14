#' Returns data for a given flow and key
#'
#' @param flow character(1) flow to query
#' @param key character(1) key to query. Default `NULL`.
#' @param start_period character(1) start date of the data. Supported formats:
#'   - YYYY for annual data (e.g., "2019")
#'   - YYYY-S\[1-2\] for semi-annual data (e.g., "2019-S1")
#'   - YYYY-Q\[1-4\] for quarterly data (e.g., "2019-Q1")
#'   - YYYY-MM for monthly data (e.g., "2019-01")
#'   - YYYY-W\[01-53\] for weekly data (e.g., "2019-W01")
#'   - YYYY-MM-DD for daily and business data (e.g., "2019-01-01")
#'
#'   If `NULL`, no start date restriction is applied (data retrieved from the
#'   earliest available date). Default `NULL`.
#' @param end_period character(1) end date of the data, in the same format as
#'   start_period. If `NULL`, no end date restriction is applied (data
#'   retrieved up to the most recent available date). Default `NULL`.
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-data>
#' @family data
#' @export
#' @examples
#' # fetch all data for a given flow and key
#' bb_data("BBSIS", "D.I.ZST.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A")
#'
#' # specified period (start date-end date) for daily data
#' bb_data(
#'   "BBSIS", "D.I.ZST.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
#'   start_period = "2020-01-01",
#'   end_period = "2020-08-01"
#' )
#' # or only specify the start date
#' bb_data(
#'   "BBSIS", "D.I.ZST.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
#'   start_period = "2020-01-01"
#' )
bb_data <- function(flow, key = NULL, start_period = NULL, end_period = NULL) {
  stopifnot(is.character(flow), is.null(key) || is.character(key))
  flow <- toupper(flow)
  if (is.null(key)) {
    resource <- sprintf("data/%s", flow)
  } else {
    key <- toupper(key)
    resource <- sprintf("data/%s/%s", flow, key)
  }
  body <- bb_make_request(
    resource = resource,
    startPeriod = start_period,
    endPeriod = end_period
  )

  entries <- body |>
    xml2::xml_find_all("//generic:Obs[generic:ObsValue]")
  date <- entries |>
    xml2::xml_find_all(".//generic:ObsDimension") |>
    xml2::xml_attrs("value") |>
    as.character()
  value <- entries |>
    xml2::xml_find_all(".//generic:ObsValue") |>
    xml2::xml_attrs("value") |>
    as.numeric()
  data <- data.frame(date = date, value = value)
  as_tibble(data)
}

#' Returns available data structures
#'
#' @param id character(1) id to query. Default `NULL`.
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' bb_data_structure()
bb_data_structure <- function(id = NULL) {
  bb_metadata("metadata/datastructure/BBK", id)
}

#' Returns available dataflows
#'
#' @param id character(1) id to query. Default `NULL`.
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' bb_dataflow()
bb_dataflow <- function(id = NULL) {
  bb_metadata("metadata/dataflow/BBK", id)
}

#' Returns available code lists
#'
#' @param id character(1) id to query. Default `NULL`.
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' bb_codelist()
bb_codelist <- function(id = NULL) {
  bb_metadata("metadata/codelist/BBK", id)
}

#' Returns available concepts
#'
#' @param id character(1) id to query. Default `NULL`.
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' bb_concept_scheme()
bb_concept_scheme <- function(id = NULL) {
  bb_metadata("metadata/conceptscheme/BBK", id)
}

bb_error_body <- function(resp) {
  body <- resp_body_json(resp)
  message <- body$title
  docs <- "See docs at <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/status-codes/status-codes-855918>" # nolint
  c(message, docs)
}

bb_metadata <- function(resource, id = NULL) {
  stopifnot(is.null(id) || is.character(id) && length(id) == 1)
  # only supports xml return format
  resource <- "metadata/datastructure/BBK"
  if (!is.null(id)) {
    resource <- paste(resource, toupper(id), sep = "/")
  }
  bb_make_request(resource)
}

bb_make_request <- function(resource, ...) {
  request("https://api.statistiken.bundesbank.de/rest") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_headers(`Accept-Language` = "en") |>
    req_url_path_append(resource) |>
    req_url_query(...) |>
    req_error(body = bb_error_body) |>
    req_perform() |>
    resp_body_xml()
}
