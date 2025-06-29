#' Fetch data from the Bank of England (BoE) Interactive Statistical Database
#'
#' @param id a vector of BoE series codes
#' @param start_date (`Date(1)` | character(1))
#' @param end_date (`Date(1)` | character(1))
#' @returns A [data.table::data.table()]
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' boe_data(c("LPMVWYR", "LPMVWYR"), "2012-01-01")
#' }
boe_data <- function(id, start_date = NULL, end_date = Sys.Date()) {
  stopifnot(
    is_character(id),
    length(id) <= 300,
    is_dateish(start_date, null_ok = TRUE),
    is_dateish(end_date)
  )

  start_date <- as.Date(start_date)
  end_date <- as.Date(end_date)

  str <- request("https://www.bankofengland.co.uk/boeapps/database/_iadb-fromshowcolumns.asp") |>
    req_url_query(
      csv.x = "yes",
      CSVF = "TN",
      VPD = "Y",
      UsingCodes = "Y",
      SeriesCodes = paste(id, collapse = ","),
      Datefrom = format(start_date, "%d/%b/%Y"),
      Dateto = format(end_date, "%d/%b/%Y")
    ) |>
    req_perform() |>
    resp_body_string(encoding = "UTF-8")

  dt <- fread(str, sep = ",")
  setnames(dt, "DATE", "date")
  dt[, date := as.Date(date, "%d %b %Y")][]
}

boe_data_xml <- function(id, start_date = NULL, end_date = Sys.Date()) {
  stopifnot(
    is_character(id),
    length(id) <= 300,
    is_dateish(start_date, null_ok = TRUE),
    is_dateish(end_date)
  )

  start_date <- as.Date(start_date)
  end_date <- as.Date(end_date)

  body <- eob(
    SeriesCodes = paste(id, collapse = ","),
    Datefrom = format(start_date, "%d/%b/%Y"),
    Dateto = format(end_date, "%d/%b/%Y")
  )
  parse_eob_data(body)
}

eob <- function(id, ...) {
  request("https://www.bankofengland.co.uk/boeapps/database/_iadb-fromshowcolumns.asp") |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_query(xml.x = "yes", ...) |>
    req_perform() |>
    resp_body_xml()
}

parse_eob_data <- function(body) {
  .NotYetImplemented()
}
