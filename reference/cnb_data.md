# Fetch Czech National Bank (CNB) ARAD time series data

Retrieve time series observations from the CNB ARAD database. ARAD is
the CNB's full statistical database, covering monetary,
financial-market, balance-of-payments, and government finance
statistics. Access requires an API key, which can be generated from a
free account at <https://www.cnb.cz/arad/>.

## Usage

``` r
cnb_data(
  indicator_id = NULL,
  set_id = NULL,
  base_id = NULL,
  selection_id = NULL,
  start_period = NULL,
  end_period = NULL,
  snapshot_id = NULL,
  api_key = cnb_arad_key()
)
```

## Source

<https://www.cnb.cz/docs/arad20/dokumentace/arad_rest_api_cs.pdf>

## Arguments

- indicator_id:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  One or more indicator identifiers to retrieve (e.g. `"SMV5M603"`).
  Exactly one of `indicator_id`, `set_id`, `base_id`, or `selection_id`
  must be provided.

- set_id:

  (`NULL` \| `character(1)`)  
  A set ("sestava") identifier, returning all of its indicators.

- base_id:

  (`NULL` \| `character(1)`)  
  A base identifier, returning all of its indicators.

- selection_id:

  (`NULL` \| `character(1)`)  
  The identifier of a named selection ("My selections") created in your
  ARAD account.

- start_period:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  Start of the period to retrieve. If `NULL`, no start restriction is
  applied. Default `NULL`.

- end_period:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  End of the period to retrieve, in the same format as `start_period`.
  Default `NULL`.

- snapshot_id:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  One or more snapshot ids to retrieve historical vintages, or `"ALL"`
  for every snapshot. If `NULL`, the current (non-snapshot) data is
  returned. See
  [`cnb_snapshots()`](https://m-muecke.github.io/bbk/reference/cnb_snapshots.md).
  Default `NULL`.

- api_key:

  (`character(1)`)  
  API key to use for the request. Defaults to the value returned by
  `cnb_arad_key()`, which reads from the `CNB_ARAD_KEY` environment
  variable.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns:

- date:

  The observation period

- indicator_id:

  The indicator identifier

- snapshot_id:

  The snapshot identifier, or `NA` for non-snapshot data

- value:

  The observation value

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
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nbp_fx_rates()`](https://m-muecke.github.io/bbk/reference/nbp_fx_rates.md),
[`nbp_gold()`](https://m-muecke.github.io/bbk/reference/nbp_gold.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# a single indicator over 24 months
cnb_data("SMV5M603", start_period = "2023-01-01")

# every indicator in a set
cnb_data(set_id = "1058")
} # }
```
