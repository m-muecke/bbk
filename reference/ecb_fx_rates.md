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
#>  1: 2026-08-26      USD     1.16690
#>  2: 2026-08-26      JPY   185.62000
#>  3: 2026-08-26      CZK    24.08300
#>  4: 2026-08-26      DKK     7.47570
#>  5: 2026-08-26      GBP     0.85613
#>  6: 2026-08-26      HUF   360.18000
#>  7: 2026-08-26      PLN     4.29550
#>  8: 2026-08-26      RON     5.25680
#>  9: 2026-08-26      SEK    11.07850
#> 10: 2026-08-26      CHF     0.93800
#> 11: 2026-08-26      ISK   141.20000
#> 12: 2026-08-26      NOK    10.88450
#> 13: 2026-08-26      TRY    56.14810
#> 14: 2026-08-26      AUD     1.62410
#> 15: 2026-08-26      BRL     6.00550
#> 16: 2026-08-26      CAD     1.61760
#> 17: 2026-08-26      CNY     7.84220
#> 18: 2026-08-26      HKD     9.14630
#> 19: 2026-08-26      IDR 20668.66000
#> 20: 2026-08-26      ILS     3.47060
#> 21: 2026-08-26      INR   111.34750
#> 22: 2026-08-26      KRW  1614.39000
#> 23: 2026-08-26      MXN    19.75670
#> 24: 2026-08-26      MYR     4.69850
#> 25: 2026-08-26      NZD     1.95820
#> 26: 2026-08-26      PHP    71.95200
#> 27: 2026-08-26      SGD     1.48170
#> 28: 2026-08-26      THB    38.21000
#> 29: 2026-08-26      ZAR    18.57240
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
