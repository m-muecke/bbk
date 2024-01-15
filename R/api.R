#' Returns data for a given flow and key
#'
#' @param flow `character(1)` flow to query
#' @param key `character(1)` key to query.
#' @param start_period `character(1)` start date of the data. Supported formats:
#'   - YYYY for annual data (e.g., "2019")
#'   - YYYY-S\[1-2\] for semi-annual data (e.g., "2019-S1")
#'   - YYYY-Q\[1-4\] for quarterly data (e.g., "2019-Q1")
#'   - YYYY-MM for monthly data (e.g., "2019-01")
#'   - YYYY-W\[01-53\] for weekly data (e.g., "2019-W01")
#'   - YYYY-MM-DD for daily and business data (e.g., "2019-01-01")
#'
#'   If `NULL`, no start date restriction is applied (data retrieved from the
#'   earliest available date). Default `NULL`.
#' @param end_period `character(1)` end date of the data, in the same format as
#'   start_period. If `NULL`, no end date restriction is applied (data
#'   retrieved up to the most recent available date). Default `NULL`.
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-data>
#' @family data
#' @export
#' @examples
#' # fetch all data for a given flow and key
#' bb_data("BBSIS", "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A")
#'
#' # specified period (start date-end date) for daily data
#' bb_data(
#'   "BBSIS", "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
#'   start_period = "2020-01-01",
#'   end_period = "2020-08-01"
#' )
#' # or only specify the start date
#' bb_data(
#'   "BBSIS", "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
#'   start_period = "2020-01-01"
#' )
bb_data <- function(flow, key, start_period = NULL, end_period = NULL) {
  stopifnot(is_string(flow))
  stopifnot(is_string(key))
  stopifnot(is.null(start_period) || is_string(start_period))
  stopifnot(is.null(end_period) || is_string(end_period))

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

  freq <- body |>
    xml2::xml_find_first("//generic:Value[@id='BBK_STD_FREQ']") |>
    xml2::xml_attr("value")
  freq <- switch(freq,
    A = "annual",
    S = "semi-annual",
    Q = "quarterly",
    M = "monthly",
    W = "weekly",
    D = "daily"
  )

  title <- body |>
    xml2::xml_find_first("//generic:Value[@id='BBK_TITLE_ENG']") |>
    xml2::xml_attr("value")

  entries <- body |> xml2::xml_find_all("//generic:Obs[generic:ObsValue]")
  date <- entries |>
    xml2::xml_find_all(".//generic:ObsDimension") |>
    xml2::xml_attr("value")

  if (freq == "daily") {
    date <- as.Date(date, format = "%Y-%m-%d")
  } else if (freq == "annual") {
    date <- as.integer(date)
  }

  value <- entries |>
    xml2::xml_find_all(".//generic:ObsValue") |>
    xml2::xml_attr("value") |>
    as.numeric()

  data <- data.frame(
    date = date, id = key, title = title, freq = freq, value = value
  )
  as_tibble(data)
}

#' Returns available data structures
#'
#' @param id `character(1)` id to query. Default `NULL`.
#' @param lang `character(1)` language to query. Default `"en"`.
#' @returns A data.frame with the available data structures. The columns are:
#' \item{id}{The id of the data structure}
#' \item{name}{The name of the data structure}
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' bb_data_structure()
#' # or filter by id
#' bb_data_structure("BBK_BSPL")
bb_data_structure <- function(id = NULL, lang = "en") {
  lang <- match.arg(lang, c("en", "de"))
  body <- bb_metadata("metadata/datastructure/BBK", id)
  entries <- xml2::xml_find_all(body, "//structure:DataStructure")
  res <- parse_metadata(entries, lang)
  as_tibble(res)
}

#' Returns available dataflows
#'
#' @param id `character(1)` id to query. Default `NULL`.
#' @param lang `character(1)` language to query. Default `"en"`.
#' @returns A data.frame with the available dataflows. The columns are:
#' \item{id}{The id of the dataflow}
#' \item{name}{The name of the dataflow}
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' bb_dataflow()
#' # or filter by id
#' bb_dataflow("BBSIS")
bb_dataflow <- function(id = NULL, lang = "en") {
  lang <- match.arg(lang, c("en", "de"))
  body <- bb_metadata("metadata/dataflow/BBK", id)
  entries <- xml2::xml_find_all(body, "//structure:Dataflow")
  res <- parse_metadata(entries, lang)
  res$name <- na_if_empty(res$name)
  as_tibble(res)
}

#' Returns available code lists
#'
#' @param id `character(1)` id to query. Default `NULL`.
#' @param lang `character(1)` language to query. Default `"en"`.
#' @returns A data.frame with the available code lists. The columns are:
#' \item{id}{The id of the code list}
#' \item{name}{The name of the code list}
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' bb_codelist()
#' # or filter by id
#' bb_codelist("CL_BBK_ACIP_ASSET_LIABILITY")
bb_codelist <- function(id = NULL, lang = "en") {
  lang <- match.arg(lang, c("en", "de"))
  body <- bb_metadata("metadata/codelist/BBK", id)
  entries <- xml2::xml_find_all(body, "//structure:Codelist")
  res <- parse_metadata(entries, lang)
  as_tibble(res)
}

#' Returns available concepts
#'
#' @param id `character(1)` id to query. Default `NULL`.
#' @param lang `character(1)` language to query. Default `"en"`.
#' @returns A data.frame with the available concepts. The columns are:
#' \item{id}{The id of the concept}
#' \item{name}{The name of the concept}
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' bb_concept_scheme()
#' # or filter by id
#' bb_concept_scheme("CS_BBK_BSPL")
bb_concept_scheme <- function(id = NULL, lang = "en") {
  lang <- match.arg(lang, c("en", "de"))
  body <- bb_metadata("metadata/conceptscheme/BBK", id)
  entries <- xml2::xml_find_all(body, "//structure:ConceptScheme")
  res <- parse_metadata(entries, lang)
  as_tibble(res)
}

parse_metadata <- function(x, lang) {
  res <- lapply(x, \(node) {
    id <- xml2::xml_attr(node, "id")
    nms <- node |>
      xml2::xml_find_all(sprintf(".//common:Name[@xml:lang='%s']", lang)) |>
      xml2::xml_text()
    data.frame(id = id, name = nms)
  })
  res <- do.call(rbind, res)
  res
}

bb_error_body <- function(resp) {
  body <- resp_body_json(resp)
  message <- body$title
  docs <- "See docs at <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/status-codes/status-codes-855918>" # nolint
  c(message, docs)
}

bb_metadata <- function(resource, id = NULL) {
  stopifnot(is.null(id) || is_string(id))
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
