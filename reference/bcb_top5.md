# Fetch Banco Central do Brasil (BCB) Top-5 market expectations

Retrieve the Top-5 market expectations from the Banco Central do Brasil
Focus survey (Relatório Focus) via the Olinda API. The Top-5 ranking
summarises the forecasts of the institutions with the most accurate
projections for a given indicator.

## Usage

``` r
bcb_top5(type = "annual", indicator = NULL, start_date = NULL, end_date = NULL)
```

## Source

<https://dadosabertos.bcb.gov.br/>

## Arguments

- type:

  (`character(1)`)  
  The forecast horizon. One of `"annual"`, `"monthly"`, `"quarterly"`,
  or `"selic"`. Default `"annual"`.

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
with columns `date`, `indicator`, `type_calc`, `reference`, `mean`,
`median`, `sd`, `min`, and `max`. The `type_calc` column holds the
ranking horizon (`"C"` short, `"M"` medium, or `"L"` long term). For
`type = "selic"` the `reference` column holds the COPOM meeting (e.g.
`"R4/2026"`).

## See also

Other data:
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_fx_rates()`](https://m-muecke.github.io/bbk/reference/bcb_fx_rates.md),
[`bcb_inflation()`](https://m-muecke.github.io/bbk/reference/bcb_inflation.md),
[`bcb_selic()`](https://m-muecke.github.io/bbk/reference/bcb_selic.md),
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
# annual Top-5 IPCA inflation expectations
bcb_top5("annual", "IPCA", start_date = "2024-01-01", end_date = "2024-01-31")
#>            date indicator type_calc reference   mean median     sd    min
#>          <Date>    <char>    <char>    <char>  <num>  <num>  <num>  <num>
#>   1: 2024-01-02      IPCA         C      2023 4.4329 4.4131 0.0429 4.3923
#>   2: 2024-01-02      IPCA         C      2024 3.7478 3.7409 0.2695 3.3177
#>   3: 2024-01-02      IPCA         C      2025 3.5589 3.5000 0.3175 3.2000
#>   4: 2024-01-02      IPCA         C      2026 3.6125 3.6250 0.2966 3.2000
#>   5: 2024-01-02      IPCA         C      2027 3.5625 3.6250 0.3698 3.0000
#>  ---                                                                     
#> 311: 2024-01-31      IPCA         L      2024 3.6681 3.5537 0.6094 3.0000
#> 312: 2024-01-31      IPCA         L      2025 3.7320 3.4000 0.6693 3.2000
#> 313: 2024-01-31      IPCA         L      2026 3.3850 3.4000 0.1006 3.2550
#> 314: 2024-01-31      IPCA         L      2027 3.3000 3.4000 0.2160 3.0000
#> 315: 2024-01-31      IPCA         L      2028 3.3000 3.4000 0.2160 3.0000
#>         max
#>       <num>
#>   1: 4.5067
#>   2: 4.0933
#>   3: 4.0000
#>   4: 4.0000
#>   5: 4.0000
#>  ---       
#> 311: 4.7900
#> 312: 5.0000
#> 313: 3.5000
#> 314: 3.5000
#> 315: 3.5000

# Top-5 Selic target rate expectations
bcb_top5("selic", start_date = "2024-01-01", end_date = "2024-01-31")
#>            date indicator type_calc reference    mean median     sd    min
#>          <Date>    <char>    <char>    <char>   <num>  <num>  <num>  <num>
#>   1: 2024-01-02     Selic         C   R1/2024 11.2083 11.250 0.1382 10.750
#>   2: 2024-01-02     Selic         C   R2/2024 10.6875 10.750 0.1488 10.250
#>   3: 2024-01-02     Selic         C   R3/2024 10.1458 10.250 0.1898  9.750
#>   4: 2024-01-02     Selic         C   R4/2024  9.6448  9.750 0.2401  9.238
#>   5: 2024-01-02     Selic         C   R5/2024  9.2879  9.375 0.3072  8.750
#>  ---                                                                      
#> 700: 2024-01-31     Selic         L   R4/2025  8.7500  8.750 0.2236  8.500
#> 701: 2024-01-31     Selic         L   R5/2025  8.7500  8.750 0.2236  8.500
#> 702: 2024-01-31     Selic         L   R6/2025  8.7000  8.750 0.1871  8.500
#> 703: 2024-01-31     Selic         L   R7/2025  8.6500  8.500 0.2000  8.500
#> 704: 2024-01-31     Selic         L   R8/2025  8.6500  8.500 0.2000  8.500
#>        max
#>      <num>
#>   1: 11.25
#>   2: 10.75
#>   3: 10.25
#>   4: 10.00
#>   5:  9.75
#>  ---      
#> 700:  9.00
#> 701:  9.00
#> 702:  9.00
#> 703:  9.00
#> 704:  9.00
# }
```
