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
#>  1: 2026-10-21      USD     1.12340
#>  2: 2026-10-21      JPY   177.36000
#>  3: 2026-10-21      CZK    24.26200
#>  4: 2026-10-21      DKK     7.47460
#>  5: 2026-10-21      GBP     0.83825
#>  6: 2026-10-21      HUF   365.00000
#>  7: 2026-10-21      PLN     4.36350
#>  8: 2026-10-21      RON     5.33650
#>  9: 2026-10-21      SEK    11.09750
#> 10: 2026-10-21      CHF     0.92560
#> 11: 2026-10-21      ISK   136.20000
#> 12: 2026-10-21      NOK    10.51200
#> 13: 2026-10-21      TRY    55.72330
#> 14: 2026-10-21      AUD     1.59710
#> 15: 2026-10-21      BRL     5.64320
#> 16: 2026-10-21      CAD     1.57790
#> 17: 2026-10-21      CNY     7.49990
#> 18: 2026-10-21      HKD     8.81550
#> 19: 2026-10-21      IDR 20269.17000
#> 20: 2026-10-21      ILS     3.47260
#> 21: 2026-10-21      INR   106.12650
#> 22: 2026-10-21      KRW  1489.15000
#> 23: 2026-10-21      MXN    20.76320
#> 24: 2026-10-21      MYR     4.58430
#> 25: 2026-10-21      NZD     1.97350
#> 26: 2026-10-21      PHP    71.12100
#> 27: 2026-10-21      SGD     1.43480
#> 28: 2026-10-21      THB    37.71800
#> 29: 2026-10-21      ZAR    18.39300
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
