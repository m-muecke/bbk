# Fetch Banco Central do Brasil (BCB) market expectations

Retrieve market expectations from the Banco Central do Brasil Focus
survey (Relatório Focus) via the Olinda API. Each row is the summary of
survey responses collected on a given date for a future reference
period.

## Usage

``` r
bcb_expectations(
  type = "annual",
  indicator = NULL,
  start_date = NULL,
  end_date = NULL
)
```

## Source

<https://dadosabertos.bcb.gov.br/>

## Arguments

- type:

  (`character(1)`)  
  The forecast horizon. One of `"annual"`, `"monthly"`, or
  `"quarterly"`. Default `"annual"`.

- indicator:

  (`NULL` \| `character(1)`)  
  The economic indicator to filter on (e.g. `"IPCA"`, `"Selic"`,
  `"Câmbio"`). If `NULL`, all indicators are returned. Default `NULL`.

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
with columns `date`, `indicator`, `detail`, `reference`, `mean`,
`median`, `sd`, `min`, `max`, `respondents`, and `base`.

## Details

Querying without a filter returns the full history, which is large;
supplying `indicator` and/or a date range is recommended.

## See also

Other data:
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
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
# \donttest{
# annual IPCA inflation expectations
bcb_expectations("annual", "IPCA", start_date = "2024-01-01", end_date = "2024-01-31")
#>            date indicator detail reference   mean median     sd    min    max
#>          <Date>    <char> <char>    <char>  <num>  <num>  <num>  <num>  <num>
#>   1: 2024-01-02      IPCA   <NA>      2023 4.4689 4.4590 0.0767 4.2987 4.7148
#>   2: 2024-01-02      IPCA   <NA>      2024 3.8665 3.9000 0.3330 3.0198 5.2600
#>   3: 2024-01-02      IPCA   <NA>      2025 3.5669 3.5000 0.4053 2.4000 5.0000
#>   4: 2024-01-02      IPCA   <NA>      2026 3.5317 3.5000 0.4617 2.1000 5.0000
#>   5: 2024-01-02      IPCA   <NA>      2027 3.5317 3.5000 0.4717 2.5000 5.0100
#>  ---                                                                         
#> 216: 2024-01-31      IPCA   <NA>      2024 3.7777 3.8028 0.3256 2.9679 4.9475
#> 217: 2024-01-31      IPCA   <NA>      2025 3.5937 3.5042 0.3766 3.0000 5.0000
#> 218: 2024-01-31      IPCA   <NA>      2026 3.4945 3.5000 0.4097 2.8000 5.0000
#> 219: 2024-01-31      IPCA   <NA>      2027 3.4743 3.5000 0.4389 2.8000 5.0000
#> 220: 2024-01-31      IPCA   <NA>      2028 3.4460 3.4900 0.4419 3.0000 5.0000
#>      respondents  base
#>            <int> <int>
#>   1:         149     0
#>   2:         146     0
#>   3:         135     0
#>   4:         123     0
#>   5:         116     0
#>  ---                  
#> 216:         107     1
#> 217:         103     1
#> 218:          90     1
#> 219:          83     1
#> 220:          60     1
# }
```
