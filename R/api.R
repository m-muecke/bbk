#' Returns data for a given flow and key
#'
#' @param flow character(1) flow to query
#' @param key character(1) key to query. Default `NULL`.
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-data>
#' @family data
#' @export
#' @examples
#' bb_data("BBSIS", "D.I.ZST.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A")
bb_data <- function(flow, key = NULL) {
  stopifnot(is.character(flow), is.null(key) || is.character(key))
  flow <- toupper(flow)
  if (is.null(key)) {
    resource <- sprintf("data/%s", flow)
  } else {
    key <- toupper(key)
    resource <- sprintf("data/%s/%s", flow, key)
  }
  body <- bb_make_request(resource)

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
  docs <- "See docs at <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/status-codes/status-codes-855918>"
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

bb_make_request <- function(resource) {
  request("https://api.statistiken.bundesbank.de/rest") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_headers(`Accept-Language` = "en") |>
    req_url_path_append(resource) |>
    req_error(body = bb_error_body) |>
    req_perform() |>
    resp_body_xml()
}
