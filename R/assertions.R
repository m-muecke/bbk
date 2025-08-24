check_dateish <- function(x, null.ok = FALSE) {
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

assert_dateish <- function(x, null.ok = FALSE, .var.name = vname(x), add = NULL) {
  res <- check_dateish(x, null.ok)
  makeAssertion(x, res, .var.name, add)
  if (!is.null(x)) {
    x <- as.Date(x)
  }
  invisible(x)
}

assert_period <- function(x, .var.name = vname(x)) {
  assert(
    check_null(x),
    check_string(x, min.chars = 1L),
    check_count(x, positive = TRUE),
    .var.name = .var.name
  )
}
