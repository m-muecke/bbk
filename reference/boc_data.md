# Fetch Bank of Canada (BoC) data

Retrieve time series data from the Bank of Canada Valet API.

## Usage

``` r
boc_data(
  group_name = NULL,
  series_name = NULL,
  start_date = NULL,
  end_date = NULL
)
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

- start_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  Start date of the data. Default `NULL`.

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End date of the data. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
with the requested data.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# fetch all data for a single group
dt <- boc_data(group_name = "FX_RATES_DAILY")
head(dt)

# or for multiple series ids
dt <- boc_data(
  series_name = c("FXUSDCAD", "FXEURCAD"),
  start_date = "2023-01-23",
  end_date = "2023-07-19"
)
head(dt)
} # }
```
