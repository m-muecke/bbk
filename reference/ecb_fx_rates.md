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
#>  1: 2026-04-10      USD     1.17110
#>  2: 2026-04-10      JPY   186.43000
#>  3: 2026-04-10      CZK    24.36500
#>  4: 2026-04-10      DKK     7.47270
#>  5: 2026-04-10      GBP     0.87105
#>  6: 2026-04-10      HUF   377.20000
#>  7: 2026-04-10      PLN     4.24350
#>  8: 2026-04-10      RON     5.09150
#>  9: 2026-04-10      SEK    10.83600
#> 10: 2026-04-10      CHF     0.92410
#> 11: 2026-04-10      ISK   143.29000
#> 12: 2026-04-10      NOK    11.11650
#> 13: 2026-04-10      TRY    52.31470
#> 14: 2026-04-10      AUD     1.65610
#> 15: 2026-04-10      BRL     5.91910
#> 16: 2026-04-10      CAD     1.61870
#> 17: 2026-04-10      CNY     7.99670
#> 18: 2026-04-10      HKD     9.17290
#> 19: 2026-04-10      IDR 20020.25000
#> 20: 2026-04-10      ILS     3.57090
#> 21: 2026-04-10      INR   108.77950
#> 22: 2026-04-10      KRW  1737.06000
#> 23: 2026-04-10      MXN    20.31840
#> 24: 2026-04-10      MYR     4.64340
#> 25: 2026-04-10      NZD     2.00340
#> 26: 2026-04-10      PHP    70.08800
#> 27: 2026-04-10      SGD     1.49190
#> 28: 2026-04-10      THB    37.59200
#> 29: 2026-04-10      ZAR    19.23890
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
