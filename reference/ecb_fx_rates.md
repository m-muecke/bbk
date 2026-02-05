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
#>  1: 2026-02-05      USD     1.1798
#>  2: 2026-02-05      JPY   185.1100
#>  3: 2026-02-05      CZK    24.3100
#>  4: 2026-02-05      DKK     7.4662
#>  5: 2026-02-05      GBP     0.8691
#>  6: 2026-02-05      HUF   379.6500
#>  7: 2026-02-05      PLN     4.2205
#>  8: 2026-02-05      RON     5.0935
#>  9: 2026-02-05      SEK    10.6410
#> 10: 2026-02-05      CHF     0.9161
#> 11: 2026-02-05      ISK   144.8000
#> 12: 2026-02-05      NOK    11.4740
#> 13: 2026-02-05      TRY    51.3684
#> 14: 2026-02-05      AUD     1.6922
#> 15: 2026-02-05      BRL     6.2059
#> 16: 2026-02-05      CAD     1.6144
#> 17: 2026-02-05      CNY     8.1869
#> 18: 2026-02-05      HKD     9.2171
#> 19: 2026-02-05      IDR 19900.0000
#> 20: 2026-02-05      ILS     3.6752
#> 21: 2026-02-05      INR   106.5460
#> 22: 2026-02-05      KRW  1728.5800
#> 23: 2026-02-05      MXN    20.5112
#> 24: 2026-02-05      MYR     4.6567
#> 25: 2026-02-05      NZD     1.9676
#> 26: 2026-02-05      PHP    69.2990
#> 27: 2026-02-05      SGD     1.5021
#> 28: 2026-02-05      THB    37.4880
#> 29: 2026-02-05      ZAR    19.0889
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
