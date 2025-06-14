is_character <- function(x) {
  is.character(x) && !anyNA(x) && length(x) > 0L
}

is_character_or_null <- function(x) {
  is.null(x) || is_character(x)
}

is_string <- function(x) {
  is.character(x) && length(x) == 1L && !is.na(x)
}

is_string_or_null <- function(x) {
  is.null(x) || is_string(x)
}

is_count <- function(x) {
  is.numeric(x) && length(x) == 1L && !is.na(x) && as.integer(x) == x && x > 0L
}

is_count_or_null <- function(x) {
  is.null(x) || is_count(x)
}

is_valid_date <- function(x) {
  if (is.null(x)) {
    return(TRUE)
  }
  if (length(x) != 1L) {
    return(FALSE)
  }
  x <- as.character(x)
  if (grepl("^\\d{4}-\\d{2}-\\d{2}$", x)) TRUE else FALSE
}
