#' Fetch Banque de France (BdF) data
#'
#' @param dataset_id (`character(1)`) id of the dataset to query. Default `NULL`.
#' @param series_key (`character(1)`) key of the series to query. Default `NULL`.
#' @param start_period (`character(1)`) start period of the series to query.
#' @param end_period (`character(1)`) end period of the series to query.
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @param tz (`character(1)`) timezone to use for the query. Default `"UTC"`.
#' @param format (`character(1)`) format of the response, either `"json"` or `"csv"`.
#' @param api_args (named `list()`) of extra arguments appended to the API request.
#'   Combined with the default arguments with [modifyList()].
#' @param api_key (`character(1)`) API key to use for the request.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://webstat.banque-france.fr/en/pages/guide-migration-api/>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' bdf_data(series_key = "CONJ2.M.R24.T.SM.0RG24.EFTPM100.10", format = "csv")
#' # inflation rate
#' bdf_data("ICP.M.FR.N.000000.4.ANR", "2025-05-01")
#' }
bdf_data <- function(
  dataset_id = NULL,
  series_key = NULL,
  start_period = NULL,
  end_period = NULL,
  lang = "en",
  tz = "UTC",
  format = c("json", "csv"),
  api_args = list(),
  api_key = bdf_key()
) {
  format <- match.arg(format)
  stopifnot(
    is_string(dataset_id, null_ok = TRUE),
    is_string(series_key, null_ok = TRUE),
    is_string(start_period, null_ok = TRUE),
    is_string(end_period, null_ok = TRUE),
    is_string(lang),
    nchar(lang) == 2L,
    is_string(api_key),
    is.list(api_args)
  )

  url <- "https://webstat.banque-france.fr/api/explore/v2.1/catalog/datasets/observations/exports" # nolint
  refine <- sprintf("series_key:\"%s\"", series_key)
  params <- list(
    refine = refine,
    time_period_start = start_period,
    time_period_end = end_period,
    lang = lang,
    timezone = tz
  )
  params <- utils::modifyList(params, api_args)

  req <- request(url) |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_headers(Authorization = paste("Apikey", api_key)) |>
    req_url_path_append(format) |>
    req_url_query(!!!params)

  if (format == "csv") {
    tf <- tempfile()
    on.exit(unlink(tf), add = TRUE)
    req_perform(req, path = tf)
    dt <- fread(file = tf, sep = ";")
    return(dt)
  }

  req |>
    req_perform() |>
    resp_body_json() |>
    lapply(\(x) setDT(replace(x, lengths(x) == 0L, NA))) |>
    rbindlist()
}

bdf_key <- function() {
  key <- Sys.getenv("BANQUEDEFRANCE_KEY")
  if (nzchar(key)) {
    return(key)
  }
  if (is_testing()) {
    testthat::skip(sprintf("%s env var is not configured", "BDF"))
  }
  stop(
    "No API key found, please supply with `api_key` argument or with BANQUEDEFRANCE_KEY env var.",
    call. = FALSE
  )
}

is_testing <- function() {
  identical(Sys.getenv("TESTTHAT"), "true")
}
