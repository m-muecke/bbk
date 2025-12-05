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
#>  1: 2025-12-05      USD     1.1645
#>  2: 2025-12-05      JPY   180.7600
#>  3: 2025-12-05      BGN     1.9558
#>  4: 2025-12-05      CZK    24.2100
#>  5: 2025-12-05      DKK     7.4689
#>  6: 2025-12-05      GBP     0.8727
#>  7: 2025-12-05      HUF   381.7800
#>  8: 2025-12-05      PLN     4.2323
#>  9: 2025-12-05      RON     5.0928
#> 10: 2025-12-05      SEK    10.9590
#> 11: 2025-12-05      CHF     0.9365
#> 12: 2025-12-05      ISK   148.8000
#> 13: 2025-12-05      NOK    11.7550
#> 14: 2025-12-05      TRY    49.5072
#> 15: 2025-12-05      AUD     1.7546
#> 16: 2025-12-05      BRL     6.1850
#> 17: 2025-12-05      CAD     1.6230
#> 18: 2025-12-05      CNY     8.2333
#> 19: 2025-12-05      HKD     9.0652
#> 20: 2025-12-05      IDR 19413.6700
#> 21: 2025-12-05      ILS     3.7632
#> 22: 2025-12-05      INR   104.7330
#> 23: 2025-12-05      KRW  1714.8200
#> 24: 2025-12-05      MXN    21.1912
#> 25: 2025-12-05      MYR     4.7873
#> 26: 2025-12-05      NZD     2.0158
#> 27: 2025-12-05      PHP    68.7190
#> 28: 2025-12-05      SGD     1.5084
#> 29: 2025-12-05      THB    37.0950
#> 30: 2025-12-05      ZAR    19.7169
#>           date currency       rate
# }
```
