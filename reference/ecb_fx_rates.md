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
#>  1: 2025-12-15      USD     1.1753
#>  2: 2025-12-15      JPY   182.3200
#>  3: 2025-12-15      BGN     1.9558
#>  4: 2025-12-15      CZK    24.2990
#>  5: 2025-12-15      DKK     7.4704
#>  6: 2025-12-15      GBP     0.8779
#>  7: 2025-12-15      HUF   385.1500
#>  8: 2025-12-15      PLN     4.2215
#>  9: 2025-12-15      RON     5.0929
#> 10: 2025-12-15      SEK    10.9155
#> 11: 2025-12-15      CHF     0.9355
#> 12: 2025-12-15      ISK   148.2000
#> 13: 2025-12-15      NOK    11.9075
#> 14: 2025-12-15      TRY    50.1840
#> 15: 2025-12-15      AUD     1.7669
#> 16: 2025-12-15      BRL     6.3322
#> 17: 2025-12-15      CAD     1.6169
#> 18: 2025-12-15      CNY     8.2824
#> 19: 2025-12-15      HKD     9.1462
#> 20: 2025-12-15      IDR 19607.0600
#> 21: 2025-12-15      ILS     3.7742
#> 22: 2025-12-15      INR   106.6530
#> 23: 2025-12-15      KRW  1721.9900
#> 24: 2025-12-15      MXN    21.1322
#> 25: 2025-12-15      MYR     4.8099
#> 26: 2025-12-15      NZD     2.0290
#> 27: 2025-12-15      PHP    69.3000
#> 28: 2025-12-15      SGD     1.5148
#> 29: 2025-12-15      THB    36.9930
#> 30: 2025-12-15      ZAR    19.7182
#>           date currency       rate
# }
```
