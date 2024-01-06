bbundesbank <- function(flow, key) {
  stopifnot(is.character(flow), is.character(key))
  flow <- toupper(flow)
  key <- toupper(key)

  request("https://api.statistiken.bundesbank.de/rest/data") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_headers(Accept = "application/json") |>
    req_url_path_append(flow, key) |>
    req_perform() |>
    resp_body_json()
}

bundesbank <- function(resource) {
  request("https://api.statistiken.bundesbank.de/rest") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_url_path_append(resource) |>
    req_error(body = \(resp) resp_body_json(resp)$title) |>
    req_perform()
}

bb_metadata <- function(resource, id = NULL) {
  stopifnot(is.null(id) || is.character(id) && length(id) == 1)
  # only supports xml return format
  resource <- "metadata/datastructure/BBK"
  if (!is.null(id)) {
    resource <- paste(resource, toupper(id), sep = "/")
  }
  res <- bundesbank(resource) |>
    resp_body_xml()
  res
}

#' Returns available data structures
#'
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata> # nolint
#' @family metadata
#' @export
bb_data_structure <- function(id = NULL) {
  bb_metadata("metadata/datastructure/BBK", id)
}

#' Returns available dataflows
#'
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata> # nolint
#' @family metadata
#' @export
bb_dataflow <- function(id = NULL) {
  bb_metadata("metadata/dataflow/BBK", id)
}

#' Returns available code lists
#'
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata> # nolint
#' @family metadata
#' @export
bb_codelist <- function(id = NULL) {
  # TODO: check if supports json return format
  bb_metadata("metadata/codelist/BBK", id)
}

#'
#'
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata> # nolint
#' @family metadata
#' @export
bb_concept_scheme <- function(id = NULL) {
  bb_metadata("metadata/conceptscheme/BBK", id)
}
