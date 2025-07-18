#' Returns Bundesbank data for a given flow and key
#'
#' @param flow (`character(1)`) flow to query, 5-8 characters.
#'   See [bbk_metadata()] for available dataflows.
#' @param key (`character(1)`) key to query.
#' @param start_period (`character(1)`) start date of the data. Supported formats:
#'   - YYYY for annual data (e.g., "2019")
#'   - YYYY-S\[1-2\] for semi-annual data (e.g., "2019-S1")
#'   - YYYY-Q\[1-4\] for quarterly data (e.g., "2019-Q1")
#'   - YYYY-MM for monthly data (e.g., "2019-01")
#'   - YYYY-W\[01-53\] for weekly data (e.g., "2019-W01")
#'   - YYYY-MM-DD for daily and business data (e.g., "2019-01-01")
#'   If `NULL`, no start date restriction is applied (data retrieved from the
#'   earliest available date). Default `NULL`.
#' @param end_period (`character(1)`) end date of the data, in the same format as
#'   start_period. If `NULL`, no end date restriction is applied (data
#'   retrieved up to the most recent available date). Default `NULL`.
#' @param first_n (`numeric(1)`) number of observations to retrieve from the
#'   start of the series. If `NULL`, no restriction is applied. Default `NULL`.
#' @param last_n (`numeric(1)`) number of observations to retrieve from the end
#'  of the series. If `NULL`, no restriction is applied. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-data>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch all data for a given flow and key
#' bbk_data("BBSIS", "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A")
#' # fetch data for multiple keys
#' bbk_data("BBEX3", c("M.ISK.EUR", "USD.CA.AC.A01"))
#' # specified period (start date-end date) for daily data
#' bbk_data(
#'   "BBSIS", "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
#'   start_period = "2020-01-01",
#'   end_period = "2020-08-01"
#' )
#' # or only specify the start date
#' bbk_data(
#'   "BBSIS", "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
#'   start_period = "2024-04-01"
#' )
#' }
bbk_data <- function(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL
) {
  stopifnot(
    is_string(flow),
    nchar(flow) %in% 5:8,
    is_character(key, null_ok = TRUE),
    is_string(start_period, null_ok = TRUE),
    is_string(end_period, null_ok = TRUE),
    is_count(first_n, null_ok = TRUE),
    is_count(last_n, null_ok = TRUE)
  )

  flow <- toupper(flow)
  if (is.null(key)) {
    resource <- sprintf("data/%s", flow)
  } else {
    key <- toupper(key)
    key <- paste0(key, collapse = "+")
    resource <- sprintf("data/%s/%s", flow, key)
  }
  body <- make_request(
    resource = resource,
    startPeriod = start_period,
    endPeriod = end_period,
    firstNObservations = first_n,
    lastNObservations = last_n
  )
  parse_bbk_data(body)
}

#' Returns the Bundesbank time serie that is found with the specified time series key
#'
#' @inherit bbk_data source
#' @inheritParams bbk_data
#' @inherit bbk_data return
#' @family data
#' @seealso [bbk_data()] for an endpoint with more options.
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bbk_series("BBEX3.M.DKK.EUR.BB.AC.A01")
#' bbk_series("BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B")
#' bbk_series("BBBK11.D.TTA000")
#' }
bbk_series <- function(key) {
  stopifnot(is_string(key))
  body <- build_request("data/tsIdList", accept = "application/vnd.bbk.data+csv-zip") |>
    req_body_json(key, auto_unbox = FALSE) |>
    req_perform() |>
    resp_body_raw()
  parse_bbk_series(body, key)
}

#' Returns the available Bundesbank metadata
#'
#' Retrieval of the metadata stored in the Bundesbank's time series database.
#' Access via the SDMX Web Service API of the Bundesbank.
#'
#' @param type (`character(1)`) the type of metadata to query. One of:
#'   `"datastructure"`, `"dataflow"`, `"codelist"`, or `"concept"`.
#' @param id (`character(1)`) id to query. Default `NULL`.
#' @param lang (`character(1)`) language to query, either `"en"` or `"de"`.
#'   Default `"en"`.
#' @returns A [data.table::data.table()] with the queried metadata.
#' The columns are:
#'   \item{id}{The id of the metadata}
#'   \item{name}{The name of the metadata}
#' @source <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bbk_metadata("datastructure")
#' bbk_metadata("dataflow", "BBSIS")
#' bbk_metadata("codelist", "CL_BBK_ACIP_ASSET_LIABILITY")
#' bbk_metadata("concept", "CS_BBK_BSPL")
#' }
bbk_metadata <- function(type, id = NULL, lang = c("en", "de")) {
  type <- match.arg(type, c("datastructure", "dataflow", "codelist", "concept"))
  args <- switch(
    type,
    datastructure = list("datastructure/BBK", "//structure:DataStructure"),
    dataflow = list("dataflow/BBK", "//structure:Dataflow"),
    codelist = list("codelist/BBK", "//structure:Codelist"),
    concept = list("conceptscheme/BBK", "//structure:ConceptScheme")
  )
  dt <- do.call(fetch_bbk_metadata, c(args, list(id, lang)))
  dt[!nzchar(name), name := NA_character_][]
}

parse_bbk_series <- function(body, key) {
  tmp <- tempfile()
  dir.create(tmp)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
  tf <- file.path(tmp, "tempfile.zip")
  writeBin(body, tf)
  utils::unzip(tf, exdir = tmp)

  files <- list.files(tmp, full.names = TRUE)
  path <- grep("\\.csv$", files, value = TRUE)[[1L]]

  dt <- fread(path, header = FALSE, skip = 11L)[, 1:2]
  setnames(dt, c("date", "value"))
  dt[value == ".", value := NA_character_]
  dt <- na.omit(dt)

  metadata <- readLines(path, n = 10L)
  title <- sub("^[\",]+", "", metadata[[2L]])
  title <- sub("[\",]+$", "", title)
  freq <- extract_metadata(metadata, "^Time format code")
  unit <- extract_metadata(metadata, "^Unit \\(in english\\),")
  if (is.na(unit)) {
    unit <- extract_metadata(metadata, "^unit,")
  }
  unit_mult <- extract_metadata(metadata, "^unit multiplier,")
  category <- extract_metadata(metadata, "^category,")
  last_update <- extract_metadata(metadata, "^last update,")
  comment <- extract_metadata(metadata, "^Comment \\(in english\\),")
  comment <- sub("^\"", "", comment)
  src <- extract_metadata(metadata, "^Source \\(in english\\),")

  freq <- switch(
    freq,
    P1M = "monthly",
    P3M = "quarterly",
    P1Y = "annual",
    P1D = "daily"
  )
  dt[, date := parse_date(date, freq)]
  dt <- cbind(
    dt,
    key,
    title,
    freq,
    category,
    unit,
    unit_mult,
    last_update,
    comment,
    source = src
  )
  setcolorder(dt, c("date", "key", "value", "title", "freq"))
  dt[]
}

parse_bbk_metadata <- function(x, lang) {
  res <- lapply(x, function(node) {
    id <- xml2::xml_attr(node, "id")
    nms <- node |>
      xml2::xml_find_all(sprintf(".//common:Name[@xml:lang='%s']", lang)) |>
      xml2::xml_text()
    data.table(id = id, name = nms)
  })
  rbindlist(res)
}

parse_bbk_data <- function(body) {
  series <- xml2::xml_find_all(body, ".//generic:Series")
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
    nms <- replace(nms, nms == "bbk_title_eng", "title")
    nms <- replace(nms, nms == "bbk_id", "key")
    attrs <- attrs |>
      xml2::xml_attr("value") |>
      setNames(nms) |>
      as.list()

    data <- c(series_key, attrs)
    nms <- names(data)
    nms <- sub("^bbk_(seis_)?", "", nms)
    nms <- sub("^std_", "", nms)
    names(data) <- replace(nms, nms == "web_category", "category")

    data$freq <- switch(
      data$time_format,
      P1M = "monthly",
      P3M = "quarterly",
      P1Y = "annual",
      P1D = "daily"
    )

    entries <- xml2::xml_find_all(body, "//generic:Obs[generic:ObsValue]")
    data$date <- entries |>
      xml2::xml_find_all(".//generic:ObsDimension") |>
      xml2::xml_attr("value") |>
      parse_date(data$freq)

    data$value <- entries |>
      xml2::xml_find_all(".//generic:ObsValue") |>
      xml2::xml_attr("value") |>
      as.numeric()

    as.data.table(data)
  })
  dt <- rbindlist(res)
  dt[, decimals := as.integer(decimals)]
  setcolorder(dt, c("date", "key", "value", "title", "freq"))
  dt[]
}

fetch_bbk_metadata <- function(resource, xpath, id = NULL, lang = "en") {
  lang <- match.arg(lang, c("en", "de"))
  stopifnot(is_string(id, null_ok = TRUE))
  resource <- paste("metadata", resource, sep = "/")
  if (!is.null(id)) {
    resource <- paste(resource, toupper(id), sep = "/")
  }
  body <- make_request(resource)
  entries <- xml2::xml_find_all(body, xpath)
  parse_bbk_metadata(entries, lang)
}

bbk_error_body <- function(resp) {
  content_type <- resp_content_type(resp)
  if (identical(content_type, "application/json")) {
    body <- resp_body_json(resp)
    msg <- body$title
    docs <- "See docs at <https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/status-codes/status-codes-855918>" # nolint
    c(msg, docs)
  }
}

build_request <- function(resource, accept = NULL) {
  request("https://api.statistiken.bundesbank.de/rest") |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_headers(`Accept-Language` = "en", accept = accept) |>
    req_url_path_append(resource) |>
    req_error(body = bbk_error_body)
}

make_request <- function(resource, ...) {
  build_request(resource) |>
    req_url_query(...) |>
    req_perform() |>
    resp_body_xml()
}
