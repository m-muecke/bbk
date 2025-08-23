#' @keywords internal
#' @import checkmate
#' @import data.table
#' @importFrom httr2 req_body_json
#' @importFrom httr2 req_error
#' @importFrom httr2 req_headers
#' @importFrom httr2 req_perform
#' @importFrom httr2 req_url_path_append
#' @importFrom httr2 req_url_query
#' @importFrom httr2 req_user_agent
#' @importFrom httr2 request
#' @importFrom httr2 resp_body_json
#' @importFrom httr2 resp_body_raw
#' @importFrom httr2 resp_body_string
#' @importFrom httr2 resp_body_xml
#' @importFrom httr2 resp_content_type
#' @importFrom httr2 resp_status
#' @importFrom httr2 resp_url
#' @importFrom stats na.omit setNames
"_PACKAGE"

the <- new.env(parent = emptyenv())
the$col_order <- c("date", "key", "value", "freq", "title", "description")
