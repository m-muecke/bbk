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

is_string <- function(x) is.character(x) && length(x) == 1

map <- function(.x, .f, ...) {
  if (is.function(.f)) {
    lapply(.x, .f, ...)
  } else {
    lapply(.x, `[[`, .f, ...)
  }
}

na_if_empty <- function(x) replace(x, x == "", NA_character_)
