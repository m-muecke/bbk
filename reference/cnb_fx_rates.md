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
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
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
#>  1: 2026-06-10           AUD     dollar      Australia      1 14.688
#>  2: 2026-06-10           BRL       real         Brazil      1  4.042
#>  3: 2026-06-10           CAD     dollar         Canada      1 15.046
#>  4: 2026-06-10           CNY   renminbi          China      1  3.092
#>  5: 2026-06-10           DKK      krone        Denmark      1  3.237
#>  6: 2026-06-10           EUR       euro            EMU      1 24.195
#>  7: 2026-06-10           HKD     dollar       Hongkong      1  2.675
#>  8: 2026-06-10           HUF     forint        Hungary    100  6.790
#>  9: 2026-06-10           ISK      krona        Iceland    100 16.872
#> 10: 2026-06-10           XDR        SDR            IMF      1 28.620
#> 11: 2026-06-10           INR      rupee          India    100 22.006
#> 12: 2026-06-10           IDR     rupiah      Indonesia   1000  1.168
#> 13: 2026-06-10           ILS new shekel         Israel      1  7.039
#> 14: 2026-06-10           JPY        yen          Japan    100 13.064
#> 15: 2026-06-10           MYR    ringgit       Malaysia      1  5.151
#> 16: 2026-06-10           MXN       peso         Mexico      1  1.200
#> 17: 2026-06-10           NZD     dollar    New Zealand      1 12.175
#> 18: 2026-06-10           NOK      krone         Norway      1  2.209
#> 19: 2026-06-10           PHP       peso    Philippines    100 34.154
#> 20: 2026-06-10           PLN      zloty         Poland      1  5.695
#> 21: 2026-06-10           RON        leu        Romania      1  4.620
#> 22: 2026-06-10           SGD     dollar      Singapore      1 16.275
#> 23: 2026-06-10           ZAR       rand   South Africa      1  1.263
#> 24: 2026-06-10           KRW        won    South Korea    100  1.375
#> 25: 2026-06-10           SEK      krona         Sweden      1  2.207
#> 26: 2026-06-10           CHF      franc    Switzerland      1 26.239
#> 27: 2026-06-10           THB       baht       Thailand    100 63.629
#> 28: 2026-06-10           TRY       lira         Turkey    100 45.441
#> 29: 2026-06-10           GBP      pound United Kingdom      1 28.059
#> 30: 2026-06-10           USD     dollar            USA      1 20.965
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
