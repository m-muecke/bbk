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
#>  1: 2026-07-10      USD     1.14300
#>  2: 2026-07-10      JPY   185.02000
#>  3: 2026-07-10      CZK    24.25900
#>  4: 2026-07-10      DKK     7.47510
#>  5: 2026-07-10      GBP     0.85155
#>  6: 2026-07-10      HUF   356.40000
#>  7: 2026-07-10      PLN     4.34750
#>  8: 2026-07-10      RON     5.23330
#>  9: 2026-07-10      SEK    11.01450
#> 10: 2026-07-10      CHF     0.92230
#> 11: 2026-07-10      ISK   143.60000
#> 12: 2026-07-10      NOK    11.14850
#> 13: 2026-07-10      TRY    53.70390
#> 14: 2026-07-10      AUD     1.64470
#> 15: 2026-07-10      BRL     5.85050
#> 16: 2026-07-10      CAD     1.61770
#> 17: 2026-07-10      CNY     7.74330
#> 18: 2026-07-10      HKD     8.96110
#> 19: 2026-07-10      IDR 20661.50000
#> 20: 2026-07-10      ILS     3.43680
#> 21: 2026-07-10      INR   108.96650
#> 22: 2026-07-10      KRW  1720.12000
#> 23: 2026-07-10      MXN    20.03400
#> 24: 2026-07-10      MYR     4.65200
#> 25: 2026-07-10      NZD     1.98080
#> 26: 2026-07-10      PHP    70.37800
#> 27: 2026-07-10      SGD     1.47570
#> 28: 2026-07-10      THB    38.07900
#> 29: 2026-07-10      ZAR    18.65570
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
