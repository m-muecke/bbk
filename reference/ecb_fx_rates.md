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
#>  1: 2026-03-27      USD     1.1517
#>  2: 2026-03-27      JPY   184.1600
#>  3: 2026-03-27      CZK    24.5420
#>  4: 2026-03-27      DKK     7.4721
#>  5: 2026-03-27      GBP     0.8672
#>  6: 2026-03-27      HUF   389.7300
#>  7: 2026-03-27      PLN     4.2875
#>  8: 2026-03-27      RON     5.0989
#>  9: 2026-03-27      SEK    10.8780
#> 10: 2026-03-27      CHF     0.9178
#> 11: 2026-03-27      ISK   143.6000
#> 12: 2026-03-27      NOK    11.1885
#> 13: 2026-03-27      TRY    51.2001
#> 14: 2026-03-27      AUD     1.6731
#> 15: 2026-03-27      BRL     6.0535
#> 16: 2026-03-27      CAD     1.5974
#> 17: 2026-03-27      CNY     7.9626
#> 18: 2026-03-27      HKD     9.0223
#> 19: 2026-03-27      IDR 19559.0300
#> 20: 2026-03-27      ILS     3.6329
#> 21: 2026-03-27      INR   109.1945
#> 22: 2026-03-27      KRW  1740.7900
#> 23: 2026-03-27      MXN    20.7971
#> 24: 2026-03-27      MYR     4.6218
#> 25: 2026-03-27      NZD     2.0019
#> 26: 2026-03-27      PHP    69.7520
#> 27: 2026-03-27      SGD     1.4831
#> 28: 2026-03-27      THB    37.9490
#> 29: 2026-03-27      ZAR    19.7984
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
