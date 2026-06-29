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
#>  1: 2026-06-29      USD     1.14060
#>  2: 2026-06-29      JPY   184.62000
#>  3: 2026-06-29      CZK    24.26200
#>  4: 2026-06-29      DKK     7.47450
#>  5: 2026-06-29      GBP     0.86215
#>  6: 2026-06-29      HUF   354.33000
#>  7: 2026-06-29      PLN     4.28730
#>  8: 2026-06-29      RON     5.24180
#>  9: 2026-06-29      SEK    11.08650
#> 10: 2026-06-29      CHF     0.92220
#> 11: 2026-06-29      ISK   144.00000
#> 12: 2026-06-29      NOK    11.32950
#> 13: 2026-06-29      TRY    53.20010
#> 14: 2026-06-29      AUD     1.65310
#> 15: 2026-06-29      BRL     5.88990
#> 16: 2026-06-29      CAD     1.62010
#> 17: 2026-06-29      CNY     7.74920
#> 18: 2026-06-29      HKD     8.94490
#> 19: 2026-06-29      IDR 20362.79000
#> 20: 2026-06-29      ILS     3.39420
#> 21: 2026-06-29      INR   107.83800
#> 22: 2026-06-29      KRW  1760.80000
#> 23: 2026-06-29      MXN    19.93240
#> 24: 2026-06-29      MYR     4.64340
#> 25: 2026-06-29      NZD     2.01750
#> 26: 2026-06-29      PHP    69.78600
#> 27: 2026-06-29      SGD     1.47540
#> 28: 2026-06-29      THB    37.91900
#> 29: 2026-06-29      ZAR    18.72330
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
