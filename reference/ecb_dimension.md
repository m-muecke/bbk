# Fetch European Central Bank (ECB) dimensions

Retrieve the dimension structure for a given dataflow from the ECB SDMX
Web Service.

## Usage

``` r
ecb_dimension(id)
```

## Source

<https://data.ecb.europa.eu/help/api/metadata>

## Arguments

- id:

  (`character(1)`)  
  The id of the data structure definition to query (e.g., `"ECB_EXR1"`).

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns:

- id:

  The dimension id (e.g., `"FREQ"`, `"CURRENCY"`)

- position:

  The position of the dimension in the series key

- codelist:

  The id of the associated codelist (e.g., `"CL_FREQ"`)

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_domains()`](https://m-muecke.github.io/bbk/reference/bdp_domains.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
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
ecb_dimension("ECB_EXR1")
#>                id position      codelist
#>            <char>    <int>        <char>
#> 1:           FREQ        1       CL_FREQ
#> 2:       CURRENCY        2   CL_CURRENCY
#> 3: CURRENCY_DENOM        3   CL_CURRENCY
#> 4:       EXR_TYPE        4   CL_EXR_TYPE
#> 5:     EXR_SUFFIX        5 CL_EXR_SUFFIX
# }
```
