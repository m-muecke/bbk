# Fetch Banco Central do Brasil (BCB) Selic expectations

Retrieve market expectations for the Selic target rate from the Banco
Central do Brasil Focus survey (Relatório Focus) via the Olinda API.
Each row summarises the forecasts collected on a given survey date for a
future COPOM meeting.

## Usage

``` r
bcb_selic(start_date = NULL, end_date = NULL)
```

## Source

<https://dadosabertos.bcb.gov.br/>

## Arguments

- start_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  Start of the survey date range (e.g., `"2024-01-01"`). If `NULL`, no
  lower bound is applied. Default `NULL`.

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End of the survey date range, in the same format as start_date. If
  `NULL`, no upper bound is applied. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns `date`, `meeting`, `mean`, `median`, `sd`, `min`, `max`,
`respondents`, and `base`. The `meeting` column identifies the COPOM
meeting the forecast refers to (e.g. `"R3/2028"`).

## See also

Other data:
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_fx_rates()`](https://m-muecke.github.io/bbk/reference/bcb_fx_rates.md),
[`bcb_inflation()`](https://m-muecke.github.io/bbk/reference/bcb_inflation.md),
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
# \donttest{
bcb_selic(start_date = "2024-01-01", end_date = "2024-01-31")
#>            date meeting    mean median     sd   min   max respondents  base
#>          <Date>  <char>   <num>  <num>  <num> <num> <num>       <int> <int>
#>   1: 2024-01-02 R1/2024 11.2500  11.25 0.0000 11.25 11.25          30     1
#>   2: 2024-01-02 R1/2024 11.2390  11.25 0.0669 10.75 11.25         136     0
#>   3: 2024-01-02 R2/2024 10.7417  10.75 0.0449 10.50 10.75          30     1
#>   4: 2024-01-02 R2/2024 10.7188  10.75 0.1069 10.25 11.00         136     0
#>   5: 2024-01-02 R3/2024 10.2500  10.25 0.1291  9.75 10.50          30     1
#>  ---                                                                       
#> 700: 2024-01-31 R6/2025  8.6100   8.50 0.5681  7.00 10.00         129     0
#> 701: 2024-01-31 R7/2025  8.5417   8.50 0.5889  7.00 10.00          78     1
#> 702: 2024-01-31 R7/2025  8.5870   8.50 0.5737  7.00 10.00         129     0
#> 703: 2024-01-31 R8/2025  8.5549   8.50 0.6649  7.00 10.50          82     1
#> 704: 2024-01-31 R8/2025  8.5702   8.50 0.6175  7.00 10.50         139     0
# }
```
