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
#>  1: 2026-06-22      USD     1.14560
#>  2: 2026-06-22      JPY   185.33000
#>  3: 2026-06-22      CZK    24.19200
#>  4: 2026-06-22      DKK     7.47470
#>  5: 2026-06-22      GBP     0.86468
#>  6: 2026-06-22      HUF   352.33000
#>  7: 2026-06-22      PLN     4.26800
#>  8: 2026-06-22      RON     5.23880
#>  9: 2026-06-22      SEK    10.99800
#> 10: 2026-06-22      CHF     0.92570
#> 11: 2026-06-22      ISK   144.00000
#> 12: 2026-06-22      NOK    11.07400
#> 13: 2026-06-22      TRY    53.22740
#> 14: 2026-06-22      AUD     1.63460
#> 15: 2026-06-22      BRL     5.90200
#> 16: 2026-06-22      CAD     1.62230
#> 17: 2026-06-22      CNY     7.76120
#> 18: 2026-06-22      HKD     8.98100
#> 19: 2026-06-22      IDR 20434.75000
#> 20: 2026-06-22      ILS     3.40050
#> 21: 2026-06-22      INR   108.47300
#> 22: 2026-06-22      KRW  1760.88000
#> 23: 2026-06-22      MXN    19.85450
#> 24: 2026-06-22      MYR     4.75310
#> 25: 2026-06-22      NZD     1.99910
#> 26: 2026-06-22      PHP    69.92400
#> 27: 2026-06-22      SGD     1.48100
#> 28: 2026-06-22      THB    37.70200
#> 29: 2026-06-22      ZAR    18.80140
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
