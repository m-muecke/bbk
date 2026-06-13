#' Fetch Banco Central do Brasil (BCB) data
#'
#' Retrieve time series data from the Banco Central do Brasil SGS (Sistema Gerenciador de Séries
#' Temporais) API.
#'
#' Daily series require a date range and the API limits the query window to at most 10 years; supply
#' `start_date` (and optionally `end_date`) when querying such series.
#'
#' @param series (`integer(1)`)\cr
#'   The SGS series code to query (e.g., `1` for the USD/BRL exchange rate). Series codes can be
#'   found on the SGS website.
#' @param start_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   Start date of the data (e.g., `"2024-01-01"`). If `NULL`, all available data is returned.
#'   Default `NULL`.
#' @param end_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   End date of the data, in the same format as start_date. If `NULL`, data up to the latest
#'   available date is returned. Default `NULL`.
#' @returns A [data.table::data.table()] with the requested data.
#' @source <https://dadosabertos.bcb.gov.br/>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch USD/BRL exchange rate
#' bcb_data(1, start_date = "2024-01-01", end_date = "2024-01-31")
#'
#' # fetch the Selic target rate
#' bcb_data(432, start_date = "2024-01-01", end_date = "2024-01-31")
#' }
bcb_data = function(series, start_date = NULL, end_date = NULL) {
  series = assert_count(series, positive = TRUE, coerce = TRUE)
  start_date = assert_dateish(start_date, null.ok = TRUE)
  end_date = assert_dateish(end_date, null.ok = TRUE)

  json = bcb(
    series,
    dataInicial = start_date %&&% format(start_date, "%d/%m/%Y"),
    dataFinal = end_date %&&% format(end_date, "%d/%m/%Y")
  )
  parse_bcb_data(json, series)
}

parse_bcb_data = function(json, series) {
  if (length(json) == 0L) {
    dt = data.table(date = as.Date(character()), id = character(), value = numeric())
    setnames(dt, "id", "key")
    return(dt[])
  }
  data = valor = NULL
  dt = rbindlist(map(json, setDT), fill = TRUE)
  dt[, let(
    date = as.Date(data, "%d/%m/%Y"),
    key = as.character(series),
    value = as.numeric(valor)
  )]
  dt[, c("data", "valor") := NULL]
  setcolorder(dt, c("date", "key", "value"))
  dt[]
}

bcb = function(series, ...) {
  base_request("https://api.bcb.gov.br/dados/serie") |>
    req_url_path_append(sprintf("bcdata.sgs.%s", series), "dados") |>
    req_url_query(formato = "json", ...) |>
    req_error(body = bcb_error_body) |>
    req_perform() |>
    resp_body_json()
}

bcb_error_body = function(resp) {
  resp_body_string(resp, "UTF-8")
}
