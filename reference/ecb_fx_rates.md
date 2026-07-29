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
#>  1: 2026-07-28      USD     1.1367
#>  2: 2026-07-28      JPY   186.3200
#>  3: 2026-07-28      CZK    24.1870
#>  4: 2026-07-28      DKK     7.4752
#>  5: 2026-07-28      GBP     0.8555
#>  6: 2026-07-28      HUF   360.9000
#>  7: 2026-07-28      PLN     4.3265
#>  8: 2026-07-28      RON     5.2319
#>  9: 2026-07-28      SEK    11.0625
#> 10: 2026-07-28      CHF     0.9319
#> 11: 2026-07-28      ISK   142.4000
#> 12: 2026-07-28      NOK    11.0055
#> 13: 2026-07-28      TRY    53.8564
#> 14: 2026-07-28      AUD     1.6312
#> 15: 2026-07-28      BRL     5.8158
#> 16: 2026-07-28      CAD     1.6036
#> 17: 2026-07-28      CNY     7.6969
#> 18: 2026-07-28      HKD     8.9136
#> 19: 2026-07-28      IDR 20576.7700
#> 20: 2026-07-28      ILS     3.4747
#> 21: 2026-07-28      INR   108.9610
#> 22: 2026-07-28      KRW  1658.9600
#> 23: 2026-07-28      MXN    19.8629
#> 24: 2026-07-28      MYR     4.6514
#> 25: 2026-07-28      NZD     1.9693
#> 26: 2026-07-28      PHP    70.0590
#> 27: 2026-07-28      SGD     1.4702
#> 28: 2026-07-28      THB    38.2040
#> 29: 2026-07-28      ZAR    19.0797
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
