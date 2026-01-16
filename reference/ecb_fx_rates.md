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
#>  1: 2026-01-16      USD     1.1617
#>  2: 2026-01-16      JPY   183.6700
#>  3: 2026-01-16      CZK    24.2860
#>  4: 2026-01-16      DKK     7.4712
#>  5: 2026-01-16      GBP     0.8670
#>  6: 2026-01-16      HUF   385.3300
#>  7: 2026-01-16      PLN     4.2248
#>  8: 2026-01-16      RON     5.0908
#>  9: 2026-01-16      SEK    10.7190
#> 10: 2026-01-16      CHF     0.9313
#> 11: 2026-01-16      ISK   146.4000
#> 12: 2026-01-16      NOK    11.7203
#> 13: 2026-01-16      TRY    50.2784
#> 14: 2026-01-16      AUD     1.7344
#> 15: 2026-01-16      BRL     6.2411
#> 16: 2026-01-16      CAD     1.6135
#> 17: 2026-01-16      CNY     8.0967
#> 18: 2026-01-16      HKD     9.0613
#> 19: 2026-01-16      IDR 19653.7600
#> 20: 2026-01-16      ILS     3.6600
#> 21: 2026-01-16      INR   105.3970
#> 22: 2026-01-16      KRW  1711.1000
#> 23: 2026-01-16      MXN    20.5333
#> 24: 2026-01-16      MYR     4.7136
#> 25: 2026-01-16      NZD     2.0179
#> 26: 2026-01-16      PHP    68.9950
#> 27: 2026-01-16      SGD     1.4962
#> 28: 2026-01-16      THB    36.5350
#> 29: 2026-01-16      ZAR    19.0382
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
