# Fetch Swiss National Bank (SNB) dimensions

Retrieve the dimension structure for a given cube from the SNB data
portal.

## Usage

``` r
snb_dimension(key, lang = "en")
```

## Source

<https://data.snb.ch/en>

## Arguments

- key:

  (`character(1)`)  
  The series key to query.

- lang:

  (`character(1)`)  
  Language to query, either `"en"` or `"de"`. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the dimension structure.

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`ecb_dimension()`](https://m-muecke.github.io/bbk/reference/ecb_dimension.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`nob_dimension()`](https://m-muecke.github.io/bbk/reference/nob_dimension.md),
[`nob_metadata()`](https://m-muecke.github.io/bbk/reference/nob_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
snb_dimension("rendopar")
#>    dim_id dim_name item_id item_name
#>    <char>   <char>  <char>    <char>
#> 1:     d0 Overview      b0        B0
#> 2:     d0 Overview      b1        B1
#> 3:     d0 Overview      b2        B2
#> 4:     d0 Overview      b3        B3
#> 5:     d0 Overview      t1        T1
#> 6:     d0 Overview      t2        T2
# }
```
