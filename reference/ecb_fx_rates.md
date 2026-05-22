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
#>  1: 2026-05-22      USD     1.15950
#>  2: 2026-05-22      JPY   184.53000
#>  3: 2026-05-22      CZK    24.28900
#>  4: 2026-05-22      DKK     7.47310
#>  5: 2026-05-22      GBP     0.86418
#>  6: 2026-05-22      HUF   359.08000
#>  7: 2026-05-22      PLN     4.24200
#>  8: 2026-05-22      RON     5.24900
#>  9: 2026-05-22      SEK    10.86950
#> 10: 2026-05-22      CHF     0.91190
#> 11: 2026-05-22      ISK   143.60000
#> 12: 2026-05-22      NOK    10.72950
#> 13: 2026-05-22      TRY    53.00670
#> 14: 2026-05-22      AUD     1.62830
#> 15: 2026-05-22      BRL     5.81650
#> 16: 2026-05-22      CAD     1.60020
#> 17: 2026-05-22      CNY     7.87910
#> 18: 2026-05-22      HKD     9.08650
#> 19: 2026-05-22      IDR 20516.54000
#> 20: 2026-05-22      ILS     3.35690
#> 21: 2026-05-22      INR   110.95850
#> 22: 2026-05-22      KRW  1759.60000
#> 23: 2026-05-22      MXN    20.10450
#> 24: 2026-05-22      MYR     4.60090
#> 25: 2026-05-22      NZD     1.98170
#> 26: 2026-05-22      PHP    71.45000
#> 27: 2026-05-22      SGD     1.48460
#> 28: 2026-05-22      THB    37.87500
#> 29: 2026-05-22      ZAR    19.10450
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
