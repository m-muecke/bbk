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
#>  1: 2026-06-01      USD     1.16460
#>  2: 2026-06-01      JPY   185.74000
#>  3: 2026-06-01      CZK    24.28500
#>  4: 2026-06-01      DKK     7.47370
#>  5: 2026-06-01      GBP     0.86493
#>  6: 2026-06-01      HUF   354.80000
#>  7: 2026-06-01      PLN     4.23300
#>  8: 2026-06-01      RON     5.25310
#>  9: 2026-06-01      SEK    10.78900
#> 10: 2026-06-01      CHF     0.91280
#> 11: 2026-06-01      ISK   143.80000
#> 12: 2026-06-01      NOK    10.78850
#> 13: 2026-06-01      TRY    53.44830
#> 14: 2026-06-01      AUD     1.62340
#> 15: 2026-06-01      BRL     5.85150
#> 16: 2026-06-01      CAD     1.61060
#> 17: 2026-06-01      CNY     7.87860
#> 18: 2026-06-01      HKD     9.12710
#> 19: 2026-06-01      IDR 20770.64000
#> 20: 2026-06-01      ILS     3.27890
#> 21: 2026-06-01      INR   110.62900
#> 22: 2026-06-01      KRW  1756.96000
#> 23: 2026-06-01      MXN    20.17940
#> 24: 2026-06-01      MYR     4.61760
#> 25: 2026-06-01      NZD     1.95580
#> 26: 2026-06-01      PHP    71.91600
#> 27: 2026-06-01      SGD     1.48810
#> 28: 2026-06-01      THB    37.91400
#> 29: 2026-06-01      ZAR    18.92890
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
