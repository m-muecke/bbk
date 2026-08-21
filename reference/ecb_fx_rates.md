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
#>  1: 2026-08-21      USD     1.1699
#>  2: 2026-08-21      JPY   185.6600
#>  3: 2026-08-21      CZK    24.1160
#>  4: 2026-08-21      DKK     7.4758
#>  5: 2026-08-21      GBP     0.8567
#>  6: 2026-08-21      HUF   362.7800
#>  7: 2026-08-21      PLN     4.3078
#>  8: 2026-08-21      RON     5.2563
#>  9: 2026-08-21      SEK    11.0625
#> 10: 2026-08-21      CHF     0.9353
#> 11: 2026-08-21      ISK   141.6000
#> 12: 2026-08-21      NOK    10.8675
#> 13: 2026-08-21      TRY    56.2318
#> 14: 2026-08-21      AUD     1.6321
#> 15: 2026-08-21      BRL     6.0518
#> 16: 2026-08-21      CAD     1.6074
#> 17: 2026-08-21      CNY     7.8624
#> 18: 2026-08-21      HKD     9.1726
#> 19: 2026-08-21      IDR 20659.3800
#> 20: 2026-08-21      ILS     3.4917
#> 21: 2026-08-21      INR   111.9595
#> 22: 2026-08-21      KRW  1619.4100
#> 23: 2026-08-21      MXN    19.7690
#> 24: 2026-08-21      MYR     4.7246
#> 25: 2026-08-21      NZD     1.9541
#> 26: 2026-08-21      PHP    72.1360
#> 27: 2026-08-21      SGD     1.4838
#> 28: 2026-08-21      THB    38.2260
#> 29: 2026-08-21      ZAR    18.7236
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
