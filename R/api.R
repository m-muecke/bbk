#' Returns data for a given flow and key
#'
#' @param flow `character(1)` flow to query, 5-8 characters.
#'   See [bb_metadata()] for available dataflows.
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
#'   \item{category}{The category of the observation}
#'   \item{unit}{The unit of the observation}
#'   \item{unit_multiplier}{The unit multiplier of the observation}
#'   \item{frequency}{The frequency of the observation}
#'   \item{value}{The value of the observation}
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-data>
#' @family data
#' @export
#' @examples
#' \donttest{
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
#' }
bb_data <- function(flow,
                    key,
                    start_period = NULL,
                    end_period = NULL,
                    first_n = NULL,
                    last_n = NULL) {
  stopifnot(
    is_string(flow), nchar(flow) %in% 5:8,
    is_string(key),
    is_string_or_null(start_period),
    is_string_or_null(end_period),
    is_count_or_null(first_n),
    is_count_or_null(last_n)
  )

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
  data <- parse_bb_data(body, key)
  as_tibble(data)
}

#' Returns the time serie that is found with the specified time series key
#'
#' @param key `character(1)` key to query.
#' @inherit bb_data references
#' @returns A `data.frame()` with the requested data. The columns are:
#'   \item{date}{The date of the observation}
#'   \item{key}{The time series key}
#'   \item{title}{The title of the dataflow}
#'   \item{category}{The category of the observation}
#'   \item{unit}{The unit of the observation}
#'   \item{unit_multiplier}{The unit multiplier of the observation}
#'   \item{frequency}{The frequency of the observation}
#'   \item{last_update}{The last update date}
#'   \item{source}{The source of the data}
#'   \item{comment}{A comment on the data}
#'   \item{value}{The value of the observation}
#' @family data
#' @export
#' @examples
#' \donttest{
#' bb_series("BBEX3.M.DKK.EUR.BB.AC.A01")
#' bb_series("BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B")
#' bb_series("BBBK11.D.TTA000")
#' }
bb_series <- function(key) {
  stopifnot(is_string(key))
  body <- request("https://api.statistiken.bundesbank.de/rest/data/tsIdList") |>
    req_user_agent("worldbank (https://m-muecke.github.io/worldbank)") |>
    req_headers(
      `Accept-Language` = "en", accept = "application/vnd.bbk.data+csv-zip"
    ) |>
    req_body_json(key, auto_unbox = FALSE) |>
    req_error(body = bb_error_body) |>
    req_perform() |>
    resp_body_raw()

  data <- parse_bb_series(body, key)
  as_tibble(data)
}

#' Returns the available metadata
#'
#' Retrieval of the metadata stored in the Bundesbank's time series database.
#' Access via the SDMX Web Service API of the Bundesbank.
#'
#' @param type `character(1)` the type of metadata to query. One of:
#' `"datastructure"`, `"dataflow"`, `"codelist"`, or `"concept"`.
#' @param id `character(1)` id to query. Default `NULL`.
#' @param lang `character(1)` language to query, either `"en"` or `"de"`.
#'   Default `"en"`.
#' @returns A `data.frame()` with the queried metadata.
#' The columns are:
#'   \item{id}{The id of the metadata}
#'   \item{name}{The name of the metadata}
#' @references <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examples
#' \donttest{
#' bb_metadata("datastructure")
#' bb_metadata("dataflow", "BBSIS")
#' bb_metadata("codelist", "CL_BBK_ACIP_ASSET_LIABILITY")
#' bb_metadata("concept", "CS_BBK_BSPL")
#' }
bb_metadata <- function(type, id = NULL, lang = c("en", "de")) {
  type <- match.arg(type, c("datastructure", "dataflow", "codelist", "concept"))
  args <- switch(type,
    datastructure = list("datastructure/BBK", "//structure:DataStructure"),
    dataflow = list("dataflow/BBK", "//structure:Dataflow"),
    codelist = list("codelist/BBK", "//structure:Codelist"),
    concept = list("conceptscheme/BBK", "//structure:ConceptScheme")
  )
  res <- do.call(fetch_metadata, c(args, list(id, lang)))
  res$name <- na_if_empty(res$name)
  as_tibble(res)
}

parse_bb_series <- function(body, key) {
  tmp <- tempfile()
  dir.create(tmp)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
  tf <- file.path(tmp, "tempfile.zip")
  writeBin(body, tf)
  utils::unzip(tf, exdir = tmp)

  files <- list.files(tmp, full.names = TRUE)
  path <- grep("\\.csv$", files, value = TRUE)[[1L]]

  res <- read.csv(path, header = FALSE, skip = 11L)[, 1:2] |>
    stats::setNames(c("date", "value"))
  res$value <- na_if_empty(res$value, ".")

  metadata <- readLines(path, n = 10L)
  title <- sub("^\"\",", "", metadata[[2L]])
  title <- sub(",$", "", title)
  freq <- extract_metadata(metadata, "^Time format code")
  unit <- extract_metadata(metadata, "^unit,")
  unit_multiplier <- extract_metadata(metadata, "^unit multiplier,")
  category <- extract_metadata(metadata, "^category,")
  last_update <- extract_metadata(metadata, "^last update,")
  comment <- extract_metadata(metadata, "^Comment \\(in english\\),")
  comment <- sub("^\"", "", comment)
  src <- extract_metadata(metadata, "^Source \\(in english\\),")

  freq <- switch(freq,
    P1M = "monthly",
    P3M = "quarterly",
    P1Y = "annual",
    P1D = "daily"
  )
  res$date <- parse_date(res$date, freq)
  res$key <- key
  res$title <- title
  res$category <- category
  res$frequency <- freq
  res$unit <- unit
  res$unit_multiplier <- unit_multiplier
  res$last_update <- last_update
  res$source <- src
  res$comment <- comment

  nms <- c(
    "date", "key", "title", "category", "unit", "unit_multiplier", "frequency",
    "last_update", "source", "comment", "value"
  )
  res <- res[, nms]
  res
}

parse_metadata <- function(x, lang) {
  res <- lapply(x, \(node) {
    id <- xml2::xml_attr(node, "id")
    nms <- node |>
      xml2::xml_find_all(sprintf(".//common:Name[@xml:lang='%s']", lang)) |>
      xml2::xml_text()
    data.frame(id = id, name = nms)
  })
  do.call(rbind, res)
}


parse_bb_data <- function(body, key) {
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
  unit <- body |>
    xml2::xml_find_first("//generic:Value[@id='UNIT_ENG']") |>
    xml2::xml_attr("value")
  unit_mult <- body |>
    xml2::xml_find_first("//generic:Value[@id='BBK_UNIT_MULT']") |>
    xml2::xml_attr("value")
  category <- body |>
    xml2::xml_find_first("//generic:Value[@id='WEB_CATEGORY']") |>
    xml2::xml_attr("value")

  entries <- body |> xml2::xml_find_all("//generic:Obs[generic:ObsValue]")
  date <- entries |>
    xml2::xml_find_all(".//generic:ObsDimension") |>
    xml2::xml_attr("value") |>
    parse_date(freq)

  value <- entries |>
    xml2::xml_find_all(".//generic:ObsValue") |>
    xml2::xml_attr("value") |>
    as.numeric()

  data <- data.frame(
    date = date,
    key = key,
    title = title,
    category = category,
    unit = unit,
    unit_multiplier = unit_mult,
    frequency = freq,
    value = value
  )
  data
}

parse_date <- function(date, freq) {
  switch(freq,
    daily = as.Date(date),
    monthly = as.Date(paste0(date, "-01")),
    annual = as.integer(date),
    date
  )
}

bb_error_body <- function(resp) {
  body <- resp_body_json(resp)
  message <- body$title
  docs <- "See docs at <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/status-codes/status-codes-855918>" # nolint
  c(message, docs)
}

fetch_metadata <- function(resource, xpath, id = NULL, lang = "en") {
  lang <- match.arg(lang, c("en", "de"))
  stopifnot(is_string_or_null(id))
  resource <- paste("metadata", resource, sep = "/")
  if (!is.null(id)) {
    resource <- paste(resource, toupper(id), sep = "/")
  }
  body <- bundesbank(resource)
  entries <- xml2::xml_find_all(body, xpath)
  res <- parse_metadata(entries, lang)
  res
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
