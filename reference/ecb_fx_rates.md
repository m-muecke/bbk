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
#>  1: 2026-06-26      USD     1.14010
#>  2: 2026-06-26      JPY   184.30000
#>  3: 2026-06-26      CZK    24.26600
#>  4: 2026-06-26      DKK     7.47460
#>  5: 2026-06-26      GBP     0.86253
#>  6: 2026-06-26      HUF   354.13000
#>  7: 2026-06-26      PLN     4.28680
#>  8: 2026-06-26      RON     5.24110
#>  9: 2026-06-26      SEK    11.07750
#> 10: 2026-06-26      CHF     0.92180
#> 11: 2026-06-26      ISK   144.00000
#> 12: 2026-06-26      NOK    11.30350
#> 13: 2026-06-26      TRY    53.15730
#> 14: 2026-06-26      AUD     1.65180
#> 15: 2026-06-26      BRL     5.90100
#> 16: 2026-06-26      CAD     1.61690
#> 17: 2026-06-26      CNY     7.75060
#> 18: 2026-06-26      HKD     8.94080
#> 19: 2026-06-26      IDR 20361.16000
#> 20: 2026-06-26      ILS     3.41790
#> 21: 2026-06-26      INR   107.63050
#> 22: 2026-06-26      KRW  1751.73000
#> 23: 2026-06-26      MXN    19.96950
#> 24: 2026-06-26      MYR     4.66020
#> 25: 2026-06-26      NZD     2.01810
#> 26: 2026-06-26      PHP    69.89500
#> 27: 2026-06-26      SGD     1.47550
#> 28: 2026-06-26      THB    38.05100
#> 29: 2026-06-26      ZAR    18.76660
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
