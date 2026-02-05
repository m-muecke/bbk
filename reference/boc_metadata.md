# Fetch Bank of Canada (BoC) metadata (details)

Fetch Bank of Canada (BoC) metadata (details)

## Usage

``` r
boc_metadata(group_name = NULL, series_name = NULL)
```

## Source

<https://www.bankofcanada.ca/valet/docs>

## Arguments

- group_name:

  (`NULL` \| `character(1)`)  
  Name of the group. Only one of `group_name` or `series_name` can be
  used.

- series_name:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  Name of the series.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## Examples

``` r
if (FALSE) { # \dontrun{
boc_metadata(group_name = "FX_RATES_DAILY")
boc_metadata(series_name = "FXUSDCAD")
} # }
```
