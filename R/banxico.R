#' Fetch Banco de México (Banxico) data
#'
#' Retrieve time series data from the Banco de México Sistema de Información Económica (SIE) API.
#'
#' The SIE API requires a free access token. Request one at
#' <https://www.banxico.org.mx/SieAPIRest/service/v1/token> and supply it via the `api_key`
#' argument or the `BANXICO_KEY` environment variable.
#'
#' Both `start_date` and `end_date` must be supplied to restrict the period; if either is `NULL`
#' the complete history of each series is returned.
#'
#' @param series (`character()`)\cr
#'   One or more SIE series codes to query (e.g., `"SF43718"` for the FIX peso/US dollar exchange
#'   rate). Series codes can be found on the SIE website.
#' @param start_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   Start date of the data (e.g., `"2024-01-01"`). Must be paired with `end_date`. If `NULL`, the
#'   full history is returned. Default `NULL`.
#' @param end_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   End date of the data, in the same format as start_date. Must be paired with `start_date`. If
#'   `NULL`, the full history is returned. Default `NULL`.
#' @param api_key (`character(1)`)\cr
#'   The SIE API token. Defaults to the `BANXICO_KEY` environment variable.
#' @returns A [data.table::data.table()] with columns `date`, `key`, and `value`.
#' @source <https://www.banxico.org.mx/SieAPIRest/service/v1/>
#' @family data
#' @export
#' @examplesIf curl::has_internet() && nzchar(Sys.getenv("BANXICO_KEY"))
#' \donttest{
#' # fetch the FIX peso/US dollar exchange rate
#' banxico_data("SF43718", start_date = "2024-01-01", end_date = "2024-01-31")
#'
#' # fetch multiple series at once
#' banxico_data(c("SF43718", "SF60653"), start_date = "2024-01-01", end_date = "2024-01-31")
#' }
banxico_data = function(series, start_date = NULL, end_date = NULL, api_key = banxico_key()) {
  assert_character(series, min.len = 1L, min.chars = 1L, any.missing = FALSE)
  start_date = assert_dateish(start_date, null.ok = TRUE)
  end_date = assert_dateish(end_date, null.ok = TRUE)
  assert_string(api_key, min.chars = 1L)

  ids = paste(series, collapse = ",")
  resource = paste0("series/", ids, "/datos")
  if (!is.null(start_date) && !is.null(end_date)) {
    resource = paste(
      resource,
      format(start_date, "%Y-%m-%d"),
      format(end_date, "%Y-%m-%d"),
      sep = "/"
    )
  }
  json = banxico(resource, api_key = api_key)
  parse_banxico_data(json)
}

parse_banxico_data = function(json) {
  series = json$bmx$series
  empty = data.table(date = as.Date(character()), id = character(), value = numeric())
  setnames(empty, "id", "key")
  if (length(series) == 0L) {
    return(empty[])
  }
  dt = rbindlist(map(series, function(s) {
    datos = s$datos
    if (length(datos) == 0L) {
      return(data.table(date = as.Date(character()), id = character(), value = numeric()))
    }
    data.table(
      date = as.Date(map_chr(datos, "fecha"), "%d/%m/%Y"),
      id = s$idSerie,
      value = banxico_as_numeric(map_chr(datos, "dato"))
    )
  }))
  setnames(dt, "id", "key")
  setcolorder(dt, c("date", "key", "value"))
  dt[]
}

#' Fetch Banco de México (Banxico) metadata
#'
#' Retrieve series metadata from the Banco de México Sistema de Información Económica (SIE) API.
#'
#' @inheritParams banxico_data
#' @returns A [data.table::data.table()] with columns `id`, `title`, `freq`, `unit`, `start`, and
#'   `end`.
#' @source <https://www.banxico.org.mx/SieAPIRest/service/v1/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet() && nzchar(Sys.getenv("BANXICO_KEY"))
#' \donttest{
#' banxico_metadata("SF43718")
#' }
banxico_metadata = function(series, api_key = banxico_key()) {
  assert_character(series, min.len = 1L, min.chars = 1L, any.missing = FALSE)
  assert_string(api_key, min.chars = 1L)

  ids = paste(series, collapse = ",")
  json = banxico(paste0("series/", ids), api_key = api_key)
  parse_banxico_metadata(json)
}

parse_banxico_metadata = function(json) {
  series = json$bmx$series
  if (length(series) == 0L) {
    return(data.table(
      id = character(),
      title = character(),
      freq = character(),
      unit = character(),
      start = as.Date(character()),
      end = as.Date(character())
    ))
  }
  data.table(
    id = map_chr(series, "idSerie"),
    title = trimws(gsub("\\s+", " ", map_chr(series, "titulo"))),
    freq = banxico_freq(map_chr(series, \(x) x$periodicidad %||% NA_character_)),
    unit = map_chr(series, \(x) x$unidad %||% NA_character_),
    start = as.Date(map_chr(series, \(x) x$fechaInicio %||% NA_character_), "%d/%m/%Y"),
    end = as.Date(map_chr(series, \(x) x$fechaFin %||% NA_character_), "%d/%m/%Y")
  )
}

banxico_freq = function(x) {
  freq = c(
    Diaria = "daily",
    Semanal = "weekly",
    Quincenal = "biweekly",
    Mensual = "monthly",
    Bimestral = "bimonthly",
    Trimestral = "quarterly",
    Semestral = "semi-annual",
    Anual = "annual"
  )
  out = unname(freq[x])
  out[is.na(out)] = x[is.na(out)]
  out
}

banxico_as_numeric = function(x) {
  x[x == "N/E"] = NA_character_
  as.numeric(gsub(",", "", x, fixed = TRUE))
}

banxico = function(resource, ..., api_key = banxico_key()) {
  base_request("https://www.banxico.org.mx/SieAPIRest/service/v1") |>
    req_url_path_append(resource) |>
    req_headers(`Bmx-Token` = api_key, Accept = "application/json") |>
    req_url_query(...) |>
    req_error(body = banxico_error_body) |>
    req_perform() |>
    resp_body_json()
}

banxico_key = function() {
  get_api_key("BANXICO_KEY")
}

banxico_error_body = function(resp) {
  if (identical(resp_content_type(resp), "application/json")) {
    error = resp_body_json(resp)$error
    error$detail %||% error$mensaje
  }
}
