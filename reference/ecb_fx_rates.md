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
#>  1: 2026-11-06      USD     1.11650
#>  2: 2026-11-06      JPY   176.77000
#>  3: 2026-11-06      CZK    24.35000
#>  4: 2026-11-06      DKK     7.47520
#>  5: 2026-11-06      GBP     0.83415
#>  6: 2026-11-06      HUF   363.90000
#>  7: 2026-11-06      PLN     4.39250
#>  8: 2026-11-06      RON     5.34030
#>  9: 2026-11-06      SEK    11.02600
#> 10: 2026-11-06      CHF     0.91430
#> 11: 2026-11-06      ISK   136.80000
#> 12: 2026-11-06      NOK    10.52600
#> 13: 2026-11-06      TRY    55.99570
#> 14: 2026-11-06      AUD     1.62500
#> 15: 2026-11-06      BRL     6.14490
#> 16: 2026-11-06      CAD     1.57050
#> 17: 2026-11-06      CNY     7.44850
#> 18: 2026-11-06      HKD     8.75050
#> 19: 2026-11-06      IDR 20208.93000
#> 20: 2026-11-06      ILS     3.57170
#> 21: 2026-11-06      INR   104.86450
#> 22: 2026-11-06      KRW  1517.02000
#> 23: 2026-11-06      MXN    20.88280
#> 24: 2026-11-06      MYR     4.53190
#> 25: 2026-11-06      NZD     2.01410
#> 26: 2026-11-06      PHP    70.35800
#> 27: 2026-11-06      SGD     1.43090
#> 28: 2026-11-06      THB    37.45900
#> 29: 2026-11-06      ZAR    18.46490
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
