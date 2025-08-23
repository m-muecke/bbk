#' Fetch Euro foreign exchange reference rates
#'
#' Fetch the latest or historical Euro foreign exchange reference rates from
#' the European Central Bank (ECB).
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
#' @returns A [data.table::data.table()] with the reference rates.
#' @source <https://www.ecb.europa.eu/stats/policy_and_exchange_rates/euro_reference_exchange_rates/html/index.en.html>
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' ecb_euro_rates()
#' }
ecb_euro_rates <- function(x = "latest") {
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
