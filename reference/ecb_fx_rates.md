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
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
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
#>  1: 2026-01-02      USD     1.1721
#>  2: 2026-01-02      JPY   183.9400
#>  3: 2026-01-02      CZK    24.1770
#>  4: 2026-01-02      DKK     7.4694
#>  5: 2026-01-02      GBP     0.8719
#>  6: 2026-01-02      HUF   383.5800
#>  7: 2026-01-02      PLN     4.2123
#>  8: 2026-01-02      RON     5.0895
#>  9: 2026-01-02      SEK    10.8085
#> 10: 2026-01-02      CHF     0.9296
#> 11: 2026-01-02      ISK   147.4000
#> 12: 2026-01-02      NOK    11.7985
#> 13: 2026-01-02      TRY    50.4332
#> 14: 2026-01-02      AUD     1.7508
#> 15: 2026-01-02      BRL     6.3743
#> 16: 2026-01-02      CAD     1.6097
#> 17: 2026-01-02      CNY     8.1973
#> 18: 2026-01-02      HKD     9.1329
#> 19: 2026-01-02      IDR 19593.0600
#> 20: 2026-01-02      ILS     3.7214
#> 21: 2026-01-02      INR   105.7190
#> 22: 2026-01-02      KRW  1693.5300
#> 23: 2026-01-02      MXN    21.0274
#> 24: 2026-01-02      MYR     4.7517
#> 25: 2026-01-02      NZD     2.0317
#> 26: 2026-01-02      PHP    68.9750
#> 27: 2026-01-02      SGD     1.5077
#> 28: 2026-01-02      THB    36.7920
#> 29: 2026-01-02      ZAR    19.3561
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
