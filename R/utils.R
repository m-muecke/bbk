`%||%` <- function(x, y) {
  if (is.null(x)) y else x
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
