# Fetch Czech National Bank (CNB) ARAD indicator tree

Retrieve the placement of indicators within the ARAD topic tree.

## Usage

``` r
cnb_tree(
  indicator_id = NULL,
  set_id = NULL,
  base_id = NULL,
  selection_id = NULL,
  lang = "en",
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

- lang:

  (`character(1)`)  
  Language for the textual attributes, either `"en"` or `"cs"`. Default
  `"en"`.

- api_key:

  (`character(1)`)  
  API key to use for the request. Defaults to the value returned by
  `cnb_arad_key()`, which reads from the `CNB_ARAD_KEY` environment
  variable.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns `indicator_id` and `path`, where `path` is the
slash-separated location of the indicator in the ARAD tree.

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
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
[`cnb_dimension()`](https://m-muecke.github.io/bbk/reference/cnb_dimension.md),
[`cnb_indicators()`](https://m-muecke.github.io/bbk/reference/cnb_indicators.md),
[`cnb_snapshots()`](https://m-muecke.github.io/bbk/reference/cnb_snapshots.md),
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
cnb_tree(indicator_id = "MIRFMDF12ERATPECD")
} # }
```
