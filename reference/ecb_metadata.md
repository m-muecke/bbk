# Fetch European Central Bank (ECB) metadata

Retrieve metadata from the ECB time series database via the SDMX Web
Service.

## Usage

``` r
ecb_metadata(type, agency = NULL, id = NULL)
```

## Source

<https://data.ecb.europa.eu/help/api/metadata>

## Arguments

- type:

  (`character(1)`)  
  The type of metadata to query. One of: `"datastructure"`,
  `"dataflow"`, `"codelist"`, or `"concept"`.

- agency:

  (`NULL` \| `character(1)`)  
  The id of the agency to query. Default `NULL`.

- id:

  (`NULL` \| `character(1)`)  
  The id of the resource to query. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested metadata. The columns are:

- agency:

  The agency of the metadata

- id:

  The id of the metadata

- name:

  The name of the metadata

## See also

Other metadata:
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`nob_metadata()`](https://m-muecke.github.io/bbk/reference/nob_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
ecb_metadata("datastructure")
ecb_metadata("datastructure", "ECB")
ecb_metadata("datastructure", "ECB", "ECB_EXR1")
ecb_metadata("datastructure", id = "ECB_EXR1")
# }
```
