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
#>  1: 2026-08-28      USD     1.1643
#>  2: 2026-08-28      JPY   185.9200
#>  3: 2026-08-28      CZK    24.1480
#>  4: 2026-08-28      DKK     7.4748
#>  5: 2026-08-28      GBP     0.8572
#>  6: 2026-08-28      HUF   364.7900
#>  7: 2026-08-28      PLN     4.3365
#>  8: 2026-08-28      RON     5.2584
#>  9: 2026-08-28      SEK    11.0885
#> 10: 2026-08-28      CHF     0.9364
#> 11: 2026-08-28      ISK   140.8000
#> 12: 2026-08-28      NOK    10.8595
#> 13: 2026-08-28      TRY    56.1718
#> 14: 2026-08-28      AUD     1.6183
#> 15: 2026-08-28      BRL     6.0126
#> 16: 2026-08-28      CAD     1.6130
#> 17: 2026-08-28      CNY     7.8251
#> 18: 2026-08-28      HKD     9.1276
#> 19: 2026-08-28      IDR 20628.0800
#> 20: 2026-08-28      ILS     3.4612
#> 21: 2026-08-28      INR   111.0585
#> 22: 2026-08-28      KRW  1600.3900
#> 23: 2026-08-28      MXN    19.7327
#> 24: 2026-08-28      MYR     4.6875
#> 25: 2026-08-28      NZD     1.9585
#> 26: 2026-08-28      PHP    72.4820
#> 27: 2026-08-28      SGD     1.4802
#> 28: 2026-08-28      THB    38.3700
#> 29: 2026-08-28      ZAR    18.6309
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
