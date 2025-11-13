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
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
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
#>  1: 2025-11-13      USD     1.1619
#>  2: 2025-11-13      JPY   179.5700
#>  3: 2025-11-13      BGN     1.9558
#>  4: 2025-11-13      CZK    24.1910
#>  5: 2025-11-13      DKK     7.4677
#>  6: 2025-11-13      GBP     0.8819
#>  7: 2025-11-13      HUF   384.0000
#>  8: 2025-11-13      PLN     4.2280
#>  9: 2025-11-13      RON     5.0837
#> 10: 2025-11-13      SEK    10.9405
#> 11: 2025-11-13      CHF     0.9244
#> 12: 2025-11-13      ISK   147.0000
#> 13: 2025-11-13      NOK    11.6740
#> 14: 2025-11-13      TRY    49.0952
#> 15: 2025-11-13      AUD     1.7722
#> 16: 2025-11-13      BRL     6.1383
#> 17: 2025-11-13      CAD     1.6272
#> 18: 2025-11-13      CNY     8.2450
#> 19: 2025-11-13      HKD     9.0288
#> 20: 2025-11-13      IDR 19417.0300
#> 21: 2025-11-13      ILS     3.7310
#> 22: 2025-11-13      INR   103.0475
#> 23: 2025-11-13      KRW  1700.4200
#> 24: 2025-11-13      MXN    21.2252
#> 25: 2025-11-13      MYR     4.7975
#> 26: 2025-11-13      NZD     2.0507
#> 27: 2025-11-13      PHP    68.4180
#> 28: 2025-11-13      SGD     1.5109
#> 29: 2025-11-13      THB    37.5410
#> 30: 2025-11-13      ZAR    19.7556
#>           date currency       rate
# }
```
