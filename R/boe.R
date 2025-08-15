#' Fetch Bank of England (BoE) data
#'
#' @param id (`character(1)`) BoE series codes.
#' @param start_date (`character(1)` | `Date(1)`) start date of the time series.
#' @param end_date (`character(1)` | `Date(1)`) end date of the time series.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://www.bankofengland.co.uk/boeapps/database>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' boe_data(c("IUMABEDR", "IUALBEDR"), "2015-01-01")
#' }
boe_data <- function(id, start_date, end_date = Sys.Date()) {
  stopifnot(
    is_character(id),
    length(id) <= 300L,
    is_dateish(start_date),
    is_dateish(end_date)
  )

  start_date <- as.Date(start_date)
  end_date <- as.Date(end_date)

  body <- boe(
    SeriesCodes = id,
    Datefrom = format(start_date, "%d/%b/%Y"),
    Dateto = format(end_date, "%d/%b/%Y")
  )
  parse_boe_data(body)
}

boe <- function(id, ...) {
  request("https://www.bankofengland.co.uk/boeapps/database/_iadb-fromshowcolumns.asp") |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_query(..., xml.x = "yes", .multi = "comma") |>
    req_error(
      is_error = \(resp) grepl("errorpage", httr2::resp_url(resp), ignore.case = TRUE),
      body = boe_error_body
    ) |>
    req_perform() |>
    resp_body_xml()
}

boe_error_body <- function(resp) {
  msg <- "The BoE returned an error for the request."
  c(msg, sprintf("See docs at <%s>", httr2::resp_url(resp)))
}

parse_boe_data <- function(body) {
  xml2::xml_ns_strip(body)
  series <- xml2::xml_children(body)
  res <- lapply(series, function(x) {
    id <- xml2::xml_attr(x, "SCODE")
    desc <- xml2::xml_attr(x, "DESC")
    freq_name <- x |>
      xml2::xml_find_first("./Cube[@FREQ_NAME]") |>
      xml2::xml_attr("FREQ_NAME") |>
      tolower()
    attrs <- xml2::xml_find_all(x, "./Cube[@CAT_NAME]")
    nms <- xml2::xml_attr(attrs, "CAT_NAME")
    nms <- gsub(" ", "_", tolower(nms), fixed = TRUE)
    attrs <- attrs |>
      xml2::xml_attr("VAL_DESC") |>
      setNames(nms) |>
      as.list()

    vals <- xml2::xml_find_all(x, "./Cube[@TIME and @OBS_VALUE]")
    date <- vals |> xml2::xml_attr("TIME") |> as.Date()
    value <- vals |> xml2::xml_attr("OBS_VALUE") |> as.numeric()
    dt <- data.table(date = date, id = id, value = value, desc = desc, freq = freq_name)
    dt[, (names(attrs)) := attrs]
  })
  rbindlist(res, fill = TRUE)
}
