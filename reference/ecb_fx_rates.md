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
#>  1: 2026-07-29      USD     1.13800
#>  2: 2026-07-29      JPY   186.27000
#>  3: 2026-07-29      CZK    24.19000
#>  4: 2026-07-29      DKK     7.47480
#>  5: 2026-07-29      GBP     0.85635
#>  6: 2026-07-29      HUF   362.18000
#>  7: 2026-07-29      PLN     4.32700
#>  8: 2026-07-29      RON     5.23530
#>  9: 2026-07-29      SEK    11.05300
#> 10: 2026-07-29      CHF     0.93320
#> 11: 2026-07-29      ISK   142.60000
#> 12: 2026-07-29      NOK    10.99800
#> 13: 2026-07-29      TRY    53.93860
#> 14: 2026-07-29      AUD     1.63970
#> 15: 2026-07-29      BRL     5.82680
#> 16: 2026-07-29      CAD     1.60510
#> 17: 2026-07-29      CNY     7.70000
#> 18: 2026-07-29      HKD     8.92460
#> 19: 2026-07-29      IDR 20566.33000
#> 20: 2026-07-29      ILS     3.48480
#> 21: 2026-07-29      INR   108.84750
#> 22: 2026-07-29      KRW  1652.77000
#> 23: 2026-07-29      MXN    19.88710
#> 24: 2026-07-29      MYR     4.65390
#> 25: 2026-07-29      NZD     1.97090
#> 26: 2026-07-29      PHP    69.87800
#> 27: 2026-07-29      SGD     1.47100
#> 28: 2026-07-29      THB    38.15700
#> 29: 2026-07-29      ZAR    19.06140
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
