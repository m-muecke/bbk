bde_data <- function(series = "D_1NBAF472", lang = c("en", "en"), time_range = NULL) {
  stopifnot(
    is_character(series),
    is.null(time_range) || is_count(time_range) || is_string(time_range)
  )
  lang <- match.arg(lang)

  url <- "https://app.bde.es/bierest/resources/srdatosapp/listaSeries"
  json <- request(url) |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_query(idioma = lang, series = series, rango = time_range, .multi = "comma") |>
    req_perform() |>
    resp_body_json()

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
