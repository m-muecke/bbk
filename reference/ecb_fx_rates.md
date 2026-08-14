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
#>  1: 2026-08-13      USD     1.1534
#>  2: 2026-08-13      JPY   183.7700
#>  3: 2026-08-13      CZK    24.2260
#>  4: 2026-08-13      DKK     7.4757
#>  5: 2026-08-13      GBP     0.8549
#>  6: 2026-08-13      HUF   362.8500
#>  7: 2026-08-13      PLN     4.3048
#>  8: 2026-08-13      RON     5.2444
#>  9: 2026-08-13      SEK    11.0285
#> 10: 2026-08-13      CHF     0.9373
#> 11: 2026-08-13      ISK   142.2000
#> 12: 2026-08-13      NOK    10.9860
#> 13: 2026-08-13      TRY    55.1035
#> 14: 2026-08-13      AUD     1.6356
#> 15: 2026-08-13      BRL     5.9759
#> 16: 2026-08-13      CAD     1.6089
#> 17: 2026-08-13      CNY     7.7774
#> 18: 2026-08-13      HKD     9.0506
#> 19: 2026-08-13      IDR 20595.2800
#> 20: 2026-08-13      ILS     3.4383
#> 21: 2026-08-13      INR   110.0815
#> 22: 2026-08-13      KRW  1638.1600
#> 23: 2026-08-13      MXN    19.6694
#> 24: 2026-08-13      MYR     4.7139
#> 25: 2026-08-13      NZD     1.9735
#> 26: 2026-08-13      PHP    70.7320
#> 27: 2026-08-13      SGD     1.4765
#> 28: 2026-08-13      THB    38.2120
#> 29: 2026-08-13      ZAR    18.5914
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
