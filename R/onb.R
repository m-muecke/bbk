#' Fetch Österreichische Nationalbank (OeNB) data
#'
#' Retrieve time series data from the OeNB Web Service.
#'
#' @param hier_id (`integer(1)`)\cr
#'   Hierarchy id to query.
#' @param key (`character()`)\cr
#'   The series keys to query.
#' @param ... (`any`)\cr
#'   Additional parameters to pass to the API.
#' @param start_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   Start date of the data.
#' @param end_period (`NULL` | `character(1)` | `integer(1)`)\cr
#'   End date of the data.
#' @param freq (`NULL` | `character(1)`)\cr
#'   Frequency of the data.
#' @param lang (`character(1)`)\cr
#'   Language to query. Default `"en"`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.oenb.at/en/Statistics/User-Defined-Tables/webservice.html>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' onb_data(hier_id = 11, key = "VDBFKBSC217000")
#'
#' # Loans to euro area residents, since 2000:
#' onb_data(hier_id = 11, key = "VDBFKBSC217000", start_period = "2000-01-01")
#'
#' # Austrian imports and exports of goods from/to Germany, 2002–2012, annual frequency:
#' onb_data(hier_id = 901, key = "VDBQZA1000", start_period = 2002, end_period = 2012, freq = "A")
#'
#' # Number of Austrian banks' subsidiaries abroad an in the EU, from 2005, semiannual:
#' onb_data(
#'   hier_id = 321,
#'   key = c("VDBKISDANZTAU", "VDBKISDANZTEU"),
#'   start_period = 200501,
#'   freq = "H"
#' )
#' }
onb_data <- function(
  hier_id,
  key,
  ...,
  start_period = NULL,
  end_period = NULL,
  freq = NULL,
  lang = "en"
) {
  hier_id <- assert_count(hier_id, positive = TRUE, coerce = TRUE)
  assert_character(key, min.chars = 1L)
  assert_period(start_period)
  assert_period(end_period)
  assert_string(freq, min.chars = 1L, null.ok = TRUE)
  assert_string(lang, n.chars = 2L)

  xml <- onb(
    resource = "data",
    hierid = hier_id,
    pos = key,
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
    setnames(c("pos", "pos_title"), c("key", "title")) |>
    setcolorder(the$col_order, skip_absent = TRUE)
  dt
}

#' Fetch Österreichische Nationalbank (OeNB) metadata
#'
#' @inheritParams onb_data
#' @inherit onb_data return
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' onb_metadata(hier_id = 11, key = "VDBFKBSC217000")
#' }
onb_metadata <- function(hier_id, key, ..., lang = "en") {
  hier_id <- assert_count(hier_id, positive = TRUE, coerce = TRUE)
  assert_string(key, min.chars = 1L)
  assert_string(lang, n.chars = 2L)

  xml <- onb(resource = "meta", hierid = hier_id, pos = key, lang = toupper(lang), ...)
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
#' @examplesIf curl::has_internet()
#' \donttest{
#' onb_frequency(hier_id = 74, key = "VDBOSBHAGBSTIN")
#' onb_frequency(hier_id = 11, key = "VDBFKBSC217000")
#' }
onb_frequency <- function(hier_id, key, lang = "en", ...) {
  hier_id <- assert_count(hier_id, positive = TRUE, coerce = TRUE)
  assert_string(key, min.chars = 1L, null.ok = TRUE)
  assert_string(lang, n.chars = 2L)

  xml <- onb(resource = "datafrequency", hierid = hier_id, pos = key, lang = toupper(lang), ...)
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

#' Fetch Österreichische Nationalbank (OeNB) table of contents
#'
#' @inheritParams onb_data
#' @inherit onb_data return
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' onb_toc()
#' }
onb_toc <- function(lang = "en") {
  assert_string(lang, n.chars = 2L)
  xml <- onb(resource = "content", lang = toupper(lang))
  parse_onb_toc(xml)
}

#' Fetch Österreichische Nationalbank (OeNB) hierarchy
#'
#' @inheritParams onb_data
#' @inherit onb_data return
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' onb_hierarchy(hier_id = 11)
#' }
onb_hierarchy <- function(hier_id, lang = "en") {
  hier_id <- assert_count(hier_id, positive = TRUE, coerce = TRUE)
  xml <- onb(resource = "content", hierid = hier_id, lang = toupper(lang))
  parse_onb_hierarchy(xml)
}

#' Fetch Österreichische Nationalbank (OeNB) dimension
#'
#' @inheritParams onb_data
#' @inherit onb_data return
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' onb_dimension(hier_id = 11, key = "VDBFKBSC217000")
#' }
onb_dimension <- function(hier_id, key, lang = "en") {
  hier_id <- assert_count(hier_id, positive = TRUE, coerce = TRUE)
  assert_string(key, min.chars = 1L)
  assert_string(lang, n.chars = 2L)

  xml <- onb(resource = "content", hierid = hier_id, pos = key, lang = toupper(lang))
  parse_onb_dimension(xml)
}

parse_onb_toc <- function(xml) {
  elem <- xml2::xml_find_all(xml, ".//content/element")
  dt <- elem |>
    xml2::xml_attrs() |>
    lapply(\(x) setDT(as.list(x))) |>
    rbindlist()
  desc <- xml2::xml_find_all(elem, "text") |> xml2::xml_text()
  id <- parent <- NULL
  dt[, let(id = as.integer(id), parent = as.integer(parent), description = desc)]
  dt[]
}

parse_onb_hierarchy <- function(xml) {
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

parse_onb_dimension <- function(xml) {
  dt <- xml |>
    xml2::xml_find_all(".//data_content/structure/dimension") |>
    xml2::xml_attrs() |>
    lapply(\(x) setDT(as.list(x))) |>
    rbindlist()
  nr <- NULL
  dt[, nr := as.integer(nr)][]
}

onb <- function(resource, ...) {
  request("https://www.oenb.at/isadataservice") |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_path_append(resource) |>
    req_url_query(..., .multi = "explode") |>
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
