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
#>  1: 2026-08-05      USD     1.1554
#>  2: 2026-08-05      JPY   182.0800
#>  3: 2026-08-05      CZK    24.1950
#>  4: 2026-08-05      DKK     7.4753
#>  5: 2026-08-05      GBP     0.8572
#>  6: 2026-08-05      HUF   362.0800
#>  7: 2026-08-05      PLN     4.3060
#>  8: 2026-08-05      RON     5.2469
#>  9: 2026-08-05      SEK    10.9635
#> 10: 2026-08-05      CHF     0.9345
#> 11: 2026-08-05      ISK   141.8000
#> 12: 2026-08-05      NOK    10.9835
#> 13: 2026-08-05      TRY    54.9691
#> 14: 2026-08-05      AUD     1.6385
#> 15: 2026-08-05      BRL     5.9102
#> 16: 2026-08-05      CAD     1.6230
#> 17: 2026-08-05      CNY     7.7989
#> 18: 2026-08-05      HKD     9.0619
#> 19: 2026-08-05      IDR 20648.0400
#> 20: 2026-08-05      ILS     3.4672
#> 21: 2026-08-05      INR   109.9045
#> 22: 2026-08-05      KRW  1644.9700
#> 23: 2026-08-05      MXN    19.8867
#> 24: 2026-08-05      MYR     4.7291
#> 25: 2026-08-05      NZD     1.9680
#> 26: 2026-08-05      PHP    70.1920
#> 27: 2026-08-05      SGD     1.4806
#> 28: 2026-08-05      THB    38.2900
#> 29: 2026-08-05      ZAR    18.8869
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
