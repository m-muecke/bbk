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
#>  1: 2026-06-11      USD     1.1537
#>  2: 2026-06-11      JPY   185.2100
#>  3: 2026-06-11      CZK    24.1920
#>  4: 2026-06-11      DKK     7.4743
#>  5: 2026-06-11      GBP     0.8633
#>  6: 2026-06-11      HUF   355.1000
#>  7: 2026-06-11      PLN     4.2518
#>  8: 2026-06-11      RON     5.2394
#>  9: 2026-06-11      SEK    10.9935
#> 10: 2026-06-11      CHF     0.9221
#> 11: 2026-06-11      ISK   143.8000
#> 12: 2026-06-11      NOK    10.9895
#> 13: 2026-06-11      TRY    53.2486
#> 14: 2026-06-11      AUD     1.6487
#> 15: 2026-06-11      BRL     5.9536
#> 16: 2026-06-11      CAD     1.6127
#> 17: 2026-06-11      CNY     7.8191
#> 18: 2026-06-11      HKD     9.0410
#> 19: 2026-06-11      IDR 20736.6000
#> 20: 2026-06-11      ILS     3.4137
#> 21: 2026-06-11      INR   110.4840
#> 22: 2026-06-11      KRW  1764.6200
#> 23: 2026-06-11      MXN    20.0653
#> 24: 2026-06-11      MYR     4.6921
#> 25: 2026-06-11      NZD     1.9940
#> 26: 2026-06-11      PHP    70.7600
#> 27: 2026-06-11      SGD     1.4857
#> 28: 2026-06-11      THB    38.0140
#> 29: 2026-06-11      ZAR    19.0392
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
