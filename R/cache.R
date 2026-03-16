#' Get or manage the bbk API cache
#'
#' `bbk_cache_dir()` returns the path where cached API responses are stored.
#' `bbk_cache_clear()` clears all cached responses.
#'
#' @details
#' The cache is only used when enabled with `options(bbk.cache = TRUE)`.
#' Cached responses are stored for 1 day by default, but this can be customized with
#' `options(bbk.cache_max_age = seconds)`.
#'
#' @name cache
#' @examples
#' \dontrun{
#' # enable caching
#' options(bbk.cache = TRUE)
#'
#' # view cache location
#' bbk_cache_dir()
#'
#' # clear the cache
#' bbk_cache_clear()
#' }
NULL

#' @rdname cache
#' @export
bbk_cache_dir <- function() {
  file.path(tools::R_user_dir("bbk", "cache"), "httr2")
}

#' @rdname cache
#' @export
bbk_cache_clear <- function() {
  cache_dir <- bbk_cache_dir()
  if (dir.exists(cache_dir)) {
    unlink(dir(cache_dir, full.names = TRUE))
  }
}

req_bbk_retry <- function(req) {
  req_retry(req, max_tries = 3L)
}

req_bbk_cache <- function(req) {
  if (isTRUE(getOption("bbk.cache", FALSE))) {
    req <- req_cache(
      req,
      path = bbk_cache_dir(),
      max_age = getOption("bbk.cache_max_age", 86400L) # 1 day
    )
  }
  req
}
