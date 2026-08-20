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
#>  1: 2026-08-20      USD     1.16810
#>  2: 2026-08-20      JPY   185.45000
#>  3: 2026-08-20      CZK    24.15300
#>  4: 2026-08-20      DKK     7.47580
#>  5: 2026-08-20      GBP     0.85725
#>  6: 2026-08-20      HUF   365.10000
#>  7: 2026-08-20      PLN     4.31880
#>  8: 2026-08-20      RON     5.25150
#>  9: 2026-08-20      SEK    11.08750
#> 10: 2026-08-20      CHF     0.93330
#> 11: 2026-08-20      ISK   142.00000
#> 12: 2026-08-20      NOK    10.90250
#> 13: 2026-08-20      TRY    56.01450
#> 14: 2026-08-20      AUD     1.64380
#> 15: 2026-08-20      BRL     6.06660
#> 16: 2026-08-20      CAD     1.60850
#> 17: 2026-08-20      CNY     7.85380
#> 18: 2026-08-20      HKD     9.16240
#> 19: 2026-08-20      IDR 20788.62000
#> 20: 2026-08-20      ILS     3.49500
#> 21: 2026-08-20      INR   111.79850
#> 22: 2026-08-20      KRW  1631.08000
#> 23: 2026-08-20      MXN    19.84670
#> 24: 2026-08-20      MYR     4.72380
#> 25: 2026-08-20      NZD     1.96570
#> 26: 2026-08-20      PHP    72.10400
#> 27: 2026-08-20      SGD     1.48600
#> 28: 2026-08-20      THB    38.44800
#> 29: 2026-08-20      ZAR    18.89290
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
