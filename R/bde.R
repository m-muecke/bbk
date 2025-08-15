#' Returns Banco de España data for a given series
#'
#' @param series (`character()`)
#' @param time_range (`character(1)` | `integer(1)`)
#' @param lang (`character(1)`)
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.bde.es/webbe/en/estadisticas/recursos/api-estadisticas-bde.html>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' bde_data("D_1NBAF472", time_range = "30M")
#' bde_data(c("DTNPDE2010_P0000P_PS_APU", "DTNSEC2010_S0000P_APU_SUMAMOVIL"), time_range = "MAX")
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
    req_perform() |>
    resp_body_json()
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
