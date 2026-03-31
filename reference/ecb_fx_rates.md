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
#>  1: 2026-03-30      USD     1.14840
#>  2: 2026-03-30      JPY   183.12000
#>  3: 2026-03-30      CZK    24.55500
#>  4: 2026-03-30      DKK     7.47270
#>  5: 2026-03-30      GBP     0.86803
#>  6: 2026-03-30      HUF   389.53000
#>  7: 2026-03-30      PLN     4.28830
#>  8: 2026-03-30      RON     5.09760
#>  9: 2026-03-30      SEK    10.90600
#> 10: 2026-03-30      CHF     0.91870
#> 11: 2026-03-30      ISK   143.40000
#> 12: 2026-03-30      NOK    11.19800
#> 13: 2026-03-30      TRY    51.05280
#> 14: 2026-03-30      AUD     1.67400
#> 15: 2026-03-30      BRL     6.01790
#> 16: 2026-03-30      CAD     1.59870
#> 17: 2026-03-30      CNY     7.93700
#> 18: 2026-03-30      HKD     8.99690
#> 19: 2026-03-30      IDR 19542.90000
#> 20: 2026-03-30      ILS     3.62780
#> 21: 2026-03-30      INR   108.76860
#> 22: 2026-03-30      KRW  1742.93000
#> 23: 2026-03-30      MXN    20.77840
#> 24: 2026-03-30      MYR     4.62580
#> 25: 2026-03-30      NZD     2.00680
#> 26: 2026-03-30      PHP    69.71800
#> 27: 2026-03-30      SGD     1.48120
#> 28: 2026-03-30      THB    37.73100
#> 29: 2026-03-30      ZAR    19.73470
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
