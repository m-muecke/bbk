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
#>  1: 2026-08-18      USD     1.15760
#>  2: 2026-08-18      JPY   184.87000
#>  3: 2026-08-18      CZK    24.17900
#>  4: 2026-08-18      DKK     7.47590
#>  5: 2026-08-18      GBP     0.85585
#>  6: 2026-08-18      HUF   364.30000
#>  7: 2026-08-18      PLN     4.31900
#>  8: 2026-08-18      RON     5.24430
#>  9: 2026-08-18      SEK    11.02600
#> 10: 2026-08-18      CHF     0.94060
#> 11: 2026-08-18      ISK   142.20000
#> 12: 2026-08-18      NOK    10.90250
#> 13: 2026-08-18      TRY    55.46290
#> 14: 2026-08-18      AUD     1.62780
#> 15: 2026-08-18      BRL     6.02810
#> 16: 2026-08-18      CAD     1.60600
#> 17: 2026-08-18      CNY     7.80490
#> 18: 2026-08-18      HKD     9.07990
#> 19: 2026-08-18      IDR 20677.34000
#> 20: 2026-08-18      ILS     3.46350
#> 21: 2026-08-18      INR   110.76730
#> 22: 2026-08-18      KRW  1632.30000
#> 23: 2026-08-18      MXN    19.74110
#> 24: 2026-08-18      MYR     4.69870
#> 25: 2026-08-18      NZD     1.96720
#> 26: 2026-08-18      PHP    71.51700
#> 27: 2026-08-18      SGD     1.47910
#> 28: 2026-08-18      THB    38.27000
#> 29: 2026-08-18      ZAR    18.77580
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
