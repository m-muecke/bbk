# Fetch Banque de France (BdF) data

Retrieve time series data from the BdF Webstat API.

## Usage

``` r
bdf_data(
  ...,
  key = NULL,
  start_date = NULL,
  end_date = NULL,
  api_key = bdf_key()
)
```

## Source

<https://webstat.banque-france.fr/en/pages/guide-migration-api/>

## Arguments

- ...:

  (`any`)  
  Extra arguments appended to the API request. Combined with the default
  arguments with
  [`modifyList()`](https://rdrr.io/r/utils/modifyList.html).

- key:

  (`NULL` \| `character(1)`)  
  The series key to query. Default `NULL`.

- start_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  Start date of the data. Default `NULL`.

- end_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  End date of the data. Default `NULL`.

- api_key:

  (`character(1)`)  
  API key to use for the request. Defaults to the value returned by
  `bdf_key()`, which reads from the `BANQUEDEFRANCE_KEY` environment
  variable.

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
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md)

## Examples

``` r
if (FALSE) { # \dontrun{
bdf_data(key = "CONJ2.M.R24.T.SM.0RG24.EFTPM100.10")

# inflation rate
bdf_data(key = "ICP.M.FR.N.000000.4.ANR")

# or with a date filter
bdf_data(key = "ICP.M.FR.N.000000.4.ANR", start_date = "2025-01-01", end_date = "2025-06-30")

# advanced filter with where clause
bdf_data(key = "ICP.M.FR.N.000000.4.ANR", where = "time_period_start >= date'2025-01-01'")
} # }
```
