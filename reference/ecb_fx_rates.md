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
#>           date currency       rate
#>         <Date>   <char>      <num>
#>  1: 2026-10-30      USD     1.1172
#>  2: 2026-10-30      JPY   175.6800
#>  3: 2026-10-30      CZK    24.3530
#>  4: 2026-10-30      DKK     7.4735
#>  5: 2026-10-30      GBP     0.8338
#>  6: 2026-10-30      HUF   366.3300
#>  7: 2026-10-30      PLN     4.4038
#>  8: 2026-10-30      RON     5.3447
#>  9: 2026-10-30      SEK    10.9780
#> 10: 2026-10-30      CHF     0.9194
#> 11: 2026-10-30      ISK   136.0000
#> 12: 2026-10-30      NOK    10.3120
#> 13: 2026-10-30      TRY    55.8015
#> 14: 2026-10-30      AUD     1.5904
#> 15: 2026-10-30      BRL     6.0692
#> 16: 2026-10-30      CAD     1.5606
#> 17: 2026-10-30      CNY     7.4326
#> 18: 2026-10-30      HKD     8.7652
#> 19: 2026-10-30      IDR 20275.1700
#> 20: 2026-10-30      ILS     3.4950
#> 21: 2026-10-30      INR   106.0840
#> 22: 2026-10-30      KRW  1491.7600
#> 23: 2026-10-30      MXN    21.1237
#> 24: 2026-10-30      MYR     4.5325
#> 25: 2026-10-30      NZD     1.9823
#> 26: 2026-10-30      PHP    71.1430
#> 27: 2026-10-30      SGD     1.4282
#> 28: 2026-10-30      THB    37.6830
#> 29: 2026-10-30      ZAR    18.6455
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
