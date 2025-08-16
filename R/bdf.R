#' Fetch Banque de France (BdF) data
#'
#' @param series_key (`character(1)`) key of the series to query. Default `NULL`.
#' @param select (`character(1)`) select expression to filter the columns in the result.
#' @param where (`character(1)`) where expression to filter the rows in the result.
#' @param group_by (`character(1)`) group by expression to aggregate the result.
#' @param order_by (`character(1)`) order by expression to sort the result.
#' @param lang (`character(1)`) language to query. Default `"en"`.
#' @param tz (`character(1)`) timezone to use for the query. Default `"UTC"`.
#' @param api_args (named `list()`) of extra arguments appended to the API request.
#'   Combined with the default arguments with [modifyList()].
#' @param api_key (`character(1)`) API key to use for the request.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://webstat.banque-france.fr/en/pages/guide-migration-api/>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' bdf_data(series_key = "CONJ2.M.R24.T.SM.0RG24.EFTPM100.10")
#' # inflation rate
#' bdf_data(series_key = "ICP.M.FR.N.000000.4.ANR")
#' # or with a date filter
#' bdf_data(series_key = "ICP.M.FR.N.000000.4.ANR", where = "time_period_start >= date'2025-01-01'")
#' }
bdf_data <- function(
  series_key = NULL,
  select = NULL,
  where = NULL,
  group_by = NULL,
  order_by = NULL,
  lang = "en",
  tz = "UTC",
  api_args = list(),
  api_key = bdf_key()
) {
  stopifnot(
    is_string(series_key, null_ok = TRUE),
    is_string(select, null_ok = TRUE),
    is_string(where, null_ok = TRUE),
    is_string(group_by, null_ok = TRUE),
    is_string(order_by, null_ok = TRUE),
    is_string(lang),
    nchar(lang) == 2L,
    is_string(api_key),
    is.list(api_args)
  )

  url <- "https://webstat.banque-france.fr/api/explore/v2.1/catalog/datasets/observations/exports/csv" # nolint
  refine <- sprintf("series_key:\"%s\"", series_key)
  params <- list(
    refine = refine,
    select = select,
    where = where,
    group_by = group_by,
    order_by = order_by,
    lang = lang,
    timezone = tz,
    delimiter = ";",
    compressed = TRUE
  )
  params <- utils::modifyList(params, api_args)

  req <- request(url) |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_headers(Authorization = paste("Apikey", api_key)) |>
    req_url_query(!!!params) |>
    req_error(body = bdf_error_body)

  tf <- tempfile()
  on.exit(unlink(tf), add = TRUE)
  req_perform(req, path = tf)
  fread(file = tf, sep = ";", tz = )
}

bdf_datasets <- function() {
  url <- "https://webstat.banque-france.fr/api/explore/v2.1/catalog/datasets/webstat-datasets/exports/csv"
  tf <- tempfile()
  request(url) |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_headers(Authorization = paste("Apikey", bdf_key())) |>
    req_error(body = bdf_error_body) |>
    req_url_query(lang = "en") |>
    req_perform(path = tf)
  fread(file = tf, sep = ";")
}

bdf_error_body <- function(resp) {
  content_type <- resp_content_type(resp)
  if (identical(content_type, "application/json")) {
    json <- resp_body_json(resp)
    msg <- c(json$error_key, json$message)
    docs <- "See docs at <https://webstat.banque-france.fr/en/pages/guide-migration-api>" # nolint
    c(msg, docs)
  }
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
