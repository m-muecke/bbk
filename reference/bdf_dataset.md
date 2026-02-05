# Fetch Banque de France (BdF) datasets

Fetch Banque de France (BdF) datasets

## Usage

``` r
bdf_dataset(...)
```

## Source

<https://webstat.banque-france.fr/en/pages/guide-migration-api/>

## Arguments

- ...:

  (`any`)  
  Extra arguments appended to the API request. Combined with the default
  arguments with
  [`modifyList()`](https://rdrr.io/r/utils/modifyList.html).

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md)

## Examples

``` r
if (FALSE) { # \dontrun{
bdf_dataset()

# structure of a dataset
bdf_dataset(where = "dataset_id = 'CONJ2'")
} # }
```
