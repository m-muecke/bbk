# Fetch Deutsche Bundesbank (BBk) dimensions

Retrieve the dimension structure for a given dataflow from the
Bundesbank SDMX Web Service.

## Usage

``` r
bbk_dimension(id)
```

## Source

<https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>

## Arguments

- id:

  (`character(1)`)  
  The id of the data structure definition to query (e.g.,
  `"BBK_BBSIS"`).

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns:

- id:

  The dimension id (e.g., `"BBK_STD_FREQ"`, `"BBK_STD_AREA"`)

- position:

  The position of the dimension in the series key

- codelist:

  The id of the associated codelist

## See also

Other metadata:
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
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
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
bbk_dimension("BBK_ERX")
#>                          id position               codelist
#>                      <char>    <int>                 <char>
#> 1:             BBK_STD_FREQ        1        CL_BBK_STD_FREQ
#> 2:         BBK_STD_CURRENCY        2    CL_BBK_STD_CURRENCY
#> 3: BBK_ERX_PARTNER_CURRENCY        3    CL_BBK_STD_CURRENCY
#> 4:      BBK_ERX_SERIES_TYPE        4 CL_BBK_ERX_SERIES_TYPE
#> 5:        BBK_ERX_RATE_TYPE        5   CL_BBK_ERX_RATE_TYPE
#> 6:           BBK_ERX_SUFFIX        6      CL_BBK_ERX_SUFFIX
# }
```
