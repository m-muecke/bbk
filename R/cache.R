#' Get or manage the bbk API cache
#'
#' `bbk_cache_dir()` returns the path where cached API responses are stored.
#' `bbk_cache_clear()` clears all cached responses.
#'
#' @details
#' The cache is only used when enabled with `options(bbk.cache = TRUE)`.
#'
#' Each API's caching headers decide whether and for how long a cached response is reused, so the
#' cache helps more with some APIs than others. APIs that allow reuse do so for minutes rather than
#' hours. Others check a cached response with the API on every call, which only saves downloading
#' it again, and many don't allow caching at all.
#'
#' Cached responses older than 1 day are deleted. Change this with
#' `options(bbk.cache_max_age = seconds)`. A higher value doesn't make responses be reused for
#' longer than the API allows.
#'
#' @name cache
#' @returns
#' `bbk_cache_dir()` returns a string with the path to the cache directory.
#'
#' `bbk_cache_clear()` is called for its side effect of clearing the cached
#' responses and returns `NULL` invisibly.
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
bbk_cache_dir = function() {
  file.path(tools::R_user_dir("bbk", "cache"), "httr2")
}

#' @rdname cache
#' @export
bbk_cache_clear = function() {
  cache_dir = bbk_cache_dir()
  if (dir.exists(cache_dir)) {
    unlink(dir(cache_dir, full.names = TRUE))
  }
  invisible()
}

req_bbk_cache = function(req) {
  if (isTRUE(getOption("bbk.cache", FALSE))) {
    req = req_cache(
      req,
      path = bbk_cache_dir(),
      max_age = getOption("bbk.cache_max_age", 86400L) # 1 day
    )
  }
  req
}
