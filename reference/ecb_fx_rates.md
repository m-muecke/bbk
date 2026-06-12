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
#>  1: 2026-06-12      USD     1.15670
#>  2: 2026-06-12      JPY   185.30000
#>  3: 2026-06-12      CZK    24.17100
#>  4: 2026-06-12      DKK     7.47440
#>  5: 2026-06-12      GBP     0.86305
#>  6: 2026-06-12      HUF   352.88000
#>  7: 2026-06-12      PLN     4.24800
#>  8: 2026-06-12      RON     5.23580
#>  9: 2026-06-12      SEK    10.92800
#> 10: 2026-06-12      CHF     0.92170
#> 11: 2026-06-12      ISK   144.20000
#> 12: 2026-06-12      NOK    11.02550
#> 13: 2026-06-12      TRY    53.51450
#> 14: 2026-06-12      AUD     1.64420
#> 15: 2026-06-12      BRL     5.90760
#> 16: 2026-06-12      CAD     1.61800
#> 17: 2026-06-12      CNY     7.82200
#> 18: 2026-06-12      HKD     9.06330
#> 19: 2026-06-12      IDR 20574.74000
#> 20: 2026-06-12      ILS     3.37840
#> 21: 2026-06-12      INR   110.01950
#> 22: 2026-06-12      KRW  1758.43000
#> 23: 2026-06-12      MXN    19.92340
#> 24: 2026-06-12      MYR     4.69330
#> 25: 2026-06-12      NZD     1.98600
#> 26: 2026-06-12      PHP    70.31500
#> 27: 2026-06-12      SGD     1.48540
#> 28: 2026-06-12      THB    37.87600
#> 29: 2026-06-12      ZAR    18.85710
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
