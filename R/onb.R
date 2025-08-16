#' Fetch Österreichische Nationalbank (OeNB) data
#'
#' @param hierid (`integer(1)`)
#' @param pos (`character(1)`)
#' @param start_period (`character(1)`)
#' @param end_period (`character(1)`)
#' @param freq (`character(1)`)
#' @param lang (`character(1)`)
#' @param ... additional parameters to pass to the API.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.oenb.at/en/Statistics/User-Defined-Tables/webservice.html>
#' @family data
#' @export
#' @examples
#' \dontrun{
#' onb_data(hierid = 11, pos = "VDBFKBSC217000")
#' onb_data(hierid = 11, pos = "VDBFKBSC217000", start_period = "2020-01-01")
#' }
onb_data <- function(
  hierid,
  pos,
  start_period = NULL,
  end_period = NULL,
  freq = NULL,
  lang = "en",
  ...
) {
  stopifnot(
    is_count(hierid),
    is_string(pos),
    is_string(start_period, null_ok = TRUE),
    is_string(end_period, null_ok = TRUE),
    is_string(freq, null_ok = TRUE),
    is_string(lang)
  )
  xml <- onb(
    resource = "data",
    hierid = hierid,
    pos = pos,
    starttime = start_period,
    endtime = end_period,
    freq = freq,
    lang = toupper(lang),
    ...
  )
  parse_onb_data(xml)
}

parse_onb_data <- function(xml) {
  dt <- xml |>
    xml2::xml_find_all(".//dataSet") |>
    lapply(function(x) {
      obs <- xml2::xml_find_all(x, ".//obs")
      dt <- data.table(
        date = xml2::xml_attr(obs, "periode"),
        value = as.numeric(xml2::xml_attr(obs, "value"))
      )
      attrs <- xml2::xml_attrs(x)
      dt[, names(attrs) := as.list(attrs)]
    }) |>
    rbindlist() |>
    setnames(convert_camel_case)
  dt
}

#' Fetch Österreichische Nationalbank (OeNB) metadata
#'
#' @inheritParams onb_data
#' @examples
#' \dontrun{
#' onb_metadata(hierid = 11, pos = "VDBFKBSC217000")
#' }
onb_metadata <- function(hierid, pos, lang = "en", ...) {
  stopifnot(
    is_count(hierid),
    is_string(pos),
    is_string(lang)
  )
  xml <- onb(resource = "meta", hierid = hierid, pos = pos, lang = toupper(lang), ...)
  parse_onb_metadata(xml)
}

parse_onb_metadata <- function(xml) {
  meta <- xml |> xml2::xml_find_all("meta") |> xml2::xml_children()
  meta
}

#' Fetch Österreichische Nationalbank (OeNB) data frequency
#'
#' @inheritParams onb_data
#' @examples
#' \dontrun{
#' onb_freq(hierid = 74, pos = NULL)
#' }
onb_freq <- function(pos, hierid, lang = "en", ...) {
  stopifnot(
    is_count(hierid),
    is_string(pos, null_ok = TRUE),
    is_string(lang)
  )
  xml <- onb(resource = "datafrequency", hierid = hierid, pos = pos, lang = toupper(lang), ...)
  parse_onb_freq(xml)
}

parse_onb_freq <- function(xml) {
  dt <- xml |>
    xml2::xml_find_all(".//dataSet") |>
    lapply(function(x) {
      freq <- x |> xml2::xml_find_all(".//periods") |> xml2::xml_attr("frequency")
      dt <- data.table(freq = freq)
      attrs <- xml2::xml_attrs(x)
      dt[, names(attrs) := as.list(attrs)]
    }) |>
    rbindlist() |>
    setnames(\(x) sub("_code", "", tolower(x), fixed = TRUE))
  dt
}

#' Fetch Österreichische Nationalbank (OeNB) data frequency
#'
#' @inheritParams onb_data
#' @examples
#' \dontrun{
#' # table of contents
#' onb_content()
#' # several positions of the same hierarchy
#' onb_content(hierid = 11)
#' # dimensions for individual indicators
#' onb_content(hierid = 11, pos = "VDBFKBSC217000")
#' }
onb_content <- function(hierid = NULL, pos = NULL, lang = "en", ...) {
  onb(resource = "content", hierid = hierid, pos = pos, lang = toupper(lang), ...)
}

onb <- function(resource, ...) {
  request("https://www.oenb.at/isadataservice") |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_path_append(resource) |>
    req_url_query(...) |>
    req_error(
      is_error = function(resp) {
        if (resp_status(resp) >= 400L) {
          return(TRUE)
        }
        x <- resp |> resp_body_xml() |> xml2::xml_find_first("errors")
        !is.na(x)
      },
      body = function(resp) {
        content_type <- resp_content_type(resp)
        if (identical(content_type, "application/xml")) {
          resp |> resp_body_xml() |> xml2::xml_text()
        }
      }
    ) |>
    req_perform() |>
    resp_body_xml()
}
