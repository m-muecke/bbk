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
#>  1: 2026-03-20      USD     1.15550
#>  2: 2026-03-20      JPY   183.46000
#>  3: 2026-03-20      CZK    24.50500
#>  4: 2026-03-20      DKK     7.47120
#>  5: 2026-03-20      GBP     0.86438
#>  6: 2026-03-20      HUF   392.48000
#>  7: 2026-03-20      PLN     4.27830
#>  8: 2026-03-20      RON     5.09600
#>  9: 2026-03-20      SEK    10.78250
#> 10: 2026-03-20      CHF     0.90960
#> 11: 2026-03-20      ISK   143.80000
#> 12: 2026-03-20      NOK    11.02900
#> 13: 2026-03-20      TRY    51.19700
#> 14: 2026-03-20      AUD     1.63510
#> 15: 2026-03-20      BRL     6.07240
#> 16: 2026-03-20      CAD     1.58490
#> 17: 2026-03-20      CNY     7.96640
#> 18: 2026-03-20      HKD     9.05450
#> 19: 2026-03-20      IDR 19557.30000
#> 20: 2026-03-20      ILS     3.58880
#> 21: 2026-03-20      INR   108.17500
#> 22: 2026-03-20      KRW  1734.17000
#> 23: 2026-03-20      MXN    20.58750
#> 24: 2026-03-20      MYR     4.55210
#> 25: 2026-03-20      NZD     1.97230
#> 26: 2026-03-20      PHP    69.18000
#> 27: 2026-03-20      SGD     1.47930
#> 28: 2026-03-20      THB    37.85400
#> 29: 2026-03-20      ZAR    19.51170
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
