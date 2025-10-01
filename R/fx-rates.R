#' Fetch Euro foreign exchange reference rates
#'
#' Fetch the latest or historical Euro foreign exchange reference rates from the
#' European Central Bank (ECB).
#'
#' @details
#' Note you can achieve the same by calling the [ecb_data()] function with the right
#' parameters for each currency.
#'
#' The reference rates are usually updated at around 16:00 CET every working day, except on [TARGET
#' closing days](https://www.ecb.europa.eu/ecb/contacts/working-hours/html/index.en.html).
#'
#' They are based on the daily concertation procedure between central banks across
#' Europe, which normally takes place around 14:10 CET. The reference rates are
#' published for information purposes only.
#' Using the rates for transaction purposes is strongly discouraged.
#'
#' @param x (`character(1)`)\cr
#'   One of `"latest"` or `"history"`. Default `"latest"`.
#' @returns A [data.table::data.table()] with the exchange rates.
#' @source <https://www.ecb.europa.eu/stats/policy_and_exchange_rates/euro_reference_exchange_rates/html/index.en.html>
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' ecb_fx_rates()
#' }
ecb_fx_rates <- function(x = "latest") {
  assert_choice(x, c("latest", "history"))
  url <- switch(
    x,
    latest = "https://www.ecb.europa.eu/stats/eurofxref/eurofxref.zip",
    history = "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist.zip"
  )
  tf <- tempfile()
  on.exit(unlink(tf), add = TRUE)
  curl::curl_download(url, tf)
  dt <- fread(file = tf, sep = ",", na.strings = c("NA", "N/A"))
  fmt <- if (nrow(dt) > 1L) "%Y-%m-%d" else "%d %B %Y"
  Date <- NULL
  dt[, Date := as.Date(Date, fmt)]
  dt[, names(.SD) := lapply(.SD, as.numeric), .SDcols = !"Date"]
  dt <- dt |>
    melt(
      id.vars = "Date",
      variable.name = "currency",
      value.name = "rate",
      variable.factor = FALSE
    ) |>
    na.omit() |>
    setnames(tolower)
  dt[]
}

#' @rdname ecb_fx_rates
#' @export
ecb_euro_rates <- ecb_fx_rates

#' Fetch Bank of Canada foreign exchange rates
#'
#' Fetch the latest or historical foreign exchange reference rates from the Bank of Canada (BoC).
#'
#' @details
#' The recorded rates indicate the number of Canadian dollars required to buy a single unit of the
#' foreign currency. New rates are released by the Bank of Canada (BoC) daily at 4:30 pm. The Canada
#' Border Services (CBSA) retrieves these updates between 4:30 pm and 5 pm ET.
#'
#' BoC provides 23 foreign exchange rates. All other rates are maintained by the CBSA.
#'
#' Exchange rates from the BoC are updated daily in the system while other exchange rates are
#' updated by the CBSA at set intervals. The updated rates are available for retrieval between 7 pm
#' and 11:59 pm ET.
#'
#' As BoC publishes exchange rates every business day, it is recommended that exchange rate data be
#' retrieved on a daily basis. This retrieval should occur after 7 pm ET to ensure retrieval of the
#' latest updates.
#'
#' @param start_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   Start date of the data. Default `NULL`.
#' @param end_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   End date of the data. Default `NULL`.
#' @param limit (`NULL` | `integer(1)`)\cr
#'   Maximum number of records to return. Default `NULL` (all records).
#' @param skip (`NULL` | `integer(1)`)\cr
#'   Number of records to skip. Default `NULL` (do not skip any records).
#' @returns A [data.table::data.table()] with the exchange rates.
#' @source <https://www.cbsa-asfc.gc.ca/eservices/api/er-tc-api-eng.html>
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch latest exchange rates
#' boc_fx_rates()
#'
#' # fetch historical exchange rates
#' boc_fx_rates(start_date = "2021-10-22", end_date = "2021-10-23", limit = 10, skip = 2)
#' }
boc_fx_rates <- function(start_date = NULL, end_date = NULL, limit = NULL, skip = NULL) {
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)
  limit <- assert_count(limit, positive = TRUE, null.ok = TRUE, coerce = TRUE)
  skip <- assert_count(skip, null.ok = TRUE, coerce = TRUE)

  url <- "https://bcd-api-dca-ipa.cbsa-asfc.cloud-nuage.canada.ca/exchange-rate-lambda/exchange-rates" # nolint
  json <- request(url) |>
    req_url_query(startDate = start_date, endDate = end_date, limit = limit, skip = skip) |>
    req_perform() |>
    resp_body_json()

  dt <- json$ForeignExchangeRates |>
    lapply(as.data.table) |>
    rbindlist() |>
    setnames(convert_camel_case)

  dt[, names(.SD) := lapply(.SD, \(x) unlist(x, use.names = FALSE)), .SDcols = is.list]
  rate <- NULL
  dt[, rate := as.numeric(rate)]
  dt[,
    names(.SD) := lapply(.SD, \(x) as.POSIXct(x, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")),
    .SDcols = patterns("_timestamp$")
  ]
  dt[]
}
