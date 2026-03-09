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
#>  1: 2026-03-06      USD     1.15610
#>  2: 2026-03-06      JPY   182.57000
#>  3: 2026-03-06      CZK    24.41900
#>  4: 2026-03-06      DKK     7.47080
#>  5: 2026-03-06      GBP     0.86693
#>  6: 2026-03-06      HUF   393.40000
#>  7: 2026-03-06      PLN     4.28750
#>  8: 2026-03-06      RON     5.09510
#>  9: 2026-03-06      SEK    10.69300
#> 10: 2026-03-06      CHF     0.90450
#> 11: 2026-03-06      ISK   144.90000
#> 12: 2026-03-06      NOK    11.17250
#> 13: 2026-03-06      TRY    50.95390
#> 14: 2026-03-06      AUD     1.65010
#> 15: 2026-03-06      BRL     6.10020
#> 16: 2026-03-06      CAD     1.57820
#> 17: 2026-03-06      CNY     7.98250
#> 18: 2026-03-06      HKD     9.04000
#> 19: 2026-03-06      IDR 19623.06000
#> 20: 2026-03-06      ILS     3.57560
#> 21: 2026-03-06      INR   106.17450
#> 22: 2026-03-06      KRW  1717.02000
#> 23: 2026-03-06      MXN    20.56240
#> 24: 2026-03-06      MYR     4.56200
#> 25: 2026-03-06      NZD     1.96870
#> 26: 2026-03-06      PHP    68.52500
#> 27: 2026-03-06      SGD     1.48100
#> 28: 2026-03-06      THB    36.96600
#> 29: 2026-03-06      ZAR    19.32770
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
