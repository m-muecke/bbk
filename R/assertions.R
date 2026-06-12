check_dateish = function(x, null.ok = FALSE) {
  if (null.ok && is.null(x)) {
    return(TRUE)
  }
  if (test_date(x, any.missing = FALSE, len = 1L)) {
    return(TRUE)
  }
  if (test_string(x, pattern = "^\\d{4}-\\d{2}-\\d{2}$")) {
    return(TRUE)
  }
  if (null.ok) {
    "Must be `NULL`, a Date, or a string in 'YYYY-MM-DD' format"
  } else {
    "Must be a Date or a string in 'YYYY-MM-DD' format"
  }
}

assert_dateish = function(x, null.ok = FALSE, .var.name = vname(x), add = NULL) {
  res = check_dateish(x, null.ok)
  makeAssertion(x, res, .var.name, add)
  if (!is.null(x) && !inherits(x, "Date")) {
    x = as.Date(x)
  }
  invisible(x)
}

check_timestampish = function(x, null.ok = FALSE) {
  if (null.ok && is.null(x)) {
    return(TRUE)
  }
  if (test_multi_class(x, c("POSIXt", "Date")) && length(x) == 1L && !anyNA(x)) {
    return(TRUE)
  }
  if (test_string(x, min.chars = 4L)) {
    return(TRUE)
  }
  if (null.ok) {
    "Must be `NULL`, a Date, a POSIXct, or an ISO 8601 string"
  } else {
    "Must be a Date, a POSIXct, or an ISO 8601 string"
  }
}

assert_timestampish = function(x, null.ok = FALSE, .var.name = vname(x), add = NULL) {
  res = check_timestampish(x, null.ok)
  makeAssertion(x, res, .var.name, add)
  if (is.null(x)) {
    return(invisible())
  }
  if (inherits(x, c("POSIXt", "Date"))) {
    x = format(as.POSIXct(x, tz = "UTC"), "%Y-%m-%dT%H:%M:%S", tz = "UTC")
  }
  invisible(x)
}

assert_period = function(x, .var.name = vname(x)) {
  assert(
    check_null(x),
    check_string(x, min.chars = 1L),
    check_count(x, positive = TRUE),
    .var.name = .var.name
  )
  invisible(x)
}

assert_exclusive = function(x, y) {
  if (!is.null(x) && !is.null(y)) {
    stop(
      sprintf(
        "`%s` and `%s` are mutually exclusive.",
        deparse1(substitute(x)),
        deparse1(substitute(y))
      ),
      call. = FALSE
    )
  }
}
