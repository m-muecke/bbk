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
#>  1: 2026-04-17      USD     1.17970
#>  2: 2026-04-17      JPY   187.72000
#>  3: 2026-04-17      CZK    24.31700
#>  4: 2026-04-17      DKK     7.47340
#>  5: 2026-04-17      GBP     0.87168
#>  6: 2026-04-17      HUF   362.70000
#>  7: 2026-04-17      PLN     4.23280
#>  8: 2026-04-17      RON     5.09890
#>  9: 2026-04-17      SEK    10.80300
#> 10: 2026-04-17      CHF     0.92310
#> 11: 2026-04-17      ISK   144.00000
#> 12: 2026-04-17      NOK    11.01700
#> 13: 2026-04-17      TRY    52.92720
#> 14: 2026-04-17      AUD     1.64380
#> 15: 2026-04-17      BRL     5.87070
#> 16: 2026-04-17      CAD     1.61290
#> 17: 2026-04-17      CNY     8.04830
#> 18: 2026-04-17      HKD     9.23820
#> 19: 2026-04-17      IDR 20267.48000
#> 20: 2026-04-17      ILS     3.52620
#> 21: 2026-04-17      INR   109.50250
#> 22: 2026-04-17      KRW  1744.76000
#> 23: 2026-04-17      MXN    20.31440
#> 24: 2026-04-17      MYR     4.66280
#> 25: 2026-04-17      NZD     2.00320
#> 26: 2026-04-17      PHP    70.86500
#> 27: 2026-04-17      SGD     1.50090
#> 28: 2026-04-17      THB    37.83900
#> 29: 2026-04-17      ZAR    19.32930
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
