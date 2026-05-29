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
#>  1: 2026-05-28      USD     1.16170
#>  2: 2026-05-28      JPY   185.24000
#>  3: 2026-05-28      CZK    24.29300
#>  4: 2026-05-28      DKK     7.47290
#>  5: 2026-05-28      GBP     0.86665
#>  6: 2026-05-28      HUF   355.28000
#>  7: 2026-05-28      PLN     4.23350
#>  8: 2026-05-28      RON     5.24810
#>  9: 2026-05-28      SEK    10.82150
#> 10: 2026-05-28      CHF     0.91670
#> 11: 2026-05-28      ISK   143.20000
#> 12: 2026-05-28      NOK    10.79400
#> 13: 2026-05-28      TRY    53.32130
#> 14: 2026-05-28      AUD     1.63180
#> 15: 2026-05-28      BRL     5.89280
#> 16: 2026-05-28      CAD     1.60940
#> 17: 2026-05-28      CNY     7.87620
#> 18: 2026-05-28      HKD     9.10150
#> 19: 2026-05-28      IDR 20737.51000
#> 20: 2026-05-28      ILS     3.29550
#> 21: 2026-05-28      INR   111.17050
#> 22: 2026-05-28      KRW  1745.84000
#> 23: 2026-05-28      MXN    20.20020
#> 24: 2026-05-28      MYR     4.62120
#> 25: 2026-05-28      NZD     1.97130
#> 26: 2026-05-28      PHP    71.51000
#> 27: 2026-05-28      SGD     1.48650
#> 28: 2026-05-28      THB    37.98800
#> 29: 2026-05-28      ZAR    18.99390
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
