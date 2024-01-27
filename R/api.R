#' Returns data for a given flow and key
#'
#' @param flow `character(1)` flow to query, 5-8 characters.
#'   See [bb_dataflow()] for available flows.
#' @param key `character(1)` key to query.
#' @param start_period `character(1)` start date of the data. Supported formats:
#'   - YYYY for annual data (e.g., "2019")
#'   - YYYY-S\[1-2\] for semi-annual data (e.g., "2019-S1")
#'   - YYYY-Q\[1-4\] for quarterly data (e.g., "2019-Q1")
#'   - YYYY-MM for monthly data (e.g., "2019-01")
#'   - YYYY-W\[01-53\] for weekly data (e.g., "2019-W01")
#'   - YYYY-MM-DD for daily and business data (e.g., "2019-01-01")
#'   If `NULL`, no start date restriction is applied (data retrieved from the
#'   earliest available date). Default `NULL`.
#' @param end_period `character(1)` end date of the data, in the same format as
#'   start_period. If `NULL`, no end date restriction is applied (data
#'   retrieved up to the most recent available date). Default `NULL`.
#' @param first_n `numeric(1)` number of observations to retrieve from the
#'   start of the series. If `NULL`, no restriction is applied. Default `NULL`.
#' @param last_n `numeric(1)` number of observations to retrieve from the end
#'  of the series. If `NULL`, no restriction is applied. Default `NULL`.
#' @returns A `data.frame()` with the requested data. The columns are:
#'   \item{date}{The date of the observation}
#'   \item{key}{The time series key}
#'   \item{title}{The title of the dataflow}
#'   \item{freq}{The frequency of the dataflow}
#'   \item{value}{The value of the observation}
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
bb_data <- function(flow,
                    key,
                    start_period = NULL,
                    end_period = NULL,
                    first_n = NULL,
                    last_n = NULL) {
  stopifnot(is_string(flow) && nchar(flow) %in% 5:8)
  stopifnot(is_string(key))
  stopifnot(is.null(start_period) || is_string(start_period))
  stopifnot(is.null(end_period) || is_string(end_period))
  stopifnot(is.null(first_n) || is_integerish(first_n) && first_n > 0L)
  stopifnot(is.null(last_n) || is_integerish(last_n) && last_n > 0L)

  flow <- toupper(flow)
  if (is.null(key)) {
    resource <- sprintf("data/%s", flow)
  } else {
    key <- toupper(key)
    resource <- sprintf("data/%s/%s", flow, key)
  }
  body <- bundesbank(
    resource = resource,
    startPeriod = start_period,
    endPeriod = end_period,
    firstNObservations = first_n,
    lastNObservations = last_n
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
    date = date, key = key, title = title, freq = freq, value = value
  )
  as_tibble(data)
}

#' Returns all time series that are found with the specified time series keys
#'
#' @param key `character()` keys to query.
#' @inherit bb_data references
#' @family data
#' @export
#' @examples
#' bb_series("BBEX3.M.DKK.EUR.BB.AC.A01")
bb_series <- function(key) {
  stopifnot(is.character(key) && length(key) > 0L)
  raw <- request("https://api.statistiken.bundesbank.de/rest/data/tsIdList") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_headers(
      `Accept-Language` = "en", accept = "application/vnd.bbk.data+csv-zip"
    ) |>
    req_body_json(key, auto_unbox = FALSE) |>
    req_error(body = bb_error_body) |>
    req_perform() |>
    resp_body_raw()

  tmp <- tempfile()
  dir.create(tmp)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
  tf <- file.path(tmp, "tempfile.zip")
  writeBin(raw, tf)
  utils::unzip(tf, exdir = tmp)

  files <- list.files(tmp, full.names = TRUE)
  path <- grep("\\.csv$", files, value = TRUE)[[1L]]

  col_names <- read.csv(path, nrows = 1L, header = FALSE) |>
    as.character()
  col_names[[1L]] <- "date"
  res <- read.csv(path, skip = 11L, col.names = col_names)
  as_tibble(res)
}

#' Returns available data structures
#'
#' @param id `character(1)` id to query. Default `NULL`.
#' @param lang `character(1)` language to query, either `"en"` or `"de"`.
#'   Default `"en"`.
#' @returns A `data.frame()` with the available data structures. The columns are:
#'   \item{id}{The id of the data structure}
#'   \item{name}{The name of the data structure}
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' bb_data_structure()
#' # or filter by id
#' bb_data_structure("BBK_BSPL")
bb_data_structure <- function(id = NULL, lang = c("en", "de")) {
  lang <- match.arg(lang, c("en", "de"))
  body <- bb_metadata("metadata/datastructure/BBK", id)
  entries <- xml2::xml_find_all(body, "//structure:DataStructure")
  res <- parse_metadata(entries, lang)
  as_tibble(res)
}

#' Returns available dataflows
#'
#' @inheritParams bb_data_structure
#' @inherit bb_data_structure references
#' @returns A data.frame with the available dataflows. The columns are:
#'   \item{id}{The id of the dataflow}
#'   \item{name}{The name of the dataflow}
#' @family metadata
#' @export
#' @examples
#' bb_dataflow()
#' # or filter by id
#' bb_dataflow("BBSIS")
bb_dataflow <- function(id = NULL, lang = c("en", "de")) {
  lang <- match.arg(lang, c("en", "de"))
  body <- bb_metadata("metadata/dataflow/BBK", id)
  entries <- xml2::xml_find_all(body, "//structure:Dataflow")
  res <- parse_metadata(entries, lang)
  res$name <- na_if_empty(res$name)
  as_tibble(res)
}

#' Returns available code lists
#'
#' @inheritParams bb_data_structure
#' @inherit bb_data_structure references
#' @returns A data.frame with the available code lists. The columns are:
#'   \item{id}{The id of the code list}
#'   \item{name}{The name of the code list}
#' @family metadata
#' @export
#' @examples
#' bb_codelist()
#' # or filter by id
#' bb_codelist("CL_BBK_ACIP_ASSET_LIABILITY")
bb_codelist <- function(id = NULL, lang = c("en", "de")) {
  lang <- match.arg(lang, c("en", "de"))
  body <- bb_metadata("metadata/codelist/BBK", id)
  entries <- xml2::xml_find_all(body, "//structure:Codelist")
  res <- parse_metadata(entries, lang)
  as_tibble(res)
}

#' Returns available concepts
#'
#' @inheritParams bb_data_structure
#' @inherit bb_data_structure references
#' @returns A data.frame with the available concepts. The columns are:
#'   \item{id}{The id of the concept}
#'   \item{name}{The name of the concept}
#' @family metadata
#' @export
#' @examples
#' bb_concept()
#' # or filter by id
#' bb_concept("CS_BBK_BSPL")
bb_concept <- function(id = NULL, lang = c("en", "de")) {
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
  bundesbank(resource)
}

bundesbank <- function(resource, ...) {
  request("https://api.statistiken.bundesbank.de/rest") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_headers(`Accept-Language` = "en") |>
    req_url_path_append(resource) |>
    req_url_query(...) |>
    req_error(body = bb_error_body) |>
    req_perform() |>
    resp_body_xml()
}
