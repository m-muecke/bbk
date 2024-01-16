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

is_string <- function(x) is.character(x) && length(x) == 1L

na_if_empty <- function(x) replace(x, x == "", NA_character_)

is_integerish <- function(x, tol = .Machine$double.eps^0.5) {
  is.numeric(x) && length(x) == 1L && abs(x - round(x)) < tol
}
