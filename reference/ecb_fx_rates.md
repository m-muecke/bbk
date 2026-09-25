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
#>  1: 2026-09-24      USD     1.13670
#>  2: 2026-09-24      JPY   180.57000
#>  3: 2026-09-24      CZK    24.39900
#>  4: 2026-09-24      DKK     7.47560
#>  5: 2026-09-24      GBP     0.85986
#>  6: 2026-09-24      HUF   366.15000
#>  7: 2026-09-24      PLN     4.38230
#>  8: 2026-09-24      RON     5.27790
#>  9: 2026-09-24      SEK    11.26450
#> 10: 2026-09-24      CHF     0.94090
#> 11: 2026-09-24      ISK   138.00000
#> 12: 2026-09-24      NOK    10.78950
#> 13: 2026-09-24      TRY    55.53320
#> 14: 2026-09-24      AUD     1.61770
#> 15: 2026-09-24      BRL     5.88900
#> 16: 2026-09-24      CAD     1.60470
#> 17: 2026-09-24      CNY     7.63020
#> 18: 2026-09-24      HKD     8.91480
#> 19: 2026-09-24      IDR 20384.10000
#> 20: 2026-09-24      ILS     3.46490
#> 21: 2026-09-24      INR   109.07750
#> 22: 2026-09-24      KRW  1555.69000
#> 23: 2026-09-24      MXN    19.98780
#> 24: 2026-09-24      MYR     4.64570
#> 25: 2026-09-24      NZD     2.00490
#> 26: 2026-09-24      PHP    71.32800
#> 27: 2026-09-24      SGD     1.45490
#> 28: 2026-09-24      THB    38.05700
#> 29: 2026-09-24      ZAR    18.68360
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
