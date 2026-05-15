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
#>  1: 2026-05-14      USD     1.17020
#>  2: 2026-05-14      JPY   184.83000
#>  3: 2026-05-14      CZK    24.30200
#>  4: 2026-05-14      DKK     7.47290
#>  5: 2026-05-14      GBP     0.86618
#>  6: 2026-05-14      HUF   357.43000
#>  7: 2026-05-14      PLN     4.23780
#>  8: 2026-05-14      RON     5.20540
#>  9: 2026-05-14      SEK    10.91450
#> 10: 2026-05-14      CHF     0.91500
#> 11: 2026-05-14      ISK   143.60000
#> 12: 2026-05-14      NOK    10.79800
#> 13: 2026-05-14      TRY    53.16770
#> 14: 2026-05-14      AUD     1.61620
#> 15: 2026-05-14      BRL     5.84750
#> 16: 2026-05-14      CAD     1.60600
#> 17: 2026-05-14      CNY     7.94000
#> 18: 2026-05-14      HKD     9.16620
#> 19: 2026-05-14      IDR 20437.54000
#> 20: 2026-05-14      ILS     3.39980
#> 21: 2026-05-14      INR   112.06750
#> 22: 2026-05-14      KRW  1745.62000
#> 23: 2026-05-14      MXN    20.12550
#> 24: 2026-05-14      MYR     4.60060
#> 25: 2026-05-14      NZD     1.97340
#> 26: 2026-05-14      PHP    71.99800
#> 27: 2026-05-14      SGD     1.49010
#> 28: 2026-05-14      THB    37.81500
#> 29: 2026-05-14      ZAR    19.19940
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
