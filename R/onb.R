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
    setnames(convert_camel_case) |>
    setnames("pos_title", "title") |>
    setcolorder(c("date", "pos", "value", "title", "freq"))
  dt
}

#' Fetch Österreichische Nationalbank (OeNB) metadata
#'
#' @inheritParams onb_data
#' @inherit onb_data return
#' @family metadata
#' @export
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
  x <- setNames(xml2::as_list(meta), xml2::xml_name(meta))
  x <- x[lengths(x) == 1L]
  x <- unlist(x, recursive = FALSE)
  dt <- setDT(x)
  dt[, names(dt) := lapply(.SD, trimws), .SDcols = is.character]
  dt[, names(dt) := lapply(.SD, \(x) replace(x, x == "-", NA)), .SDcols = is.character][]
}

#' Fetch Österreichische Nationalbank (OeNB) data frequency
#'
#' @inheritParams onb_data
#' @inherit onb_data return
#' @family metadata
#' @export
#' @examples
#' \dontrun{
#' onb_frequency(hierid = 74, pos = "VDBOSBHAGBSTIN")
#' onb_frequency(hierid = 11, pos = "VDBFKBSC217000")
#' }
onb_frequency <- function(hierid, pos, lang = "en", ...) {
  stopifnot(
    is_count(hierid),
    is_string(pos, null_ok = TRUE),
    is_string(lang)
  )
  xml <- onb(resource = "datafrequency", hierid = hierid, pos = pos, lang = toupper(lang), ...)
  parse_onb_frequency(xml)
}

parse_onb_frequency <- function(xml) {
  dt <- xml |>
    xml2::xml_find_all(".//dataSet") |>
    lapply(function(x) {
      freq <- x |> xml2::xml_find_all(".//periods") |> xml2::xml_attr("frequency")
      avail <- x |> xml2::xml_find_all(".//periods/available") |> xml2::xml_text()
      dt <- data.table(freq = freq, available = avail)
      attrs <- xml2::xml_attrs(x)
      dt[, names(attrs) := as.list(attrs)]
    }) |>
    rbindlist() |>
    setnames(\(x) sub("_code", "", tolower(x), fixed = TRUE))
  dt
}

#' Fetch Österreichische Nationalbank (OeNB) content
#'
#' @inheritParams onb_data
#' @inherit onb_data return
#' @family metadata
#' @export
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
  stopifnot(
    is_count(hierid, null_ok = TRUE),
    is_string(pos, null_ok = TRUE),
    is_string(lang)
  )
  xml <- onb(resource = "content", hierid = hierid, pos = pos, lang = toupper(lang), ...)
  has_hierid <- !is.null(hierid)
  has_pos <- !is.null(pos)
  if (has_hierid && has_pos) {
    parse_onb_content_dim(xml)
  } else if (has_hierid) {
    parse_onb_content_hier(xml)
  } else {
    parse_onb_content(xml)
  }
}

parse_onb_content <- function(xml) {
  elem <- xml2::xml_find_all(xml, ".//content/element")
  dt <- elem |>
    xml2::xml_attrs() |>
    lapply(\(x) setDT(as.list(x))) |>
    rbindlist()
  desc <- xml2::xml_find_all(elem, "text") |> xml2::xml_text()
  dt[, description := desc][]
}

parse_onb_content_hier <- function(xml) {
  xml |>
    xml2::xml_find_all(".//group") |>
    lapply(function(grp) {
      pos <- xml2::xml_find_all(grp, ".//position")
      data.table(
        group = xml2::xml_attr(grp, "name"),
        id = xml2::xml_attr(pos, "id"),
        value = xml2::xml_text(pos)
      )
    }) |>
    rbindlist()
}

parse_onb_content_dim <- function(xml) {
  dt <- xml |>
    xml2::xml_find_all(".//data_content/structure/dimension") |>
    xml2::xml_attrs() |>
    lapply(\(x) setDT(as.list(x))) |>
    rbindlist()
  dt[, nr := as.integer(nr)][]
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
