# Fetch Banco Central do Brasil (BCB) exchange rates

Retrieve PTAX foreign exchange reference rates from the Banco Central do
Brasil Olinda API. The rates are the closing (Fechamento) bid and ask
quotations expressed in Brazilian real (BRL) per unit of the foreign
currency.

## Usage

``` r
bcb_fx_rates(currency, start_date, end_date = NULL)
```

## Source

<https://dadosabertos.bcb.gov.br/>

## Arguments

- currency:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  One or more ISO 4217 currency codes (e.g. `"USD"`, `c("USD", "EUR")`).
  See
  [`bcb_currencies()`](https://m-muecke.github.io/bbk/reference/bcb_currencies.md)
  for the available currencies.

- start_date:

  (`Date(1)` \| `character(1)`)  
  Start date of the data (e.g., `"2024-01-01"`).

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End date of the data, in the same format as start_date. If `NULL`, the
  `start_date` is used. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns `date`, `currency`, `bid`, and `ask`.

## Details

Rates are published only on business days, so weekends and holidays
return no rows.

## See also

Other data:
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_inflation()`](https://m-muecke.github.io/bbk/reference/bcb_inflation.md),
[`bcb_selic()`](https://m-muecke.github.io/bbk/reference/bcb_selic.md),
[`bcb_top5()`](https://m-muecke.github.io/bbk/reference/bcb_top5.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boi_data()`](https://m-muecke.github.io/bbk/reference/boi_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_czeonia()`](https://m-muecke.github.io/bbk/reference/cnb_czeonia.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nbb_data()`](https://m-muecke.github.io/bbk/reference/nbb_data.md),
[`nbp_fx_rates()`](https://m-muecke.github.io/bbk/reference/nbp_fx_rates.md),
[`nbp_gold()`](https://m-muecke.github.io/bbk/reference/nbp_gold.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
# fetch USD/BRL closing rates
bcb_fx_rates("USD", start_date = "2024-01-01", end_date = "2024-01-31")
#> Error in req_perform(req_error(req_url_query(req_url_path_append(base_request(url),     resource), ..., `$format` = "json"), body = bcb_error_body)): HTTP 403 Forbidden.
#> ℹ <!doctype html> <html lang="en">
#> 
#> <head> <meta charset="utf-8"> <meta name="viewport"
#>   content="width=device-width, initial-scale=1">
#> 
#> <link href="https://www.bcb.gov.br/svr_css/bootstrap.min.css" rel="stylesheet">
#> 
#> <link rel="stylesheet"
#>   href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap">
#>   <link rel="stylesheet"
#>   href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i&display=swap">
#> 
#> <link rel="stylesheet" href="https://www.bcb.gov.br/svr_css/theme.css">
#> 
#> <title>Banco Central do Brasil</title> </head>
#> 
#> <body> <header> <h1 class="logo">Banco Central do Brasil</h1> </header> <div
#>   id="menu"></div> <section class="content"> <div class="container"> <h2
#>   class="cormorant">Requisição inválida</h2>
#> 
#> <p>Seu "browser" (ou o servidor proxy) enviou uma requisição inválida ao
#>   servidor.</p>
#> 
#> <div class="mb-4 text-danger"> <p>A sua requisição foi rejeitada.<br> Código de
#>   erro: 20261009T085847Z-16d5d5b65d9h7vh2hC1DM18htw00000016qg000000009kaq<br>
#>   Data e hora do erro: <span class="error-date-time"></span> </p> <p>Caso
#>   necessite de ajuda entre em contato com a Central de Atendimento do Banco
#>   Central: +55 61 3414-2156.  </p> </div>
#> 
#> <div class="fst-italic"> <h3 class="h2 cormorant">Bad request</h3>
#> 
#> <p class="">Your browser (or proxy) sent a request that this server could not
#>   understand.</p>
#> 
#> <div class="text-danger"> <p>Your request was rejected.<br> Error code:
#>   20261009T085847Z-16d5d5b65d9h7vh2hC1DM18htw00000016qg000000009kaq<br> Error
#>   date and time: <span class="error-date-time"></span></p> <p>If you need help,
#>   contact the Central Bank Call Center: +55 61 3414-2156.</p> </div> </div>
#>   </div> </section> <footer role="contentinfo"> <a name="inicioRodape"
#>   id="inicioRodape"></a> <div class="container"> <span class="line"> <!--
#>   chanfro --> </span> <div class="content d-sm-flex justify-content-sm-between
#>   pr-sm-5"> <div class="missao mb-2 mb-sm-0"> Assegurar a estabilidade do poder
#>   de compra da moeda e um sistema financeiro sólido e eficiente </div> <div
#>   class="infos"> <ul class="list-inline text-sm-right"> <li
#>   class="list-inline-item">Atendimento: 145 (custo de ligação local)</li> <li
#>   class="list-inline-item"><a bcblink
#>   href="https://www.bcb.gov.br/acessoinformacao/faleconosco">Fale conosco</a>
#>   </li> </ul> <ul class="list-inline text-sm-right mb-0"> <li
#>   class="list-inline-item"><a bcblink
#>   href="https://www.bcb.gov.br/acessoinformacao/politicaprivacidade">Política
#>   de privacidade</a></li> <li class="list-inline-item sem-separador"><a bcblink
#>   href="https://www.bcb.gov.br/acessoinformacao/politica_acessibilidade">Política
#>   de acessibilidade</a></li> <li class="list-inline-item">© Banco Central do
#>   Brasil - <a bcblink
#>   href="https://www.bcb.gov.br/acessoinformacao/direitosautorais">Todos os
#>   direitos reservados</a></li> </ul> </div> </div> </div> </footer>
#> 
#> <script src="https://www.bcb.gov.br/svr_js/bootstrap.bundle.min.js"></script>
#> 
#> <script> let elErrorDateTime = document.querySelectorAll('.error-date-time')
#>   elErrorDateTime.forEach(e => { const actualDateText =
#>   document.createTextNode(new Date) e.append(actualDateText) }) </script>
#>   </body>
#> 
#> </html>

# fetch multiple currencies
bcb_fx_rates(c("USD", "EUR"), start_date = "2024-01-01", end_date = "2024-01-31")
#> Error in req_perform(req_error(req_url_query(req_url_path_append(base_request(url),     resource), ..., `$format` = "json"), body = bcb_error_body)): HTTP 403 Forbidden.
#> ℹ <!doctype html> <html lang="en">
#> 
#> <head> <meta charset="utf-8"> <meta name="viewport"
#>   content="width=device-width, initial-scale=1">
#> 
#> <link href="https://www.bcb.gov.br/svr_css/bootstrap.min.css" rel="stylesheet">
#> 
#> <link rel="stylesheet"
#>   href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap">
#>   <link rel="stylesheet"
#>   href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i&display=swap">
#> 
#> <link rel="stylesheet" href="https://www.bcb.gov.br/svr_css/theme.css">
#> 
#> <title>Banco Central do Brasil</title> </head>
#> 
#> <body> <header> <h1 class="logo">Banco Central do Brasil</h1> </header> <div
#>   id="menu"></div> <section class="content"> <div class="container"> <h2
#>   class="cormorant">Requisição inválida</h2>
#> 
#> <p>Seu "browser" (ou o servidor proxy) enviou uma requisição inválida ao
#>   servidor.</p>
#> 
#> <div class="mb-4 text-danger"> <p>A sua requisição foi rejeitada.<br> Código de
#>   erro: 20261009T085847Z-16d5d5b65d9h7vh2hC1DM18htw00000016qg000000009kax<br>
#>   Data e hora do erro: <span class="error-date-time"></span> </p> <p>Caso
#>   necessite de ajuda entre em contato com a Central de Atendimento do Banco
#>   Central: +55 61 3414-2156.  </p> </div>
#> 
#> <div class="fst-italic"> <h3 class="h2 cormorant">Bad request</h3>
#> 
#> <p class="">Your browser (or proxy) sent a request that this server could not
#>   understand.</p>
#> 
#> <div class="text-danger"> <p>Your request was rejected.<br> Error code:
#>   20261009T085847Z-16d5d5b65d9h7vh2hC1DM18htw00000016qg000000009kax<br> Error
#>   date and time: <span class="error-date-time"></span></p> <p>If you need help,
#>   contact the Central Bank Call Center: +55 61 3414-2156.</p> </div> </div>
#>   </div> </section> <footer role="contentinfo"> <a name="inicioRodape"
#>   id="inicioRodape"></a> <div class="container"> <span class="line"> <!--
#>   chanfro --> </span> <div class="content d-sm-flex justify-content-sm-between
#>   pr-sm-5"> <div class="missao mb-2 mb-sm-0"> Assegurar a estabilidade do poder
#>   de compra da moeda e um sistema financeiro sólido e eficiente </div> <div
#>   class="infos"> <ul class="list-inline text-sm-right"> <li
#>   class="list-inline-item">Atendimento: 145 (custo de ligação local)</li> <li
#>   class="list-inline-item"><a bcblink
#>   href="https://www.bcb.gov.br/acessoinformacao/faleconosco">Fale conosco</a>
#>   </li> </ul> <ul class="list-inline text-sm-right mb-0"> <li
#>   class="list-inline-item"><a bcblink
#>   href="https://www.bcb.gov.br/acessoinformacao/politicaprivacidade">Política
#>   de privacidade</a></li> <li class="list-inline-item sem-separador"><a bcblink
#>   href="https://www.bcb.gov.br/acessoinformacao/politica_acessibilidade">Política
#>   de acessibilidade</a></li> <li class="list-inline-item">© Banco Central do
#>   Brasil - <a bcblink
#>   href="https://www.bcb.gov.br/acessoinformacao/direitosautorais">Todos os
#>   direitos reservados</a></li> </ul> </div> </div> </div> </footer>
#> 
#> <script src="https://www.bcb.gov.br/svr_js/bootstrap.bundle.min.js"></script>
#> 
#> <script> let elErrorDateTime = document.querySelectorAll('.error-date-time')
#>   elErrorDateTime.forEach(e => { const actualDateText =
#>   document.createTextNode(new Date) e.append(actualDateText) }) </script>
#>   </body>
#> 
#> </html>
# }
```
