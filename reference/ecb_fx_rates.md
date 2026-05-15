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
#>  1: 2026-05-15      USD     1.1628
#>  2: 2026-05-15      JPY   184.3600
#>  3: 2026-05-15      CZK    24.3330
#>  4: 2026-05-15      DKK     7.4728
#>  5: 2026-05-15      GBP     0.8705
#>  6: 2026-05-15      HUF   359.7800
#>  7: 2026-05-15      PLN     4.2465
#>  8: 2026-05-15      RON     5.2166
#>  9: 2026-05-15      SEK    10.9820
#> 10: 2026-05-15      CHF     0.9144
#> 11: 2026-05-15      ISK   143.6000
#> 12: 2026-05-15      NOK    10.8450
#> 13: 2026-05-15      TRY    52.9598
#> 14: 2026-05-15      AUD     1.6265
#> 15: 2026-05-15      BRL     5.8517
#> 16: 2026-05-15      CAD     1.5995
#> 17: 2026-05-15      CNY     7.9194
#> 18: 2026-05-15      HKD     9.1065
#> 19: 2026-05-15      IDR 20452.1400
#> 20: 2026-05-15      ILS     3.3977
#> 21: 2026-05-15      INR   111.5940
#> 22: 2026-05-15      KRW  1743.7600
#> 23: 2026-05-15      MXN    20.2024
#> 24: 2026-05-15      MYR     4.5942
#> 25: 2026-05-15      NZD     1.9908
#> 26: 2026-05-15      PHP    71.7380
#> 27: 2026-05-15      SGD     1.4884
#> 28: 2026-05-15      THB    37.9890
#> 29: 2026-05-15      ZAR    19.3739
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
