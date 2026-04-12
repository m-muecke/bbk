# Fetch Sveriges Riksbank (SRb) cross rates

Compute cross exchange rates between two currency series from the
Sveriges Riksbank SWEA API.

## Usage

``` r
srb_cross_rates(series1, series2, start_date, end_date = NULL)
```

## Source

<https://developer.api.riksbank.se/>

## Arguments

- series1:

  (`character(1)`)  
  The first series ID (e.g., `"SEKUSDPMI"`).

- series2:

  (`character(1)`)  
  The second series ID (e.g., `"SEKEURPMI"`).

- start_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  Start date of the data (e.g., `"2024-01-01"`). If `NULL`, all
  available data is returned. Default `NULL`.

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End date of the data, in the same format as start_date. If `NULL`,
  data up to the latest available date is returned. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the cross rate data.

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
[`nbp_gold()`](https://m-muecke.github.io/bbk/reference/nbp_gold.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
# USD/EUR cross rate
srb_cross_rates("SEKUSDPMI", "SEKEURPMI", start_date = "2024-01-01", end_date = "2024-01-31")
#>           date                 key   value
#>         <Date>              <char>   <num>
#>  1: 2024-01-02 SEKUSDPMI/SEKEURPMI 0.91274
#>  2: 2024-01-03 SEKUSDPMI/SEKEURPMI 0.91583
#>  3: 2024-01-04 SEKUSDPMI/SEKEURPMI 0.91299
#>  4: 2024-01-05 SEKUSDPMI/SEKEURPMI 0.91567
#>  5: 2024-01-08 SEKUSDPMI/SEKEURPMI 0.91358
#>  6: 2024-01-09 SEKUSDPMI/SEKEURPMI 0.91408
#>  7: 2024-01-10 SEKUSDPMI/SEKEURPMI 0.91358
#>  8: 2024-01-11 SEKUSDPMI/SEKEURPMI 0.91017
#>  9: 2024-01-12 SEKUSDPMI/SEKEURPMI 0.91391
#> 10: 2024-01-15 SEKUSDPMI/SEKEURPMI 0.91366
#> 11: 2024-01-16 SEKUSDPMI/SEKEURPMI 0.91895
#> 12: 2024-01-17 SEKUSDPMI/SEKEURPMI 0.91937
#> 13: 2024-01-18 SEKUSDPMI/SEKEURPMI 0.91954
#> 14: 2024-01-19 SEKUSDPMI/SEKEURPMI 0.91853
#> 15: 2024-01-22 SEKUSDPMI/SEKEURPMI 0.91827
#> 16: 2024-01-23 SEKUSDPMI/SEKEURPMI 0.91979
#> 17: 2024-01-24 SEKUSDPMI/SEKEURPMI 0.91701
#> 18: 2024-01-25 SEKUSDPMI/SEKEURPMI 0.91802
#> 19: 2024-01-26 SEKUSDPMI/SEKEURPMI 0.91988
#> 20: 2024-01-29 SEKUSDPMI/SEKEURPMI 0.92396
#> 21: 2024-01-30 SEKUSDPMI/SEKEURPMI 0.92200
#> 22: 2024-01-31 SEKUSDPMI/SEKEURPMI 0.92276
#>           date                 key   value
#>         <Date>              <char>   <num>
# }
```
