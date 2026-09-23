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
#>  1: 2026-09-23      USD     1.1411
#>  2: 2026-09-23      JPY   180.2000
#>  3: 2026-09-23      CZK    24.3830
#>  4: 2026-09-23      DKK     7.4756
#>  5: 2026-09-23      GBP     0.8595
#>  6: 2026-09-23      HUF   364.2900
#>  7: 2026-09-23      PLN     4.3765
#>  8: 2026-09-23      RON     5.2785
#>  9: 2026-09-23      SEK    11.2720
#> 10: 2026-09-23      CHF     0.9390
#> 11: 2026-09-23      ISK   138.0000
#> 12: 2026-09-23      NOK    10.7990
#> 13: 2026-09-23      TRY    55.7283
#> 14: 2026-09-23      AUD     1.6146
#> 15: 2026-09-23      BRL     5.8564
#> 16: 2026-09-23      CAD     1.6077
#> 17: 2026-09-23      CNY     7.6538
#> 18: 2026-09-23      HKD     8.9506
#> 19: 2026-09-23      IDR 20305.8200
#> 20: 2026-09-23      ILS     3.4417
#> 21: 2026-09-23      INR   109.2500
#> 22: 2026-09-23      KRW  1558.0000
#> 23: 2026-09-23      MXN    19.8999
#> 24: 2026-09-23      MYR     4.6557
#> 25: 2026-09-23      NZD     2.0049
#> 26: 2026-09-23      PHP    71.3710
#> 27: 2026-09-23      SGD     1.4587
#> 28: 2026-09-23      THB    37.9870
#> 29: 2026-09-23      ZAR    18.6537
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
