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
#>  1: 2026-06-10      USD     1.15390
#>  2: 2026-06-10      JPY   185.19000
#>  3: 2026-06-10      CZK    24.19300
#>  4: 2026-06-10      DKK     7.47450
#>  5: 2026-06-10      GBP     0.86228
#>  6: 2026-06-10      HUF   356.58000
#>  7: 2026-06-10      PLN     4.24900
#>  8: 2026-06-10      RON     5.23710
#>  9: 2026-06-10      SEK    10.96550
#> 10: 2026-06-10      CHF     0.92220
#> 11: 2026-06-10      ISK   143.40000
#> 12: 2026-06-10      NOK    10.95200
#> 13: 2026-06-10      TRY    53.23840
#> 14: 2026-06-10      AUD     1.64750
#> 15: 2026-06-10      BRL     5.98960
#> 16: 2026-06-10      CAD     1.60730
#> 17: 2026-06-10      CNY     7.82430
#> 18: 2026-06-10      HKD     9.04260
#> 19: 2026-06-10      IDR 20666.12000
#> 20: 2026-06-10      ILS     3.43680
#> 21: 2026-06-10      INR   109.92750
#> 22: 2026-06-10      KRW  1759.12000
#> 23: 2026-06-10      MXN    20.16880
#> 24: 2026-06-10      MYR     4.69640
#> 25: 2026-06-10      NZD     1.98790
#> 26: 2026-06-10      PHP    70.83200
#> 27: 2026-06-10      SGD     1.48660
#> 28: 2026-06-10      THB    38.02700
#> 29: 2026-06-10      ZAR    19.15680
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
