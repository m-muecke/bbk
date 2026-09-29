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
#>  1: 2026-09-28      USD     1.13780
#>  2: 2026-09-28      JPY   178.50000
#>  3: 2026-09-28      CZK    24.39700
#>  4: 2026-09-28      DKK     7.47520
#>  5: 2026-09-28      GBP     0.85785
#>  6: 2026-09-28      HUF   367.10000
#>  7: 2026-09-28      PLN     4.37300
#>  8: 2026-09-28      RON     5.27850
#>  9: 2026-09-28      SEK    11.32050
#> 10: 2026-09-28      CHF     0.94640
#> 11: 2026-09-28      ISK   137.00000
#> 12: 2026-09-28      NOK    10.81700
#> 13: 2026-09-28      TRY    55.73180
#> 14: 2026-09-28      AUD     1.61990
#> 15: 2026-09-28      BRL     5.91860
#> 16: 2026-09-28      CAD     1.61180
#> 17: 2026-09-28      CNY     7.63520
#> 18: 2026-09-28      HKD     8.92580
#> 19: 2026-09-28      IDR 20453.78000
#> 20: 2026-09-28      ILS     3.48540
#> 21: 2026-09-28      INR   109.20950
#> 22: 2026-09-28      KRW  1545.05000
#> 23: 2026-09-28      MXN    20.21330
#> 24: 2026-09-28      MYR     4.64560
#> 25: 2026-09-28      NZD     2.00710
#> 26: 2026-09-28      PHP    71.09900
#> 27: 2026-09-28      SGD     1.45380
#> 28: 2026-09-28      THB    38.19600
#> 29: 2026-09-28      ZAR    18.65100
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
