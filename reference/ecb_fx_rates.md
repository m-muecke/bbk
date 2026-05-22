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
#>  1: 2026-05-21      USD     1.15990
#>  2: 2026-05-21      JPY   184.59000
#>  3: 2026-05-21      CZK    24.29200
#>  4: 2026-05-21      DKK     7.47300
#>  5: 2026-05-21      GBP     0.86433
#>  6: 2026-05-21      HUF   360.53000
#>  7: 2026-05-21      PLN     4.24830
#>  8: 2026-05-21      RON     5.24350
#>  9: 2026-05-21      SEK    10.86150
#> 10: 2026-05-21      CHF     0.91450
#> 11: 2026-05-21      ISK   143.40000
#> 12: 2026-05-21      NOK    10.70750
#> 13: 2026-05-21      TRY    52.90550
#> 14: 2026-05-21      AUD     1.62730
#> 15: 2026-05-21      BRL     5.81340
#> 16: 2026-05-21      CAD     1.59720
#> 17: 2026-05-21      CNY     7.88990
#> 18: 2026-05-21      HKD     9.08730
#> 19: 2026-05-21      IDR 20504.02000
#> 20: 2026-05-21      ILS     3.38210
#> 21: 2026-05-21      INR   111.58850
#> 22: 2026-05-21      KRW  1749.99000
#> 23: 2026-05-21      MXN    20.12570
#> 24: 2026-05-21      MYR     4.59610
#> 25: 2026-05-21      NZD     1.98020
#> 26: 2026-05-21      PHP    71.44700
#> 27: 2026-05-21      SGD     1.48480
#> 28: 2026-05-21      THB    37.91100
#> 29: 2026-05-21      ZAR    19.20090
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
