`%nin%` = function(x, y) {
  !match(x, y, nomatch = 0L)
}

`%||%` = function(lhs, rhs) {
  if (is.null(lhs)) rhs else lhs # nolint
}

`%&&%` = function(lhs, rhs) {
  if (is.null(lhs)) lhs else rhs
}

grepv = function(...) {
  grep(..., value = TRUE)
}

parse_date = function(date, freq) {
  if (length(freq) != 1L || is.na(freq)) {
    return(date)
  }
  switch(
    freq,
    daily = as.Date(date),
    monthly = as.Date(paste0(date, "-01")),
    annual = as.integer(date),
    date
  )
}

extract_metadata = function(string, pattern, fixed = FALSE) {
  x = grepv(pattern, string, fixed = fixed)
  if (length(x) > 0L) {
    strsplit(x, ",", fixed = TRUE)[[1L]][[2L]]
  } else {
    NA_character_
  }
}

convert_camel_case = function(x) {
  tolower(gsub("((?<=[a-z0-9])[A-Z]|(?!^)[A-Z](?=[a-z]))", "_\\1", x, perl = TRUE))
}

get_api_key = function(env_var) {
  key = Sys.getenv(env_var)
  if (nzchar(key)) {
    return(key)
  }
  if (is_testing()) {
    testthat::skip(sprintf("%s env var is not configured", env_var))
  }
  stop(
    sprintf(
      "No API key found, please supply with `api_key` argument or with %s env var.",
      env_var
    ),
    call. = FALSE
  )
}

is_testing = function() {
  identical(Sys.getenv("TESTTHAT"), "true")
}
