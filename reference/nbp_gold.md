# Fetch National Bank of Poland (NBP) gold prices

Retrieve the price of gold from the NBP Web API.

## Usage

``` r
nbp_gold(start_date = NULL, end_date = NULL, last_n = NULL)
```

## Source

<https://api.nbp.pl/en.html>

## Arguments

- start_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  Start date of the data.

- end_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  End date of the data.

- last_n:

  (`NULL` \| `integer(1)`)  
  Return only the last `n` quotations.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with gold prices.

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
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nbp_fx_rates()`](https://m-muecke.github.io/bbk/reference/nbp_fx_rates.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
nbp_gold(last_n = 10L)
#>           date  price
#>         <Date>  <num>
#>  1: 2026-04-03 552.46
#>  2: 2026-04-07 557.13
#>  3: 2026-04-08 555.24
#>  4: 2026-04-09 562.26
#>  5: 2026-04-10 554.60
#>  6: 2026-04-13 554.64
#>  7: 2026-04-14 552.27
#>  8: 2026-04-15 554.13
#>  9: 2026-04-16 556.66
#> 10: 2026-04-17 556.80
# }
```
