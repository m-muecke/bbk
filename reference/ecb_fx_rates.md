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
#>  1: 2026-10-08      USD     1.11860
#>  2: 2026-10-08      JPY   177.05000
#>  3: 2026-10-08      CZK    24.40300
#>  4: 2026-10-08      DKK     7.47390
#>  5: 2026-10-08      GBP     0.84698
#>  6: 2026-10-08      HUF   366.25000
#>  7: 2026-10-08      PLN     4.37530
#>  8: 2026-10-08      RON     5.34340
#>  9: 2026-10-08      SEK    11.19400
#> 10: 2026-10-08      CHF     0.93260
#> 11: 2026-10-08      ISK   137.00000
#> 12: 2026-10-08      NOK    10.71700
#> 13: 2026-10-08      TRY    55.05230
#> 14: 2026-10-08      AUD     1.61100
#> 15: 2026-10-08      BRL     5.61180
#> 16: 2026-10-08      CAD     1.59530
#> 17: 2026-10-08      CNY     7.49720
#> 18: 2026-10-08      HKD     8.77830
#> 19: 2026-10-08      IDR 20045.31000
#> 20: 2026-10-08      ILS     3.44230
#> 21: 2026-10-08      INR   108.26350
#> 22: 2026-10-08      KRW  1502.79000
#> 23: 2026-10-08      MXN    20.14860
#> 24: 2026-10-08      MYR     4.57680
#> 25: 2026-10-08      NZD     2.00140
#> 26: 2026-10-08      PHP    70.47500
#> 27: 2026-10-08      SGD     1.43400
#> 28: 2026-10-08      THB    37.68000
#> 29: 2026-10-08      ZAR    18.62520
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
