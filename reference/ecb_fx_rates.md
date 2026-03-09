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
#>  1: 2026-03-09      USD     1.1555
#>  2: 2026-03-09      JPY   183.1500
#>  3: 2026-03-09      CZK    24.3990
#>  4: 2026-03-09      DKK     7.4708
#>  5: 2026-03-09      GBP     0.8653
#>  6: 2026-03-09      HUF   396.3800
#>  7: 2026-03-09      PLN     4.2785
#>  8: 2026-03-09      RON     5.0979
#>  9: 2026-03-09      SEK    10.6945
#> 10: 2026-03-09      CHF     0.9008
#> 11: 2026-03-09      ISK   145.1000
#> 12: 2026-03-09      NOK    11.1545
#> 13: 2026-03-09      TRY    50.9394
#> 14: 2026-03-09      AUD     1.6465
#> 15: 2026-03-09      BRL     6.0435
#> 16: 2026-03-09      CAD     1.5680
#> 17: 2026-03-09      CNY     7.9929
#> 18: 2026-03-09      HKD     9.0311
#> 19: 2026-03-09      IDR 19575.5600
#> 20: 2026-03-09      ILS     3.5948
#> 21: 2026-03-09      INR   106.6500
#> 22: 2026-03-09      KRW  1716.0600
#> 23: 2026-03-09      MXN    20.6231
#> 24: 2026-03-09      MYR     4.5792
#> 25: 2026-03-09      NZD     1.9563
#> 26: 2026-03-09      PHP    68.7790
#> 27: 2026-03-09      SGD     1.4792
#> 28: 2026-03-09      THB    37.0570
#> 29: 2026-03-09      ZAR    19.2700
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
