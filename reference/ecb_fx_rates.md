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
#>  1: 2025-11-17      USD     1.1593
#>  2: 2025-11-17      JPY   179.5700
#>  3: 2025-11-17      BGN     1.9558
#>  4: 2025-11-17      CZK    24.1690
#>  5: 2025-11-17      DKK     7.4683
#>  6: 2025-11-17      GBP     0.8795
#>  7: 2025-11-17      HUF   383.9300
#>  8: 2025-11-17      PLN     4.2228
#>  9: 2025-11-17      RON     5.0840
#> 10: 2025-11-17      SEK    10.9635
#> 11: 2025-11-17      CHF     0.9225
#> 12: 2025-11-17      ISK   147.2000
#> 13: 2025-11-17      NOK    11.7005
#> 14: 2025-11-17      TRY    49.0711
#> 15: 2025-11-17      AUD     1.7798
#> 16: 2025-11-17      BRL     6.1493
#> 17: 2025-11-17      CAD     1.6270
#> 18: 2025-11-17      CNY     8.2398
#> 19: 2025-11-17      HKD     9.0120
#> 20: 2025-11-17      IDR 19401.2900
#> 21: 2025-11-17      ILS     3.7595
#> 22: 2025-11-17      INR   102.7195
#> 23: 2025-11-17      KRW  1694.2700
#> 24: 2025-11-17      MXN    21.2546
#> 25: 2025-11-17      MYR     4.8111
#> 26: 2025-11-17      NZD     2.0464
#> 27: 2025-11-17      PHP    68.3550
#> 28: 2025-11-17      SGD     1.5099
#> 29: 2025-11-17      THB    37.6420
#> 30: 2025-11-17      ZAR    19.7978
#>           date currency       rate
# }
```
