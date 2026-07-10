# Fetch Euro foreign exchange reference rates

Fetch the latest or historical Euro foreign exchange reference rates
from the European Central Bank (ECB).

## Usage

``` r
ecb_fx_rates(x = "latest")

ecb_euro_rates(x = "latest")
```

## Source

<https://www.ecb.europa.eu/stats/policy_and_exchange_rates/euro_reference_exchange_rates/html/index.en.html>

## Arguments

- x:

  (`character(1)`)  
  One of `"latest"` or `"history"`. Default `"latest"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the exchange rates.

## Details

Note you can achieve the same by calling the
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md)
function with the right parameters for each currency.

The reference rates are usually updated at around 16:00 CET every
working day, except on [TARGET closing
days](https://www.ecb.europa.eu/ecb/contacts/working-hours/html/index.en.html).

They are based on the daily concertation procedure between central banks
across Europe, which normally takes place around 14:10 CET. The
reference rates are published for information purposes only. Using the
rates for transaction purposes is strongly discouraged.

## Examples

``` r
# \donttest{
ecb_fx_rates()
#>           date currency        rate
#>         <Date>   <char>       <num>
#>  1: 2026-07-09      USD     1.14350
#>  2: 2026-07-09      JPY   185.72000
#>  3: 2026-07-09      CZK    24.25400
#>  4: 2026-07-09      DKK     7.47530
#>  5: 2026-07-09      GBP     0.85363
#>  6: 2026-07-09      HUF   357.80000
#>  7: 2026-07-09      PLN     4.30850
#>  8: 2026-07-09      RON     5.23640
#>  9: 2026-07-09      SEK    11.06200
#> 10: 2026-07-09      CHF     0.92270
#> 11: 2026-07-09      ISK   143.40000
#> 12: 2026-07-09      NOK    11.13050
#> 13: 2026-07-09      TRY    53.54100
#> 14: 2026-07-09      AUD     1.64780
#> 15: 2026-07-09      BRL     5.88370
#> 16: 2026-07-09      CAD     1.62020
#> 17: 2026-07-09      CNY     7.77120
#> 18: 2026-07-09      HKD     8.96050
#> 19: 2026-07-09      IDR 20703.75000
#> 20: 2026-07-09      ILS     3.45870
#> 21: 2026-07-09      INR   109.07650
#> 22: 2026-07-09      KRW  1729.49000
#> 23: 2026-07-09      MXN    20.06860
#> 24: 2026-07-09      MYR     4.66200
#> 25: 2026-07-09      NZD     1.99160
#> 26: 2026-07-09      PHP    70.43800
#> 27: 2026-07-09      SGD     1.47840
#> 28: 2026-07-09      THB    38.24400
#> 29: 2026-07-09      ZAR    18.72130
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
