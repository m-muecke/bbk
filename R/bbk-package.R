#' @section Options:
#' * `bbk.cache`: Cache API responses on disk. Default `FALSE`. See [bbk_cache_dir()].
#' * `bbk.cache_max_age`: Delete cached responses older than this many seconds. Default `86400` (1
#'   day). It doesn't extend how long a response is reused, which each API decides. See
#'   [bbk_cache_dir()].
#' * `bbk.progress`: Show a progress bar for paginated requests that take longer than a few
#'   seconds. Default `TRUE`. Set to `FALSE` to hide it.
#'
#' @keywords internal
#' @import checkmate
#' @import data.table
#' @importFrom httr2 iterate_with_cursor
#' @importFrom httr2 req_body_json
#' @importFrom httr2 req_cache
#' @importFrom httr2 req_error
#' @importFrom httr2 req_headers
#' @importFrom httr2 req_perform
#' @importFrom httr2 req_perform_iterative
#' @importFrom httr2 req_retry
#' @importFrom httr2 req_url
#' @importFrom httr2 req_url_path_append
#' @importFrom httr2 req_url_query
#' @importFrom httr2 req_user_agent
#' @importFrom httr2 request
#' @importFrom httr2 resp_body_json
#' @importFrom httr2 resp_body_raw
#' @importFrom httr2 resp_body_string
#' @importFrom httr2 resp_body_xml
#' @importFrom httr2 resp_content_type
#' @importFrom httr2 resp_has_body
#' @importFrom httr2 resp_status
#' @importFrom httr2 resp_url
#' @importFrom httr2 resps_data
#' @importFrom stats median na.omit setNames
"_PACKAGE"

col_order = c("date", "key", "value", "freq", "title", "description")
