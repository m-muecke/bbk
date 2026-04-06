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
#>  1: 2026-04-02      USD     1.15250
#>  2: 2026-04-02      JPY   183.94000
#>  3: 2026-04-02      CZK    24.54000
#>  4: 2026-04-02      DKK     7.47220
#>  5: 2026-04-02      GBP     0.87253
#>  6: 2026-04-02      HUF   383.93000
#>  7: 2026-04-02      PLN     4.28550
#>  8: 2026-04-02      RON     5.09830
#>  9: 2026-04-02      SEK    10.94800
#> 10: 2026-04-02      CHF     0.92130
#> 11: 2026-04-02      ISK   144.40000
#> 12: 2026-04-02      NOK    11.22850
#> 13: 2026-04-02      TRY    51.27950
#> 14: 2026-04-02      AUD     1.67710
#> 15: 2026-04-02      BRL     5.97200
#> 16: 2026-04-02      CAD     1.60300
#> 17: 2026-04-02      CNY     7.94950
#> 18: 2026-04-02      HKD     9.03250
#> 19: 2026-04-02      IDR 19604.77000
#> 20: 2026-04-02      ILS     3.63420
#> 21: 2026-04-02      INR   107.30000
#> 22: 2026-04-02      KRW  1747.94000
#> 23: 2026-04-02      MXN    20.67490
#> 24: 2026-04-02      MYR     4.65490
#> 25: 2026-04-02      NZD     2.01910
#> 26: 2026-04-02      PHP    69.86000
#> 27: 2026-04-02      SGD     1.48340
#> 28: 2026-04-02      THB    37.76200
#> 29: 2026-04-02      ZAR    19.60610
#>           date currency        rate
#>         <Date>   <char>       <num>
# }
```
