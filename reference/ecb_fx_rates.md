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
#>  1: 2026-03-13      USD     1.14760
#>  2: 2026-03-13      JPY   182.85000
#>  3: 2026-03-13      CZK    24.43700
#>  4: 2026-03-13      DKK     7.47260
#>  5: 2026-03-13      GBP     0.86503
#>  6: 2026-03-13      HUF   391.48000
#>  7: 2026-03-13      PLN     4.26750
#>  8: 2026-03-13      RON     5.09470
#>  9: 2026-03-13      SEK    10.75450
#> 10: 2026-03-13      CHF     0.90340
#> 11: 2026-03-13      ISK   144.20000
#> 12: 2026-03-13      NOK    11.15900
#> 13: 2026-03-13      TRY    50.71220
#> 14: 2026-03-13      AUD     1.62930
#> 15: 2026-03-13      BRL     6.01720
#> 16: 2026-03-13      CAD     1.57260
#> 17: 2026-03-13      CNY     7.91450
#> 18: 2026-03-13      HKD     8.98270
#> 19: 2026-03-13      IDR 19395.07000
#> 20: 2026-03-13      ILS     3.58830
#> 21: 2026-03-13      INR   106.02050
#> 22: 2026-03-13      KRW  1711.87000
#> 23: 2026-03-13      MXN    20.45170
#> 24: 2026-03-13      MYR     4.51980
#> 25: 2026-03-13      NZD     1.96910
#> 26: 2026-03-13      PHP    68.30100
#> 27: 2026-03-13      SGD     1.46850
#> 28: 2026-03-13      THB    36.95300
#> 29: 2026-03-13      ZAR    19.27540
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
