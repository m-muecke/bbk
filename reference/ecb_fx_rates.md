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
#>  1: 2026-10-01      USD     1.12980
#>  2: 2026-10-01      JPY   178.49000
#>  3: 2026-10-01      CZK    24.45900
#>  4: 2026-10-01      DKK     7.47580
#>  5: 2026-10-01      GBP     0.85373
#>  6: 2026-10-01      HUF   367.18000
#>  7: 2026-10-01      PLN     4.37350
#>  8: 2026-10-01      RON     5.28300
#>  9: 2026-10-01      SEK    11.33100
#> 10: 2026-10-01      CHF     0.94370
#> 11: 2026-10-01      ISK   137.00000
#> 12: 2026-10-01      NOK    10.87500
#> 13: 2026-10-01      TRY    55.39930
#> 14: 2026-10-01      AUD     1.62550
#> 15: 2026-10-01      BRL     5.86200
#> 16: 2026-10-01      CAD     1.60950
#> 17: 2026-10-01      CNY     7.57480
#> 18: 2026-10-01      HKD     8.86580
#> 19: 2026-10-01      IDR 20274.71000
#> 20: 2026-10-01      ILS     3.47550
#> 21: 2026-10-01      INR   108.83200
#> 22: 2026-10-01      KRW  1537.96000
#> 23: 2026-10-01      MXN    20.52510
#> 24: 2026-10-01      MYR     4.61470
#> 25: 2026-10-01      NZD     2.01210
#> 26: 2026-10-01      PHP    70.95000
#> 27: 2026-10-01      SGD     1.44600
#> 28: 2026-10-01      THB    38.02300
#> 29: 2026-10-01      ZAR    18.69340
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
