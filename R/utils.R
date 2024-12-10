`%||%` <- function(x, y) if (is.null(x)) y else x

map <- function(.x, .f, ...) {
  if (is.function(.f)) {
    lapply(.x, .f, ...)
  } else {
    lapply(.x, `[[`, .f, ...)
  }
}

map_mold <- function(.x, .f, .value, ...) {
  out <- if (is.function(.f)) {
    vapply(.x, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...)
  } else {
    vapply(.x, `[[`, .f, FUN.VALUE = .value, USE.NAMES = FALSE, ...)
  }
  stats::setNames(out, names(.x))
}

map_chr <- function(.x, .f, ...) {
  map_mold(.x, .f, NA_character_, ...)
}

map_dbl <- function(.x, .f, ...) {
  map_mold(.x, .f, NA_real_, ...)
}

parse_date <- function(date, freq) {
  switch(freq,
    daily = as.Date(date),
    monthly = as.Date(paste0(date, "-01")),
    annual = as.integer(date),
    date
  )
}

extract_metadata <- function(string, pattern, fixed = FALSE) {
  x <- grep(pattern, string, value = TRUE, fixed = fixed)
  if (length(x) > 0L) {
    strsplit(x, ",", fixed = TRUE)[[1L]][[2L]]
  } else {
    NA_character_
  }
}
