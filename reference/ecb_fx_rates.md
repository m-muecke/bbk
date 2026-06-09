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
#>  1: 2026-06-08      USD     1.1540
#>  2: 2026-06-08      JPY   184.6000
#>  3: 2026-06-08      CZK    24.2310
#>  4: 2026-06-08      DKK     7.4740
#>  5: 2026-06-08      GBP     0.8636
#>  6: 2026-06-08      HUF   355.5500
#>  7: 2026-06-08      PLN     4.2423
#>  8: 2026-06-08      RON     5.2432
#>  9: 2026-06-08      SEK    10.8760
#> 10: 2026-06-08      CHF     0.9187
#> 11: 2026-06-08      ISK   143.6000
#> 12: 2026-06-08      NOK    10.9165
#> 13: 2026-06-08      TRY    53.1988
#> 14: 2026-06-08      AUD     1.6311
#> 15: 2026-06-08      BRL     5.9353
#> 16: 2026-06-08      CAD     1.6083
#> 17: 2026-06-08      CNY     7.8263
#> 18: 2026-06-08      HKD     9.0427
#> 19: 2026-06-08      IDR 20945.6200
#> 20: 2026-06-08      ILS     3.3660
#> 21: 2026-06-08      INR   110.4475
#> 22: 2026-06-08      KRW  1763.2600
#> 23: 2026-06-08      MXN    20.0945
#> 24: 2026-06-08      MYR     4.7008
#> 25: 2026-06-08      NZD     1.9792
#> 26: 2026-06-08      PHP    71.1930
#> 27: 2026-06-08      SGD     1.4855
#> 28: 2026-06-08      THB    37.8110
#> 29: 2026-06-08      ZAR    18.9991
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
