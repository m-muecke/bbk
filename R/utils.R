`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}

is_installed <- function(pkg) {
  isTRUE(requireNamespace(pkg, quietly = TRUE))
}

as_tibble <- function(x) {
  if (getOption("bundesbank.use_tibble", TRUE) && is_installed("tibble")) {
    tibble::as_tibble(x)
  } else {
    x
  }
}

is_character <- function(x) {
  is.character(x) && !any(is.na(x))
}

is_string <- function(x) {
  is.character(x) && length(x) == 1L && !is.na(x)
}

is_string_or_null <- function(x) {
  is.null(x) || is_string(x)
}

is_count <- function(x) {
  is.numeric(x) && length(x) == 1L && !is.na(x) &&
    as.integer(x) == x && x > 0L
}

is_count_or_null <- function(x) {
  is.null(x) || is_count(x)
}

na_if_empty <- function(x) {
  replace(x, x == "", NA_character_)
}
