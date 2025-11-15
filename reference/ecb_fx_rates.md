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
#>  1: 2025-11-14      USD     1.1648
#>  2: 2025-11-14      JPY   179.2200
#>  3: 2025-11-14      BGN     1.9558
#>  4: 2025-11-14      CZK    24.1980
#>  5: 2025-11-14      DKK     7.4679
#>  6: 2025-11-14      GBP     0.8846
#>  7: 2025-11-14      HUF   384.9000
#>  8: 2025-11-14      PLN     4.2328
#>  9: 2025-11-14      RON     5.0851
#> 10: 2025-11-14      SEK    10.9835
#> 11: 2025-11-14      CHF     0.9185
#> 12: 2025-11-14      ISK   147.4000
#> 13: 2025-11-14      NOK    11.7285
#> 14: 2025-11-14      TRY    49.3064
#> 15: 2025-11-14      AUD     1.7847
#> 16: 2025-11-14      BRL     6.1764
#> 17: 2025-11-14      CAD     1.6331
#> 18: 2025-11-14      CNY     8.2655
#> 19: 2025-11-14      HKD     9.0517
#> 20: 2025-11-14      IDR 19455.3600
#> 21: 2025-11-14      ILS     3.7718
#> 22: 2025-11-14      INR   103.2865
#> 23: 2025-11-14      KRW  1690.7100
#> 24: 2025-11-14      MXN    21.4017
#> 25: 2025-11-14      MYR     4.8135
#> 26: 2025-11-14      NZD     2.0489
#> 27: 2025-11-14      PHP    68.6950
#> 28: 2025-11-14      SGD     1.5129
#> 29: 2025-11-14      THB    37.7400
#> 30: 2025-11-14      ZAR    19.9561
#>           date currency       rate
# }
```
