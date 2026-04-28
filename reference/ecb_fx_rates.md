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
#>  1: 2026-04-28      USD     1.16800
#>  2: 2026-04-28      JPY   186.58000
#>  3: 2026-04-28      CZK    24.37200
#>  4: 2026-04-28      DKK     7.47230
#>  5: 2026-04-28      GBP     0.86715
#>  6: 2026-04-28      HUF   365.30000
#>  7: 2026-04-28      PLN     4.24780
#>  8: 2026-04-28      RON     5.09330
#>  9: 2026-04-28      SEK    10.84850
#> 10: 2026-04-28      CHF     0.92380
#> 11: 2026-04-28      ISK   143.20000
#> 12: 2026-04-28      NOK    10.88750
#> 13: 2026-04-28      TRY    52.62390
#> 14: 2026-04-28      AUD     1.63270
#> 15: 2026-04-28      BRL     5.84200
#> 16: 2026-04-28      CAD     1.59740
#> 17: 2026-04-28      CNY     7.98770
#> 18: 2026-04-28      HKD     9.15270
#> 19: 2026-04-28      IDR 20188.41000
#> 20: 2026-04-28      ILS     3.49190
#> 21: 2026-04-28      INR   110.42600
#> 22: 2026-04-28      KRW  1725.01000
#> 23: 2026-04-28      MXN    20.38930
#> 24: 2026-04-28      MYR     4.61590
#> 25: 2026-04-28      NZD     1.99050
#> 26: 2026-04-28      PHP    71.58000
#> 27: 2026-04-28      SGD     1.49300
#> 28: 2026-04-28      THB    38.02400
#> 29: 2026-04-28      ZAR    19.42890
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
