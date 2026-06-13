# Fetch Banco Central do Brasil (BCB) data

Retrieve time series data from the Banco Central do Brasil SGS (Sistema
Gerenciador de Séries Temporais) API.

## Usage

``` r
bcb_data(series, start_date = NULL, end_date = NULL)
```

## Source

<https://dadosabertos.bcb.gov.br/>

## Arguments

- series:

  (`integer(1)`)  
  The SGS series code to query (e.g., `1` for the USD/BRL exchange
  rate). Series codes can be found on the SGS website.

- start_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  Start date of the data (e.g., `"2024-01-01"`). If `NULL`, all
  available data is returned. Default `NULL`.

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End date of the data, in the same format as start_date. If `NULL`,
  data up to the latest available date is returned. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## Details

Daily series require a date range and the API limits the query window to
at most 10 years; supply `start_date` (and optionally `end_date`) when
querying such series.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_fx_rates()`](https://m-muecke.github.io/bbk/reference/bcb_fx_rates.md),
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
# \donttest{
# fetch USD/BRL exchange rate
bcb_data(1, start_date = "2024-01-01", end_date = "2024-01-31")
#>           date    key  value
#>         <Date> <char>  <num>
#>  1: 2024-01-02      1 4.8916
#>  2: 2024-01-03      1 4.9212
#>  3: 2024-01-04      1 4.9188
#>  4: 2024-01-05      1 4.8899
#>  5: 2024-01-08      1 4.8850
#>  6: 2024-01-09      1 4.8937
#>  7: 2024-01-10      1 4.8901
#>  8: 2024-01-11      1 4.8794
#>  9: 2024-01-12      1 4.8543
#> 10: 2024-01-15      1 4.8765
#> 11: 2024-01-16      1 4.9038
#> 12: 2024-01-17      1 4.9346
#> 13: 2024-01-18      1 4.9403
#> 14: 2024-01-19      1 4.9223
#> 15: 2024-01-22      1 4.9490
#> 16: 2024-01-23      1 4.9715
#> 17: 2024-01-24      1 4.9192
#> 18: 2024-01-25      1 4.9232
#> 19: 2024-01-26      1 4.9125
#> 20: 2024-01-29      1 4.9225
#> 21: 2024-01-30      1 4.9638
#> 22: 2024-01-31      1 4.9535
#>           date    key  value
#>         <Date> <char>  <num>

# fetch the Selic target rate
bcb_data(432, start_date = "2024-01-01", end_date = "2024-01-31")
#>           date    key value
#>         <Date> <char> <num>
#>  1: 2024-01-01    432 11.75
#>  2: 2024-01-02    432 11.75
#>  3: 2024-01-03    432 11.75
#>  4: 2024-01-04    432 11.75
#>  5: 2024-01-05    432 11.75
#>  6: 2024-01-06    432 11.75
#>  7: 2024-01-07    432 11.75
#>  8: 2024-01-08    432 11.75
#>  9: 2024-01-09    432 11.75
#> 10: 2024-01-10    432 11.75
#> 11: 2024-01-11    432 11.75
#> 12: 2024-01-12    432 11.75
#> 13: 2024-01-13    432 11.75
#> 14: 2024-01-14    432 11.75
#> 15: 2024-01-15    432 11.75
#> 16: 2024-01-16    432 11.75
#> 17: 2024-01-17    432 11.75
#> 18: 2024-01-18    432 11.75
#> 19: 2024-01-19    432 11.75
#> 20: 2024-01-20    432 11.75
#> 21: 2024-01-21    432 11.75
#> 22: 2024-01-22    432 11.75
#> 23: 2024-01-23    432 11.75
#> 24: 2024-01-24    432 11.75
#> 25: 2024-01-25    432 11.75
#> 26: 2024-01-26    432 11.75
#> 27: 2024-01-27    432 11.75
#> 28: 2024-01-28    432 11.75
#> 29: 2024-01-29    432 11.75
#> 30: 2024-01-30    432 11.75
#> 31: 2024-01-31    432 11.75
#>           date    key value
#>         <Date> <char> <num>
# }
```
