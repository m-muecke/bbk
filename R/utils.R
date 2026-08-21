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
    weekly = parse_iso_week(date),
    monthly = parse_period(date, 1L),
    quarterly = parse_period(date, 3L),
    `semi-annual` = parse_period(date, 6L),
    annual = as.Date(sprintf("%s-01-01", date), format = "%Y-%m-%d"),
    date
  )
}

parse_period = function(date, months) {
  n = as.integer(sub("^\\d{4}\\D*", "", date))
  month = (n - 1L) * months + 1L
  as.Date(sprintf("%s-%02d-01", substr(date, 1L, 4L), month), format = "%Y-%m-%d")
}

parse_iso_week = function(date) {
  jan4 = as.Date(sprintf("%s-01-04", substr(date, 1L, 4L)), format = "%Y-%m-%d")
  week1 = jan4 - (as.integer(format(jan4, "%u")) - 1L)
  week1 + (as.integer(sub("^\\d{4}\\D*", "", date)) - 1L) * 7L
}

extract_metadata = function(string, pattern, fixed = FALSE) {
  x = grepv(pattern, string, fixed = fixed)
  if (length(x) == 0L) {
    return(NA_character_)
  }
  fields = scan(
    text = x[[1L]],
    what = "",
    sep = ",",
    quote = "\"",
    quiet = TRUE,
    na.strings = character()
  )
  if (length(fields) < 2L) NA_character_ else fields[[2L]]
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
