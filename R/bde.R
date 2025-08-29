#' Fetch Banco de España (BdE) data
#'
#' Retrieve time series data from the BdE statistics API.
#'
#' @details
#' You can search for the series codes in the
#' [BIEST](https://app.bde.es/bie_www/bie_wwwias/xml/Arranque.html) application or in the tables
#' published by the Banco de España.
#'
#' @param key (`character()`)\cr
#'   The series keys to query.
#' @param time_range (`NULL` | `character(1)` | `integer(1)`)\cr
#'   The time range for the data. Can be an annual range (e.g., `2024`) or a frequency-based code:
#'   * Daily frequency (D): `"3M"` (last 3 months), `"12M"`, `"36M"`
#'   * Monthly frequency (M): `"30M"`, `"60M"`, `"MAX"` (entire series)
#'   * Quarterly frequency (Q): `"30M"`, `"60M"`, `"MAX"`
#'   * Annual frequency (A): `"60M"`, `"MAX"`
#'
#'   If `NULL` (default), returns the smallest range for the series frequency
#'   (e.g., `"30M"` for monthly series).
#' @param lang (`character(1)`)\cr
#'   Language to query, either `"en"` or `"es"`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.bde.es/webbe/en/estadisticas/recursos/api-estadisticas-bde.html>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bde_data("D_1NBAF472", time_range = "30M")
#' bde_data(c("DTNPDE2010_P0000P_PS_APU", "DTNSEC2010_S0000P_APU_SUMAMOVIL"), time_range = "MAX")
#' bde_data("DEEQ.N.ES.W1.S1.S1.T.B.G._Z._Z._Z.EUR._T._X.N.ALL", time_range = 2024)
#' }
bde_data <- function(key, time_range = NULL, lang = "en") {
  assert_character(key, min.chars = 1L)
  assert_period(time_range)
  assert_choice(lang, c("en", "es"))

  json <- bde(key, time_range, lang)
  parse_bde_data(json)
}

parse_bde_data <- function(json) {
  old_cols <- c(
    "serie",
    "descripcion",
    "descripcionCorta",
    "codFrecuencia",
    "decimales",
    "simbolo",
    "fechaInicio",
    "fechaFin",
    "fechas",
    "valores"
  )
  new_cols <- c(
    "key",
    "description",
    "title",
    "freq",
    "decimals",
    "symbol",
    "start_date",
    "end_date",
    "date",
    "value"
  )
  dt <- json |>
    lapply(function(x) {
      dt <- as.data.table(x[names(x) != "informacion"])
      meta <- rbindlist(lapply(x$informacion, setDT))
      setnames(meta, c("name", "value"))
      name <- NULL
      meta[, name := tolower(name)]
      meta[, name := gsub(" ", "_", tolower(name), fixed = TRUE)]
      meta[, name := gsub("[()]", "", name)]
      exclude <- c(
        "name",
        "decimals",
        "first_value",
        "last_value",
        "number_of_observations",
        "min_value",
        "max_value"
      )
      meta <- meta[!name %in% exclude]
      meta <- transpose(meta, make.names = "name")
      setnames(meta, c("units", "description"), c("unit", "long_description"))
      dt[, names(meta) := meta]
    }) |>
    rbindlist(fill = TRUE) |>
    setnames(old_cols, new_cols)

  value <- NULL
  dt[, let(date = unlist(date, use.names = FALSE), value = unlist(value, use.names = FALSE))]
  dt[,
    names(.SD) := lapply(.SD, \(x) as.POSIXct(x, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")),
    .SDcols = patterns("date")
  ]
  dt <- setcolorder(dt, the$col_order, skip_absent = TRUE)
  dt[]
}

bde <- function(key, time_range, lang) {
  url <- "https://app.bde.es/bierest/resources/srdatosapp/listaSeries"
  request(url) |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_query(idioma = lang, series = key, rango = time_range, .multi = "comma") |>
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
