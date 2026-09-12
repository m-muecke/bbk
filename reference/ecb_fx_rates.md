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
#>  1: 2026-09-11      USD     1.15920
#>  2: 2026-09-11      JPY   178.56000
#>  3: 2026-09-11      CZK    24.26400
#>  4: 2026-09-11      DKK     7.47480
#>  5: 2026-09-11      GBP     0.85815
#>  6: 2026-09-11      HUF   364.45000
#>  7: 2026-09-11      PLN     4.32500
#>  8: 2026-09-11      RON     5.25470
#>  9: 2026-09-11      SEK    11.23730
#> 10: 2026-09-11      CHF     0.94510
#> 11: 2026-09-11      ISK   139.60000
#> 12: 2026-09-11      NOK    10.78050
#> 13: 2026-09-11      TRY    56.33290
#> 14: 2026-09-11      AUD     1.61610
#> 15: 2026-09-11      BRL     5.92440
#> 16: 2026-09-11      CAD     1.60640
#> 17: 2026-09-11      CNY     7.77620
#> 18: 2026-09-11      HKD     9.09040
#> 19: 2026-09-11      IDR 20404.99000
#> 20: 2026-09-11      ILS     3.53010
#> 21: 2026-09-11      INR   110.76750
#> 22: 2026-09-11      KRW  1556.56000
#> 23: 2026-09-11      MXN    19.67980
#> 24: 2026-09-11      MYR     4.71850
#> 25: 2026-09-11      NZD     1.99140
#> 26: 2026-09-11      PHP    72.60000
#> 27: 2026-09-11      SGD     1.46970
#> 28: 2026-09-11      THB    38.32900
#> 29: 2026-09-11      ZAR    18.73120
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
