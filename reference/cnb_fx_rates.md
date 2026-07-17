# Fetch Czech National Bank (CNB) exchange rates

Retrieve the central bank exchange rate fixing (Czech koruna against
foreign currencies) from the CNB API.

## Usage

``` r
cnb_fx_rates(date = NULL, year = NULL, lang = "EN")
```

## Source

<https://api.cnb.cz/cnbapi/swagger-ui.html>

## Arguments

- date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  The date to query, returning rates for all currencies on that day. If
  `NULL`, the latest available fixing is returned. Mutually exclusive
  with `year`. Default `NULL`.

- year:

  (`NULL` \| `integer(1)`)  
  A calendar year, returning rates for all currencies on every working
  day of that year. Mutually exclusive with `date`. Default `NULL`.

- lang:

  (`character(1)`)  
  Language for the country and currency names, either `"EN"` or `"CZ"`.
  Default `"EN"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested exchange rates. The `rate` is the amount of Czech
koruna per `amount` units of the foreign currency.

## See also

Other data:
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_fx_rates()`](https://m-muecke.github.io/bbk/reference/bcb_fx_rates.md),
[`bcb_inflation()`](https://m-muecke.github.io/bbk/reference/bcb_inflation.md),
[`bcb_selic()`](https://m-muecke.github.io/bbk/reference/bcb_selic.md),
[`bcb_top5()`](https://m-muecke.github.io/bbk/reference/bcb_top5.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_czeonia()`](https://m-muecke.github.io/bbk/reference/cnb_czeonia.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nbp_fx_rates()`](https://m-muecke.github.io/bbk/reference/nbp_fx_rates.md),
[`nbp_gold()`](https://m-muecke.github.io/bbk/reference/nbp_gold.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
# latest fixing for all currencies
cnb_fx_rates()
#>           date currency_code   currency        country amount   rate
#>         <Date>        <char>     <char>         <char>  <int>  <num>
#>  1: 2026-07-17           AUD     dollar      Australia      1 14.765
#>  2: 2026-07-17           BRL       real         Brazil      1  4.139
#>  3: 2026-07-17           CAD     dollar         Canada      1 15.095
#>  4: 2026-07-17           CNY   renminbi          China      1  3.124
#>  5: 2026-07-17           DKK      krone        Denmark      1  3.238
#>  6: 2026-07-17           EUR       euro            EMU      1 24.205
#>  7: 2026-07-17           HKD     dollar       Hongkong      1  2.700
#>  8: 2026-07-17           HUF     forint        Hungary    100  6.662
#>  9: 2026-07-17           ISK      krona        Iceland    100 16.879
#> 10: 2026-07-17           XDR        SDR            IMF      1 28.815
#> 11: 2026-07-17           INR      rupee          India    100 21.988
#> 12: 2026-07-17           IDR     rupiah      Indonesia   1000  1.183
#> 13: 2026-07-17           ILS new shekel         Israel      1  6.950
#> 14: 2026-07-17           JPY        yen          Japan    100 13.039
#> 15: 2026-07-17           MYR    ringgit       Malaysia      1  5.170
#> 16: 2026-07-17           MXN       peso         Mexico      1  1.211
#> 17: 2026-07-17           NZD     dollar    New Zealand      1 12.344
#> 18: 2026-07-17           NOK      krone         Norway      1  2.193
#> 19: 2026-07-17           PHP       peso    Philippines    100 34.366
#> 20: 2026-07-17           PLN      zloty         Poland      1  5.568
#> 21: 2026-07-17           RON        leu        Romania      1  4.619
#> 22: 2026-07-17           SGD     dollar      Singapore      1 16.395
#> 23: 2026-07-17           ZAR       rand   South Africa      1  1.282
#> 24: 2026-07-17           KRW        won    South Korea    100  1.425
#> 25: 2026-07-17           SEK      krona         Sweden      1  2.192
#> 26: 2026-07-17           CHF      franc    Switzerland      1 26.233
#> 27: 2026-07-17           THB       baht       Thailand    100 62.942
#> 28: 2026-07-17           TRY       lira         Turkey    100 45.019
#> 29: 2026-07-17           GBP      pound United Kingdom      1 28.449
#> 30: 2026-07-17           USD     dollar            USA      1 21.171
#>           date currency_code   currency        country amount   rate
#>         <Date>        <char>     <char>         <char>  <int>  <num>

# all fixings for a given year
cnb_fx_rates(year = 2024L)
#>             date currency_code amount   rate
#>           <Date>        <char>  <int>  <num>
#>    1: 2024-01-02           AUD      1 15.278
#>    2: 2024-01-02           BGN      1 12.621
#>    3: 2024-01-02           BRL      1  4.609
#>    4: 2024-01-02           CAD      1 16.938
#>    5: 2024-01-02           CHF      1 26.524
#>   ---                                       
#> 7808: 2024-12-31           THB    100 70.618
#> 7809: 2024-12-31           TRY    100 68.539
#> 7810: 2024-12-31           USD      1 24.237
#> 7811: 2024-12-31           XDR      1 31.609
#> 7812: 2024-12-31           ZAR      1  1.284
# }
```
