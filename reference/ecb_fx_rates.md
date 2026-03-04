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
#>  1: 2026-03-03      USD     1.1606
#>  2: 2026-03-03      JPY   182.9800
#>  3: 2026-03-03      CZK    24.3780
#>  4: 2026-03-03      DKK     7.4704
#>  5: 2026-03-03      GBP     0.8717
#>  6: 2026-03-03      HUF   387.8900
#>  7: 2026-03-03      PLN     4.2865
#>  8: 2026-03-03      RON     5.0981
#>  9: 2026-03-03      SEK    10.7265
#> 10: 2026-03-03      CHF     0.9107
#> 11: 2026-03-03      ISK   144.1000
#> 12: 2026-03-03      NOK    11.2485
#> 13: 2026-03-03      TRY    51.0409
#> 14: 2026-03-03      AUD     1.6534
#> 15: 2026-03-03      BRL     6.0855
#> 16: 2026-03-03      CAD     1.5883
#> 17: 2026-03-03      CNY     8.0170
#> 18: 2026-03-03      HKD     9.0552
#> 19: 2026-03-03      IDR 19607.8100
#> 20: 2026-03-03      ILS     3.5945
#> 21: 2026-03-03      INR   106.9525
#> 22: 2026-03-03      KRW  1715.9500
#> 23: 2026-03-03      MXN    20.3277
#> 24: 2026-03-03      MYR     4.5797
#> 25: 2026-03-03      NZD     1.9688
#> 26: 2026-03-03      PHP    67.8530
#> 27: 2026-03-03      SGD     1.4833
#> 28: 2026-03-03      THB    36.8610
#> 29: 2026-03-03      ZAR    19.0262
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
