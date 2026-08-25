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
#>           date currency       rate
#>         <Date>   <char>      <num>
#>  1: 2026-08-25      USD     1.1662
#>  2: 2026-08-25      JPY   185.7000
#>  3: 2026-08-25      CZK    24.0990
#>  4: 2026-08-25      DKK     7.4753
#>  5: 2026-08-25      GBP     0.8555
#>  6: 2026-08-25      HUF   362.2800
#>  7: 2026-08-25      PLN     4.3055
#>  8: 2026-08-25      RON     5.2537
#>  9: 2026-08-25      SEK    11.0668
#> 10: 2026-08-25      CHF     0.9361
#> 11: 2026-08-25      ISK   141.4000
#> 12: 2026-08-25      NOK    10.8920
#> 13: 2026-08-25      TRY    56.0935
#> 14: 2026-08-25      AUD     1.6303
#> 15: 2026-08-25      BRL     6.0153
#> 16: 2026-08-25      CAD     1.6163
#> 17: 2026-08-25      CNY     7.8366
#> 18: 2026-08-25      HKD     9.1407
#> 19: 2026-08-25      IDR 20623.2000
#> 20: 2026-08-25      ILS     3.4781
#> 21: 2026-08-25      INR   111.2760
#> 22: 2026-08-25      KRW  1612.9400
#> 23: 2026-08-25      MXN    19.7632
#> 24: 2026-08-25      MYR     4.7196
#> 25: 2026-08-25      NZD     1.9547
#> 26: 2026-08-25      PHP    71.9740
#> 27: 2026-08-25      SGD     1.4814
#> 28: 2026-08-25      THB    38.1760
#> 29: 2026-08-25      ZAR    18.6450
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
