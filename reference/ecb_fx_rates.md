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
#>  1: 2026-10-02      USD     1.12250
#>  2: 2026-10-02      JPY   176.99000
#>  3: 2026-10-02      CZK    24.47000
#>  4: 2026-10-02      DKK     7.47360
#>  5: 2026-10-02      GBP     0.85033
#>  6: 2026-10-02      HUF   369.18000
#>  7: 2026-10-02      PLN     4.37750
#>  8: 2026-10-02      RON     5.34880
#>  9: 2026-10-02      SEK    11.29000
#> 10: 2026-10-02      CHF     0.92790
#> 11: 2026-10-02      ISK   137.00000
#> 12: 2026-10-02      NOK    10.83150
#> 13: 2026-10-02      TRY    55.16500
#> 14: 2026-10-02      AUD     1.61760
#> 15: 2026-10-02      BRL     5.86100
#> 16: 2026-10-02      CAD     1.59840
#> 17: 2026-10-02      CNY     7.52590
#> 18: 2026-10-02      HKD     8.80840
#> 19: 2026-10-02      IDR 20149.32000
#> 20: 2026-10-02      ILS     3.44080
#> 21: 2026-10-02      INR   108.12450
#> 22: 2026-10-02      KRW  1513.44000
#> 23: 2026-10-02      MXN    20.58060
#> 24: 2026-10-02      MYR     4.58490
#> 25: 2026-10-02      NZD     2.00020
#> 26: 2026-10-02      PHP    70.26500
#> 27: 2026-10-02      SGD     1.43660
#> 28: 2026-10-02      THB    37.71000
#> 29: 2026-10-02      ZAR    18.78390
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
