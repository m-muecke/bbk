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
#>  1: 2026-10-20      USD     1.12150
#>  2: 2026-10-20      JPY   177.34000
#>  3: 2026-10-20      CZK    24.32900
#>  4: 2026-10-20      DKK     7.47460
#>  5: 2026-10-20      GBP     0.84028
#>  6: 2026-10-20      HUF   364.68000
#>  7: 2026-10-20      PLN     4.37680
#>  8: 2026-10-20      RON     5.33080
#>  9: 2026-10-20      SEK    11.12300
#> 10: 2026-10-20      CHF     0.92370
#> 11: 2026-10-20      ISK   136.20000
#> 12: 2026-10-20      NOK    10.52450
#> 13: 2026-10-20      TRY    55.60090
#> 14: 2026-10-20      AUD     1.60560
#> 15: 2026-10-20      BRL     5.63390
#> 16: 2026-10-20      CAD     1.57580
#> 17: 2026-10-20      CNY     7.48940
#> 18: 2026-10-20      HKD     8.80230
#> 19: 2026-10-20      IDR 20170.57000
#> 20: 2026-10-20      ILS     3.48530
#> 21: 2026-10-20      INR   106.45900
#> 22: 2026-10-20      KRW  1489.17000
#> 23: 2026-10-20      MXN    20.77190
#> 24: 2026-10-20      MYR     4.57880
#> 25: 2026-10-20      NZD     1.97480
#> 26: 2026-10-20      PHP    70.80400
#> 27: 2026-10-20      SGD     1.43380
#> 28: 2026-10-20      THB    37.73800
#> 29: 2026-10-20      ZAR    18.47690
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
