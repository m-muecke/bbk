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
#>  1: 2026-06-18      USD     1.14610
#>  2: 2026-06-18      JPY   184.44000
#>  3: 2026-06-18      CZK    24.18100
#>  4: 2026-06-18      DKK     7.47470
#>  5: 2026-06-18      GBP     0.86638
#>  6: 2026-06-18      HUF   352.80000
#>  7: 2026-06-18      PLN     4.25800
#>  8: 2026-06-18      RON     5.23930
#>  9: 2026-06-18      SEK    10.98450
#> 10: 2026-06-18      CHF     0.92180
#> 11: 2026-06-18      ISK   144.40000
#> 12: 2026-06-18      NOK    11.10500
#> 13: 2026-06-18      TRY    53.23120
#> 14: 2026-06-18      AUD     1.63620
#> 15: 2026-06-18      BRL     5.89890
#> 16: 2026-06-18      CAD     1.61890
#> 17: 2026-06-18      CNY     7.76090
#> 18: 2026-06-18      HKD     8.98270
#> 19: 2026-06-18      IDR 20487.11000
#> 20: 2026-06-18      ILS     3.37340
#> 21: 2026-06-18      INR   108.11550
#> 22: 2026-06-18      KRW  1763.72000
#> 23: 2026-06-18      MXN    19.93230
#> 24: 2026-06-18      MYR     4.71910
#> 25: 2026-06-18      NZD     1.98890
#> 26: 2026-06-18      PHP    69.49200
#> 27: 2026-06-18      SGD     1.47950
#> 28: 2026-06-18      THB    37.58100
#> 29: 2026-06-18      ZAR    18.83110
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
