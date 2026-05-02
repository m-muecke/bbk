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
#>  1: 2026-04-30      USD     1.17020
#>  2: 2026-04-30      JPY   183.21000
#>  3: 2026-04-30      CZK    24.36600
#>  4: 2026-04-30      DKK     7.47160
#>  5: 2026-04-30      GBP     0.86625
#>  6: 2026-04-30      HUF   364.85000
#>  7: 2026-04-30      PLN     4.26050
#>  8: 2026-04-30      RON     5.18230
#>  9: 2026-04-30      SEK    10.85550
#> 10: 2026-04-30      CHF     0.91900
#> 11: 2026-04-30      ISK   144.00000
#> 12: 2026-04-30      NOK    10.91230
#> 13: 2026-04-30      TRY    52.87570
#> 14: 2026-04-30      AUD     1.63710
#> 15: 2026-04-30      BRL     5.82920
#> 16: 2026-04-30      CAD     1.59940
#> 17: 2026-04-30      CNY     7.99100
#> 18: 2026-04-30      HKD     9.16620
#> 19: 2026-04-30      IDR 20297.94000
#> 20: 2026-04-30      ILS     3.45530
#> 21: 2026-04-30      INR   111.06950
#> 22: 2026-04-30      KRW  1728.39000
#> 23: 2026-04-30      MXN    20.49730
#> 24: 2026-04-30      MYR     4.64570
#> 25: 2026-04-30      NZD     1.99570
#> 26: 2026-04-30      PHP    71.91800
#> 27: 2026-04-30      SGD     1.49340
#> 28: 2026-04-30      THB    38.08400
#> 29: 2026-04-30      ZAR    19.64800
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
