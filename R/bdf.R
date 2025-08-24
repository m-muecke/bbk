#' Fetch Banque de France (BdF) data
#'
#' Retrieve time series data from the BdF Webstat API.
#'
#' @param ... (any)\cr
#'   Extra arguments appended to the API request.
#'   Combined with the default arguments with [modifyList()].
#' @param key (`NULL` | `character(1)`)\cr
#'   The series key to query. Default `NULL`.
#' @param start_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   Start date of the data. Default `NULL`.
#' @param end_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   End date of the data. Default `NULL`.
#' @param api_key (`character(1)`)\cr
#'   API key to use for the request. Defaults to the value returned by `bdf_key()`, which reads from
#'   the `BANQUEDEFRANCE_KEY` environment variable.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://webstat.banque-france.fr/en/pages/guide-migration-api/>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' bdf_data(key = "CONJ2.M.R24.T.SM.0RG24.EFTPM100.10")
#' # inflation rate
#' bdf_data(key = "ICP.M.FR.N.000000.4.ANR")
#' # or with a date filter
#' bdf_data(key = "ICP.M.FR.N.000000.4.ANR", start_date = "2025-01-01", end_date = "2025-06-30")
#' # advanced filter with where clause
#' bdf_data(key = "ICP.M.FR.N.000000.4.ANR", where = "time_period_start >= date'2025-01-01'")
#' }
bdf_data <- function(..., key = NULL, start_date = NULL, end_date = NULL, api_key = bdf_key()) {
  assert_string(key, min.chars = 1L, null.ok = TRUE)
  assert_string(api_key, min.chars = 1L)
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)

  if (!is.null(key)) {
    key <- sprintf('series_key:"%s"', key)
  }
  where <- character()
  if (!is.null(start_date)) {
    start_date <- sprintf("time_period_start >= date'%s'", start_date)
    where <- c(where, start_date)
  }
  if (!is.null(end_date)) {
    end_date <- sprintf("time_period_end <= date'%s'", end_date)
    where <- c(where, end_date)
  }
  where <- if (length(where) > 0L) paste(where, collapse = " and ") else NULL
  params <- list(refine = key, where = where)
  params <- utils::modifyList(params, list(...))

  dt <- do.call(bdf, c(list(resource = "observations/exports/csv"), params))
  parse_bdf_data(dt)
}

#' Fetch Banque de France (BdF) datasets
#'
#' @inheritParams bdf_data
#' @inherit bdf_data return
#' @source <https://webstat.banque-france.fr/en/pages/guide-migration-api/>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' bdf_dataset()
#' # structure of a dataset
#' bdf_dataset(where = "dataset_id = 'CONJ2'")
#' }
bdf_dataset <- function(...) {
  dt <- bdf(resource = "webstat-datasets/exports/csv", ...)
  parse_bdf_dataset(dt)
}

#' Fetch Banque de France (BdF) codelists
#'
#' @inheritParams bdf_data
#' @inherit bdf_data return
#' @source <https://webstat.banque-france.fr/en/pages/guide-migration-api/>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' bdf_codelist()
#' # filter for a specific codelist
#' bdf_codelist(where = "codelist_id = 'CL_FREQ'")
#' }
bdf_codelist <- function(...) {
  bdf(resource = "codelists/exports/csv", ...)
}

parse_bdf_data <- function(dt) {
  nms <- names(dt)
  path_cols <- grep("^path_", names(dt), value = TRUE)
  if (length(path_cols) > 0L) {
    dt[, (path_cols) := lapply(mget(path_cols), \(x) strsplit(x, ",", fixed = TRUE))]
  }
  if ("observations_attributes_and_values" %in% nms) {
    observations_attributes_and_values <- NULL # nolint
    dt[,
      observations_attributes_and_values := gsub(
        '""',
        '"',
        observations_attributes_and_values,
        fixed = TRUE
      )
    ]
    dt[,
      observations_attributes_and_values := lapply(
        observations_attributes_and_values,
        jsonlite::fromJSON
      )
    ]
  }
  dt[]
}

parse_bdf_dataset <- function(dt) {
  paths_cols <- grep("^paths_", names(dt), value = TRUE)
  if (length(paths_cols) > 0L) {
    dt[, (paths_cols) := lapply(mget(paths_cols), \(x) strsplit(x, ",", fixed = TRUE))]
  }
  codelist_cols <- grep("_codelists$", names(dt), value = TRUE)
  if (length(codelist_cols) > 0L) {
    dt[,
      (codelist_cols) := lapply(mget(codelist_cols), function(x) {
        lapply(gsub('""', '"', x, fixed = TRUE), jsonlite::fromJSON)
      })
    ]
  }
  dt[]
}

bdf <- function(resource, ...) {
  tf <- tempfile()
  on.exit(unlink(tf), add = TRUE)
  request("https://webstat.banque-france.fr/api/explore/v2.1/catalog/datasets") |>
    req_url_path_append(resource) |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_headers(Authorization = paste("Apikey", bdf_key())) |>
    req_error(body = bdf_error_body) |>
    req_url_query(..., delimiter = ";", compressed = TRUE) |>
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
