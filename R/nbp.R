#' Fetch National Bank of Poland (NBP) exchange rates
#'
#' Retrieve foreign currency exchange rates from the NBP Web API.
#'
#' @param table (`character(1)`)\cr
#'   Table type: `"a"` (mid rates, major currencies), `"b"` (mid rates, less common currencies),
#'   or `"c"` (bid/ask rates).
#' @param code (`NULL` | `character(1)`)\cr
#'   ISO 4217 currency code (e.g. `"usd"`, `"eur"`). If `NULL`, returns all currencies.
#' @param start_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   Start date of the data.
#' @param end_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   End date of the data.
#' @param last_n (`NULL` | `integer(1)`)\cr
#'   Return only the last `n` quotations.
#' @returns A [data.table::data.table()] with exchange rates.
#' @source <https://api.nbp.pl/en.html>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' nbp_fx_rates("a", "eur")
#' }
nbp_fx_rates <- function(
  table,
  code = NULL,
  start_date = NULL,
  end_date = NULL,
  last_n = NULL
) {
  assert_choice(table, c("a", "b", "c"))
  assert_string(code, min.chars = 3L, null.ok = TRUE)
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)
  last_n <- assert_count(last_n, positive = TRUE, null.ok = TRUE, coerce = TRUE)
  if (!is.null(last_n) && (!is.null(start_date) || !is.null(end_date))) {
    stop("`last_n` and `start_date`/`end_date` are mutually exclusive.", call. = FALSE)
  }

  resource <- if (is.null(code)) "exchangerates/tables" else "exchangerates/rates"
  path <- nbp_path(resource, table, code, start_date, end_date, last_n)
  json <- nbp(path)
  parse_nbp_fx_rates(json, table, code)
}

#' Fetch National Bank of Poland (NBP) gold prices
#'
#' Retrieve the price of gold from the NBP Web API.
#'
#' @param start_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   Start date of the data.
#' @param end_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   End date of the data.
#' @param last_n (`NULL` | `integer(1)`)\cr
#'   Return only the last `n` quotations.
#' @returns A [data.table::data.table()] with gold prices.
#' @source <https://api.nbp.pl/en.html>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' nbp_gold(last_n = 10L)
#' }
nbp_gold <- function(start_date = NULL, end_date = NULL, last_n = NULL) {
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)
  last_n <- assert_count(last_n, positive = TRUE, null.ok = TRUE, coerce = TRUE)
  if (!is.null(last_n) && (!is.null(start_date) || !is.null(end_date))) {
    stop("`last_n` and `start_date`/`end_date` are mutually exclusive.", call. = FALSE)
  }

  path <- nbp_path("cenyzlota", start_date = start_date, end_date = end_date, last_n = last_n)
  json <- nbp(path)
  parse_nbp_gold(json)
}

parse_nbp_fx_rates <- function(json, table, code) {
  if (is.null(code)) {
    # Table endpoint: [{effectiveDate, rates: [{currency, code, mid/bid/ask}]}]
    tables <- if (is.null(json[[1L]]$table)) list(json) else json
    rows <- list()
    for (tbl in tables) {
      date <- tbl$effectiveDate
      for (r in tbl$rates) {
        r$effectiveDate <- date
        rows[[length(rows) + 1L]] <- r
      }
    }
  } else {
    # Single currency endpoint: {currency, code, rates: [{effectiveDate, mid/bid/ask}]}
    rows <- json$rates
    for (i in seq_along(rows)) {
      rows[[i]]$code <- json$code
      rows[[i]]$currency <- json$currency
    }
  }
  dt <- data.table(
    date = as.Date(map_chr(rows, "effectiveDate")),
    code = map_chr(rows, "code"),
    currency = map_chr(rows, "currency")
  )
  if (identical(table, "c")) {
    dt[, "bid" := map_dbl(rows, "bid")]
    dt[, "ask" := map_dbl(rows, "ask")]
  } else {
    dt[, "mid" := map_dbl(rows, "mid")]
  }
  dt[]
}

parse_nbp_gold <- function(json) {
  data.table(
    date = as.Date(map_chr(json, "data")),
    price = map_dbl(json, "cena")
  )
}

nbp_path <- function(
  resource,
  table = NULL,
  code = NULL,
  start_date = NULL,
  end_date = NULL,
  last_n = NULL
) {
  parts <- c(resource, table, code)
  if (!is.null(last_n)) {
    parts <- c(parts, "last", last_n)
  } else if (!is.null(start_date) && !is.null(end_date)) {
    parts <- c(parts, start_date, end_date)
  } else if (!is.null(start_date)) {
    parts <- c(parts, start_date)
  }
  paste(parts, collapse = "/")
}

nbp <- function(path) {
  request("https://api.nbp.pl/api") |>
    req_user_agent(bbk_user_agent()) |>
    req_url_path_append(path) |>
    req_url_query(format = "json") |>
    req_error(body = nbp_error_body) |>
    req_bbk_retry() |>
    req_bbk_cache() |>
    req_perform() |>
    resp_body_json()
}

nbp_error_body <- function(resp) {
  resp_body_string(resp)
}
