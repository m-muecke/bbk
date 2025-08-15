#' Fetch Banco de España (BdE) data
#'
#' @details
#' You can search for the series codes in the
#' [BIEST](https://app.bde.es/bie_www/bie_wwwias/xml/Arranque.html) application or in the tables
#' published by the Banco de España.
#'
#' @param series (`character()`) the series codes to retrieve data for.
#' @param time_range (`character(1)` | `integer(1)`) the time range for the data.
#'   Can be an annual range (e.g., `2024`) or a frequency-based code:
#'   * Daily frequency (D): `"3M"` (last 3 months), `"12M"`, `"36M"`
#'   * Monthly frequency (M): `"30M"`, `"60M"`, `"MAX"` (entire series)
#'   * Quarterly frequency (Q): `"30M"`, `"60M"`, `"MAX"`
#'   * Annual frequency (A): `"60M"`, `"MAX"`
#'
#'   If `NULL` (default), returns the smallest range for the series frequency
#'   (e.g., `"30M"` for monthly series).
#' @param lang (`character(1)`)  the language of the response, either `"en"` or `"es"`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.bde.es/webbe/en/estadisticas/recursos/api-estadisticas-bde.html>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' bde_data("D_1NBAF472", time_range = "30MM")
#' bde_data(c("DTNPDE2010_P0000P_PS_APU", "DTNSEC2010_S0000P_APU_SUMAMOVIL"), time_range = "MAX") -> x
#' bde_data( "DEEQ.N.ES.W1.S1.S1.T.B.G._Z._Z._Z.EUR._T._X.N.ALL", time_range = 2024)
#' }
bde_data <- function(series = "D_1NBAF472", time_range = NULL, lang = c("en", "en")) {
  stopifnot(
    is_character(series),
    is.null(time_range) || is_count(time_range) || is_string(time_range)
  )
  lang <- match.arg(lang)
  json <- bde(series, time_range, lang)
  parse_bde_data(json)
}

bde <- function(series, time_range, lang) {
  url <- "https://app.bde.es/bierest/resources/srdatosapp/listaSeries"
  request(url) |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_query(idioma = lang, series = series, rango = time_range, .multi = "comma") |>
    req_error(body = bde_error_body) |>
    req_perform() |>
    resp_body_json()
}

bde_error_body <- function(resp) {
  content_type <- resp_content_type(resp)
  if (identical(content_type, "application/json")) {
    json <- resp_body_json(resp)
    msg <- c(json$errMsgUsr, json$errMsgDebug)
    docs <- "See docs at <https://www.bde.es/webbe/en/estadisticas/recursos/api-estadisticas-bde.html>" # nolint
    c(msg, docs)
  }
}

parse_bde_data <- function(json) {
  old_cols <- c(
    "serie",
    "descripcion",
    "descripcionCorta",
    "codFrecuencia",
    "decimales",
    "simbolo",
    "informacion",
    "fechaInicio",
    "fechaFin",
    "fechas",
    "valores"
  )
  new_cols <- c(
    "series",
    "description",
    "short_description",
    "freq",
    "decimals",
    "symbol",
    "metadata",
    "start_date",
    "end_date",
    "date",
    "value"
  )
  dt <- json |>
    lapply(\(x) suppressWarnings(as.data.table(x))) |>
    rbindlist() |>
    setnames(old_cols, new_cols)

  value <- metadata <- NULL
  dt[, let(date = unlist(date, use.names = FALSE), value = unlist(value, use.names = FALSE))]
  dt[,
    c("title", "long_description") := unlist(metadata, recursive = FALSE),
    by = setdiff(names(dt), "metadata")
  ]
  dt[, metadata := NULL]
  dt[,
    names(.SD) := lapply(.SD, \(x) as.POSIXct(x, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")),
    .SDcols = patterns("date")
  ]
  dt[]
}
