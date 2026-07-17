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
#>  1: 2026-07-17      USD     1.14350
#>  2: 2026-07-17      JPY   185.65000
#>  3: 2026-07-17      CZK    24.20500
#>  4: 2026-07-17      DKK     7.47560
#>  5: 2026-07-17      GBP     0.85098
#>  6: 2026-07-17      HUF   363.53000
#>  7: 2026-07-17      PLN     4.34730
#>  8: 2026-07-17      RON     5.24060
#>  9: 2026-07-17      SEK    11.04050
#> 10: 2026-07-17      CHF     0.92280
#> 11: 2026-07-17      ISK   143.40000
#> 12: 2026-07-17      NOK    11.03900
#> 13: 2026-07-17      TRY    53.90700
#> 14: 2026-07-17      AUD     1.63940
#> 15: 2026-07-17      BRL     5.84990
#> 16: 2026-07-17      CAD     1.60350
#> 17: 2026-07-17      CNY     7.75010
#> 18: 2026-07-17      HKD     8.96530
#> 19: 2026-07-17      IDR 20519.71000
#> 20: 2026-07-17      ILS     3.48430
#> 21: 2026-07-17      INR   110.10200
#> 22: 2026-07-17      KRW  1698.46000
#> 23: 2026-07-17      MXN    19.99260
#> 24: 2026-07-17      MYR     4.68260
#> 25: 2026-07-17      NZD     1.96090
#> 26: 2026-07-17      PHP    70.44100
#> 27: 2026-07-17      SGD     1.47650
#> 28: 2026-07-17      THB    38.46200
#> 29: 2026-07-17      ZAR    18.87680
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
