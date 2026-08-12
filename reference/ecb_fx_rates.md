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
#>  1: 2026-08-12      USD     1.15450
#>  2: 2026-08-12      JPY   183.67000
#>  3: 2026-08-12      CZK    24.25400
#>  4: 2026-08-12      DKK     7.47580
#>  5: 2026-08-12      GBP     0.85358
#>  6: 2026-08-12      HUF   364.10000
#>  7: 2026-08-12      PLN     4.30430
#>  8: 2026-08-12      RON     5.24030
#>  9: 2026-08-12      SEK    10.99650
#> 10: 2026-08-12      CHF     0.93660
#> 11: 2026-08-12      ISK   141.80000
#> 12: 2026-08-12      NOK    10.93600
#> 13: 2026-08-12      TRY    55.13630
#> 14: 2026-08-12      AUD     1.63270
#> 15: 2026-08-12      BRL     5.95230
#> 16: 2026-08-12      CAD     1.60770
#> 17: 2026-08-12      CNY     7.78500
#> 18: 2026-08-12      HKD     9.05940
#> 19: 2026-08-12      IDR 20599.86000
#> 20: 2026-08-12      ILS     3.45140
#> 21: 2026-08-12      INR   110.06900
#> 22: 2026-08-12      KRW  1636.08000
#> 23: 2026-08-12      MXN    19.69740
#> 24: 2026-08-12      MYR     4.71670
#> 25: 2026-08-12      NZD     1.96750
#> 26: 2026-08-12      PHP    70.68100
#> 27: 2026-08-12      SGD     1.47660
#> 28: 2026-08-12      THB    38.16800
#> 29: 2026-08-12      ZAR    18.62700
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
