# Fetch Bank of Israel (BoI) dimensions

Retrieve the dimension structure for a given dataflow from the Bank of
Israel SDMX Web Service.

## Usage

``` r
boi_dimension(id)
```

## Source

<https://www.boi.org.il/en/>

## Arguments

- id:

  (`character(1)`)  
  The id of the data structure definition to query (e.g., `"EXR"`).

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns:

- id:

  The dimension id (e.g., `"FREQ"`, `"BASE_CURRENCY"`)

- position:

  The position of the dimension in the series key

- codelist:

  The id of the associated codelist (e.g., `"CL_FREQ"`)

## See also

Other metadata:
[`banxico_metadata()`](https://m-muecke.github.io/bbk/reference/banxico_metadata.md),
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bcb_currencies()`](https://m-muecke.github.io/bbk/reference/bcb_currencies.md),
[`bdf_dimension()`](https://m-muecke.github.io/bbk/reference/bdf_dimension.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`boi_metadata()`](https://m-muecke.github.io/bbk/reference/boi_metadata.md),
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
[`cnb_dimension()`](https://m-muecke.github.io/bbk/reference/cnb_dimension.md),
[`cnb_indicators()`](https://m-muecke.github.io/bbk/reference/cnb_indicators.md),
[`cnb_snapshots()`](https://m-muecke.github.io/bbk/reference/cnb_snapshots.md),
[`cnb_tree()`](https://m-muecke.github.io/bbk/reference/cnb_tree.md),
[`ecb_dimension()`](https://m-muecke.github.io/bbk/reference/ecb_dimension.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`nob_dimension()`](https://m-muecke.github.io/bbk/reference/nob_dimension.md),
[`nob_metadata()`](https://m-muecke.github.io/bbk/reference/nob_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md),
[`snb_dimension()`](https://m-muecke.github.io/bbk/reference/snb_dimension.md),
[`snb_metadata()`](https://m-muecke.github.io/bbk/reference/snb_metadata.md),
[`snb_toc()`](https://m-muecke.github.io/bbk/reference/snb_toc.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
boi_dimension("EXR")
#>                  id position           codelist
#>              <char>    <int>             <char>
#> 1:      SERIES_CODE        1 CL_SERIES_CODE_EXR
#> 2:             FREQ        2            CL_FREQ
#> 3:    BASE_CURRENCY        3        CL_CURRENCY
#> 4: COUNTER_CURRENCY        4        CL_CURRENCY
#> 5:     UNIT_MEASURE        5            CL_UNIT
#> 6:        DATA_TYPE        6   CL_DATA_TYPE_EXR
# }
```
