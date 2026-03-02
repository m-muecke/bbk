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
#>  1: 2026-03-02      USD     1.1698
#>  2: 2026-03-02      JPY   184.1900
#>  3: 2026-03-02      CZK    24.2740
#>  4: 2026-03-02      DKK     7.4712
#>  5: 2026-03-02      GBP     0.8739
#>  6: 2026-03-02      HUF   381.7000
#>  7: 2026-03-02      PLN     4.2440
#>  8: 2026-03-02      RON     5.0976
#>  9: 2026-03-02      SEK    10.7080
#> 10: 2026-03-02      CHF     0.9117
#> 11: 2026-03-02      ISK   143.9000
#> 12: 2026-03-02      NOK    11.1910
#> 13: 2026-03-02      TRY    51.4229
#> 14: 2026-03-02      AUD     1.6579
#> 15: 2026-03-02      BRL     6.0908
#> 16: 2026-03-02      CAD     1.5991
#> 17: 2026-03-02      CNY     8.0512
#> 18: 2026-03-02      HKD     9.1509
#> 19: 2026-03-02      IDR 19742.3600
#> 20: 2026-03-02      ILS     3.6066
#> 21: 2026-03-02      INR   107.3170
#> 22: 2026-03-02      KRW  1710.3800
#> 23: 2026-03-02      MXN    20.2947
#> 24: 2026-03-02      MYR     4.5938
#> 25: 2026-03-02      NZD     1.9709
#> 26: 2026-03-02      PHP    68.1350
#> 27: 2026-03-02      SGD     1.4900
#> 28: 2026-03-02      THB    36.8600
#> 29: 2026-03-02      ZAR    18.9055
#>           date currency       rate
#>         <Date>   <char>      <num>
# }
```
