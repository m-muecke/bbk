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
#>           date currency        rate
#>         <Date>   <char>       <num>
#>  1: 2026-08-19      USD     1.16050
#>  2: 2026-08-19      JPY   184.62000
#>  3: 2026-08-19      CZK    24.16300
#>  4: 2026-08-19      DKK     7.47590
#>  5: 2026-08-19      GBP     0.85608
#>  6: 2026-08-19      HUF   364.58000
#>  7: 2026-08-19      PLN     4.32450
#>  8: 2026-08-19      RON     5.24640
#>  9: 2026-08-19      SEK    11.03850
#> 10: 2026-08-19      CHF     0.94020
#> 11: 2026-08-19      ISK   142.20000
#> 12: 2026-08-19      NOK    10.91050
#> 13: 2026-08-19      TRY    55.62810
#> 14: 2026-08-19      AUD     1.64010
#> 15: 2026-08-19      BRL     6.03940
#> 16: 2026-08-19      CAD     1.60980
#> 17: 2026-08-19      CNY     7.81970
#> 18: 2026-08-19      HKD     9.10020
#> 19: 2026-08-19      IDR 20694.15000
#> 20: 2026-08-19      ILS     3.46660
#> 21: 2026-08-19      INR   111.12650
#> 22: 2026-08-19      KRW  1614.81000
#> 23: 2026-08-19      MXN    19.77090
#> 24: 2026-08-19      MYR     4.70870
#> 25: 2026-08-19      NZD     1.97380
#> 26: 2026-08-19      PHP    71.74300
#> 27: 2026-08-19      SGD     1.48100
#> 28: 2026-08-19      THB    38.37200
#> 29: 2026-08-19      ZAR    18.85150
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
