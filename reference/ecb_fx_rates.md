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
#>  1: 2026-07-08      USD     1.14040
#>  2: 2026-07-08      JPY   185.30000
#>  3: 2026-07-08      CZK    24.25400
#>  4: 2026-07-08      DKK     7.47540
#>  5: 2026-07-08      GBP     0.85435
#>  6: 2026-07-08      HUF   358.00000
#>  7: 2026-07-08      PLN     4.30950
#>  8: 2026-07-08      RON     5.23630
#>  9: 2026-07-08      SEK    11.05650
#> 10: 2026-07-08      CHF     0.92220
#> 11: 2026-07-08      ISK   143.40000
#> 12: 2026-07-08      NOK    11.13600
#> 13: 2026-07-08      TRY    53.43620
#> 14: 2026-07-08      AUD     1.64710
#> 15: 2026-07-08      BRL     5.88020
#> 16: 2026-07-08      CAD     1.61760
#> 17: 2026-07-08      CNY     7.75500
#> 18: 2026-07-08      HKD     8.93950
#> 19: 2026-07-08      IDR 20628.64000
#> 20: 2026-07-08      ILS     3.47000
#> 21: 2026-07-08      INR   108.97650
#> 22: 2026-07-08      KRW  1720.95000
#> 23: 2026-07-08      MXN    20.04280
#> 24: 2026-07-08      MYR     4.64940
#> 25: 2026-07-08      NZD     2.00190
#> 26: 2026-07-08      PHP    70.19900
#> 27: 2026-07-08      SGD     1.47570
#> 28: 2026-07-08      THB    38.14100
#> 29: 2026-07-08      ZAR    18.68310
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
