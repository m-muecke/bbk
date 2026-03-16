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
#>  1: 2026-03-16      USD     1.14780
#>  2: 2026-03-16      JPY   182.66000
#>  3: 2026-03-16      CZK    24.43600
#>  4: 2026-03-16      DKK     7.47200
#>  5: 2026-03-16      GBP     0.86408
#>  6: 2026-03-16      HUF   390.23000
#>  7: 2026-03-16      PLN     4.26830
#>  8: 2026-03-16      RON     5.09470
#>  9: 2026-03-16      SEK    10.76900
#> 10: 2026-03-16      CHF     0.90410
#> 11: 2026-03-16      ISK   143.40000
#> 12: 2026-03-16      NOK    11.14900
#> 13: 2026-03-16      TRY    50.71570
#> 14: 2026-03-16      AUD     1.62720
#> 15: 2026-03-16      BRL     6.04920
#> 16: 2026-03-16      CAD     1.57030
#> 17: 2026-03-16      CNY     7.91540
#> 18: 2026-03-16      HKD     8.98810
#> 19: 2026-03-16      IDR 19472.25000
#> 20: 2026-03-16      ILS     3.58000
#> 21: 2026-03-16      INR   105.88180
#> 22: 2026-03-16      KRW  1711.08000
#> 23: 2026-03-16      MXN    20.43060
#> 24: 2026-03-16      MYR     4.51140
#> 25: 2026-03-16      NZD     1.96470
#> 26: 2026-03-16      PHP    68.57900
#> 27: 2026-03-16      SGD     1.46760
#> 28: 2026-03-16      THB    37.14300
#> 29: 2026-03-16      ZAR    19.24610
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
