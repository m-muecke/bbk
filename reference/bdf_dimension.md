# Fetch Banque de France (BdF) dimensions

Retrieve the dimension structure for a given dataset from the BdF
Webstat API.

## Usage

``` r
bdf_dimension(dataset_id, lang = "en", api_key = bdf_key())
```

## Source

<https://webstat.banque-france.fr/en/pages/guide-migration-api/>

## Arguments

- dataset_id:

  (`character(1)`)  
  The id of the dataset to query (e.g., `"CONJ2"`). See
  [`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md)
  for available datasets.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

- api_key:

  (`character(1)`)  
  API key to use for the request. Defaults to the value returned by
  `bdf_key()`, which reads from the `BANQUEDEFRANCE_KEY` environment
  variable.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns:

- id:

  The dimension id (e.g., `"FREQ"`, `"REF_AREA"`)

- position:

  The position of the dimension in the series key

- codelist:

  The id of the associated codelist

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
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
[`snb_metadata()`](https://m-muecke.github.io/bbk/reference/snb_metadata.md),
[`snb_toc()`](https://m-muecke.github.io/bbk/reference/snb_toc.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
if (FALSE) { # \dontrun{
bdf_dimension("CONJ2")
} # }
```
