is_character <- function(x, null_ok = FALSE) {
  if (null_ok && is.null(x)) {
    return(TRUE)
  }
  is.character(x) && !anyNA(x) && length(x) > 0L
}

is_string <- function(x, null_ok = FALSE) {
  if (null_ok && is.null(x)) {
    return(TRUE)
  }
  is.character(x) && length(x) == 1L && !is.na(x)
}

is_count <- function(x, null_ok = FALSE) {
  if (null_ok && is.null(x)) {
    return(TRUE)
  }
  is.numeric(x) && length(x) == 1L && !is.na(x) && as.integer(x) == x && x > 0L
}

is_dateish <- function(x, null_ok = FALSE) {
  if (null_ok && is.null(x)) {
    return(TRUE)
  }
  if (length(x) != 1L) {
    return(FALSE)
  }
  x <- as.character(x)
  if (grepl("^\\d{4}-\\d{2}-\\d{2}$", x)) TRUE else FALSE
}
