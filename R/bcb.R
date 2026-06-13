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

#' Fetch Banco Central do Brasil (BCB) exchange rates
#'
#' Retrieve PTAX foreign exchange reference rates from the Banco Central do Brasil Olinda API. The
#' rates are the closing (Fechamento) bid and ask quotations expressed in Brazilian real (BRL) per
#' unit of the foreign currency.
#'
#' Rates are published only on business days, so weekends and holidays return no rows.
#'
#' @param currency (`character()`)\cr
#'   One or more ISO 4217 currency codes (e.g. `"USD"`, `c("USD", "EUR")`). See [bcb_currencies()]
#'   for the available currencies.
#' @param start_date (`Date(1)` | `character(1)`)\cr
#'   Start date of the data (e.g., `"2024-01-01"`).
#' @param end_date (`NULL` | `Date(1)` | `character(1)`)\cr
#'   End date of the data, in the same format as start_date. If `NULL`, the `start_date` is used.
#'   Default `NULL`.
#' @returns A [data.table::data.table()] with columns `date`, `currency`, `bid`, and `ask`.
#' @source <https://dadosabertos.bcb.gov.br/>
#' @family data
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' # fetch USD/BRL closing rates
#' bcb_fx_rates("USD", start_date = "2024-01-01", end_date = "2024-01-31")
#'
#' # fetch multiple currencies
#' bcb_fx_rates(c("USD", "EUR"), start_date = "2024-01-01", end_date = "2024-01-31")
#' }
bcb_fx_rates = function(currency, start_date, end_date = NULL) {
  assert_character(currency, min.len = 1L, min.chars = 3L, any.missing = FALSE)
  start_date = assert_dateish(start_date)
  end_date = assert_dateish(end_date, null.ok = TRUE)
  end_date = end_date %||% start_date

  currency = toupper(currency)
  rbindlist(map(currency, function(cur) {
    json = bcb_ptax(cur, start_date, end_date)
    parse_bcb_fx_rates(json, cur)
  }))
}

#' Fetch Banco Central do Brasil (BCB) currencies
#'
#' Retrieve the list of currencies available from the Banco Central do Brasil PTAX API.
#'
#' @returns A [data.table::data.table()] with columns `code`, `name`, and `type`.
#' @source <https://dadosabertos.bcb.gov.br/>
#' @family metadata
#' @export
#' @examplesIf curl::has_internet()
#' \donttest{
#' bcb_currencies()
#' }
bcb_currencies = function() {
  json = bcb_olinda("PTAX", "Moedas")
  parse_bcb_currencies(json)
}

parse_bcb_currencies = function(json) {
  value = json$value
  data.table(
    code = map_chr(value, "simbolo"),
    name = map_chr(value, "nomeFormatado"),
    type = map_chr(value, "tipoMoeda")
  )
}

parse_bcb_fx_rates = function(json, currency) {
  value = json$value
  if (length(value) == 0L) {
    return(data.table(
      date = as.Date(character()),
      currency = character(),
      bid = numeric(),
      ask = numeric()
    ))
  }
  data.table(
    date = as.Date(map_chr(value, "dataHoraCotacao")),
    currency = currency,
    bid = map_dbl(value, "cotacaoCompra"),
    ask = map_dbl(value, "cotacaoVenda")
  )
}

bcb = function(series, ...) {
  base_request("https://api.bcb.gov.br/dados/serie") |>
    req_url_path_append(sprintf("bcdata.sgs.%s", series), "dados") |>
    req_url_query(formato = "json", ...) |>
    req_error(body = bcb_error_body) |>
    req_perform() |>
    resp_body_json()
}

bcb_ptax = function(currency, start_date, end_date) {
  resource = paste0(
    "CotacaoMoedaPeriodo(moeda=@moeda,dataInicial=@dataInicial,",
    "dataFinalCotacao=@dataFinalCotacao)"
  )
  bcb_olinda(
    "PTAX",
    resource,
    `@moeda` = sprintf("'%s'", currency),
    `@dataInicial` = sprintf("'%s'", format(start_date, "%m-%d-%Y")),
    `@dataFinalCotacao` = sprintf("'%s'", format(end_date, "%m-%d-%Y")),
    `$filter` = "tipoBoletim eq 'Fechamento'",
    `$select` = "cotacaoCompra,cotacaoVenda,dataHoraCotacao"
  )
}

bcb_olinda = function(service, resource, ...) {
  url = sprintf("https://olinda.bcb.gov.br/olinda/servico/%s/versao/v1/odata", service)
  base_request(url) |>
    req_url_path_append(resource) |>
    req_url_query(..., `$format` = "json") |>
    req_error(body = bcb_error_body) |>
    req_perform() |>
    resp_body_json()
}

bcb_error_body = function(resp) {
  resp_body_string(resp, "UTF-8")
}
