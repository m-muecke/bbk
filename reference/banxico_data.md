# Fetch Banco de México (Banxico) data

Retrieve time series data from the Banco de México Sistema de
Información Económica (SIE) API.

## Usage

``` r
banxico_data(
  series,
  start_date = NULL,
  end_date = NULL,
  api_key = banxico_key()
)
```

## Source

<https://www.banxico.org.mx/SieAPIRest/service/v1/>

## Arguments

- series:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  One or more SIE series codes to query (e.g., `"SF43718"` for the FIX
  peso/US dollar exchange rate). Series codes can be found on the SIE
  website.

- start_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  Start date of the data (e.g., `"2024-01-01"`). Must be paired with
  `end_date`. If both are `NULL`, the full history is returned. Default
  `NULL`.

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End date of the data, in the same format as start_date. Must be paired
  with `start_date`. If both are `NULL`, the full history is returned.
  Default `NULL`.

- api_key:

  (`character(1)`)  
  The SIE API token. Defaults to the `BANXICO_KEY` environment variable.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns `date`, `key`, and `value`.

## Details

The SIE API requires a free access token. Request one at
<https://www.banxico.org.mx/SieAPIRest/service/v1/token> and supply it
via the `api_key` argument or the `BANXICO_KEY` environment variable.

Supply both `start_date` and `end_date` to restrict the period, or
neither to return the complete history of each series. Supplying only
one is an error.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_fx_rates()`](https://m-muecke.github.io/bbk/reference/bcb_fx_rates.md),
[`bcb_inflation()`](https://m-muecke.github.io/bbk/reference/bcb_inflation.md),
[`bcb_selic()`](https://m-muecke.github.io/bbk/reference/bcb_selic.md),
[`bcb_top5()`](https://m-muecke.github.io/bbk/reference/bcb_top5.md),
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
[`cnb_czeonia()`](https://m-muecke.github.io/bbk/reference/cnb_czeonia.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
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
if (FALSE) { # curl::has_internet() && nzchar(Sys.getenv("BANXICO_KEY"))
# \donttest{
# fetch the FIX peso/US dollar exchange rate
banxico_data("SF43718", start_date = "2024-01-01", end_date = "2024-01-31")

# fetch multiple series at once
banxico_data(c("SF43718", "SF60653"), start_date = "2024-01-01", end_date = "2024-01-31")
# }
}
```
