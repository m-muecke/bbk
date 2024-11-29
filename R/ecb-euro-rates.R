#' Euro foreign exchange reference rates
#'
#' Fetch the latest or historical Euro foreign exchange reference rates from
#' the European Central Bank.
#'
#' @details
#' Note you can achieve the same by calling the [ecb_data()] function with the right
#' parameters for each currency.
#'
#' The reference rates are usually updated at around 16:00 CET every working day,
#' except on [TARGET closing days](https://www.ecb.europa.eu/ecb/contacts/working-hours/html/index.en.html).
#'
#' They are based on the daily concertation procedure between central banks across
#' Europe, which normally takes place around 14:10 CET. The reference rates are
#' published for information purposes only.
#' Using the rates for transaction purposes is strongly discouraged.
#'
#' @param x `character(1)` one of "latest" or "history". Default "latest".
#' @returns A `data.frame()` with the reference rates.
#'
#' @source <https://www.ecb.europa.eu/stats/policy_and_exchange_rates/euro_reference_exchange_rates/html/index.en.html>
#' @export
#' @examples
#' \donttest{
#' ecb_euro_rates()
#' }
ecb_euro_rates <- function(x = c("latest", "history")) {
  if (!requireNamespace("tidyr", quietly = TRUE)) {
    stop("tidyr is required to run this function", call. = FALSE)
  }
  x <- match.arg(x)
  url <- switch(x,
    latest = "https://www.ecb.europa.eu/stats/eurofxref/eurofxref.zip",
    history = "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist.zip"
  )
  tmp <- tempfile()
  dir.create(tmp)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)
  tf <- file.path(tmp, "tempfile.zip")
  curl::curl_download(url, tf)
  file <- utils::unzip(tf, exdir = tmp)
  res <- utils::read.csv(file)

  res[res == "N/A"] <- NA
  fmt <- if (nrow(res) > 1L) "%Y-%m-%d" else "%d %B %Y"
  res$Date <- as.Date(res$Date, format = fmt)
  res[, -1L] <- lapply(res[, -1L], as.numeric)
  res <- tidyr::pivot_longer(res, !Date, names_to = "currency", values_to = "rate")
  names(res) <- tolower(names(res))
  as_tibble(res)
}
