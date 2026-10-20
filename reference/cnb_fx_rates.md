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
  With `year`, the names are taken from the first and last fixings of
  that year. Default `"EN"`.

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
[`boi_data()`](https://m-muecke.github.io/bbk/reference/boi_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_czeonia()`](https://m-muecke.github.io/bbk/reference/cnb_czeonia.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nbb_data()`](https://m-muecke.github.io/bbk/reference/nbb_data.md),
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
#>  1: 2026-10-20           AUD     dollar      Australia      1 15.146
#>  2: 2026-10-20           BRL       real         Brazil      1  4.314
#>  3: 2026-10-20           CAD     dollar         Canada      1 15.427
#>  4: 2026-10-20           CNY   renminbi          China      1  3.247
#>  5: 2026-10-20           DKK      krone        Denmark      1  3.254
#>  6: 2026-10-20           EUR       euro            EMU      1 24.325
#>  7: 2026-10-20           HKD     dollar       Hongkong      1  2.762
#>  8: 2026-10-20           HUF     forint        Hungary    100  6.672
#>  9: 2026-10-20           ISK      krona        Iceland    100 17.860
#> 10: 2026-10-20           XDR        SDR            IMF      1 29.375
#> 11: 2026-10-20           INR      rupee          India    100 22.839
#> 12: 2026-10-20           IDR     rupiah      Indonesia   1000  1.206
#> 13: 2026-10-20           ILS new shekel         Israel      1  6.979
#> 14: 2026-10-20           JPY        yen          Japan    100 13.713
#> 15: 2026-10-20           MYR    ringgit       Malaysia      1  5.310
#> 16: 2026-10-20           MXN       peso         Mexico      1  1.171
#> 17: 2026-10-20           NZD     dollar    New Zealand      1 12.319
#> 18: 2026-10-20           NOK      krone         Norway      1  2.311
#> 19: 2026-10-20           PHP       peso    Philippines    100 34.350
#> 20: 2026-10-20           PLN      zloty         Poland      1  5.558
#> 21: 2026-10-20           RON        leu        Romania      1  4.562
#> 22: 2026-10-20           SGD     dollar      Singapore      1 16.961
#> 23: 2026-10-20           ZAR       rand   South Africa      1  1.317
#> 24: 2026-10-20           KRW        won    South Korea    100  1.633
#> 25: 2026-10-20           SEK      krona         Sweden      1  2.187
#> 26: 2026-10-20           CHF      franc    Switzerland      1 26.336
#> 27: 2026-10-20           THB       baht       Thailand    100 64.450
#> 28: 2026-10-20           TRY       lira         Turkey    100 43.772
#> 29: 2026-10-20           GBP      pound United Kingdom      1 28.945
#> 30: 2026-10-20           USD     dollar            USA      1 21.681
#>           date currency_code   currency        country amount   rate
#>         <Date>        <char>     <char>         <char>  <int>  <num>

# all fixings for a given year
cnb_fx_rates(year = 2024L)
#>             date currency_code currency      country amount   rate
#>           <Date>        <char>   <char>       <char>  <int>  <num>
#>    1: 2024-01-02           AUD   dollar    Australia      1 15.278
#>    2: 2024-01-02           BGN      lev     Bulgaria      1 12.621
#>    3: 2024-01-02           BRL     real       Brazil      1  4.609
#>    4: 2024-01-02           CAD   dollar       Canada      1 16.938
#>    5: 2024-01-02           CHF    franc  Switzerland      1 26.524
#>   ---                                                             
#> 7808: 2024-12-31           THB     baht     Thailand    100 70.618
#> 7809: 2024-12-31           TRY     lira       Turkey    100 68.539
#> 7810: 2024-12-31           USD   dollar          USA      1 24.237
#> 7811: 2024-12-31           XDR      SDR          IMF      1 31.609
#> 7812: 2024-12-31           ZAR     rand South Africa      1  1.284
# }
```
