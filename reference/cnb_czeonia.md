# Fetch Czech National Bank (CNB) CZEONIA rates

Retrieve the Czech Overnight Index Average (CZEONIA) reference rate from
the CNB API.

## Usage

``` r
cnb_czeonia(date = NULL, year = NULL)
```

## Source

<https://api.cnb.cz/cnbapi/swagger-ui.html>

## Arguments

- date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  The date to query. If `NULL`, the latest available rates are returned.
  Mutually exclusive with `year`. Default `NULL`.

- year:

  (`NULL` \| `integer(1)`)  
  A calendar year, returning rates for every working day of that year.
  Mutually exclusive with `date`. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested rates. The `czeonia` column holds the rate in percent
and `volume` the trading volume in millions of Czech koruna.

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
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
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
# latest rate
cnb_czeonia()
#>          date czeonia volume
#>        <Date>   <num>  <int>
#> 1: 2026-06-22     3.5  10399

# all rates for a given year
cnb_czeonia(year = 2024L)
#>            date czeonia volume
#>          <Date>   <num>  <int>
#>   1: 2024-01-02    5.80 148757
#>   2: 2024-01-03    5.80  76156
#>   3: 2024-01-04    6.51  15554
#>   4: 2024-01-05    6.45  17510
#>   5: 2024-01-08    6.56  13277
#>  ---                          
#> 248: 2024-12-20    3.68  21338
#> 249: 2024-12-23    3.03  54766
#> 250: 2024-12-27    3.04  62260
#> 251: 2024-12-30    3.03  88900
#> 252: 2024-12-31    3.00 150350
# }
```
