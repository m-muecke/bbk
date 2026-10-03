# Fetch National Bank of Belgium (NBB) data

Retrieve time series data from the National Bank of Belgium SDMX Web
Service (NBB.Stat).

## Usage

``` r
nbb_data(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL
)
```

## Source

<https://dataexplorer.nbb.be/>

## Arguments

- flow:

  (`character(1)`)  
  The dataflow to query (e.g., `"DF_EXR"`). See
  [`nbb_metadata()`](https://m-muecke.github.io/bbk/reference/nbb_metadata.md)
  for available dataflows.

- key:

  (`NULL` \| `character(1)`)  
  The series key to query using dot-separated dimension values (e.g.,
  `"D.USD"`). Use `+` for multiple values in one dimension (e.g.,
  `"M.USD+GBP"`). If `NULL`, all data for the flow is returned. Default
  `NULL`.

- start_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  Start date of the data (e.g., `"2024-01"` or `2024`). If `NULL`, no
  start date restriction is applied. Default `NULL`.

- end_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  End date of the data, in the same format as start_period. If `NULL`,
  no end date restriction is applied. Default `NULL`.

- first_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the start of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

- last_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the end of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

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
[`boi_data()`](https://m-muecke.github.io/bbk/reference/boi_data.md),
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
# fetch daily EUR/USD reference rate
nbb_data("DF_EXR", "D.USD", last_n = 5L)
#>          date    key  value   freq exr_currency
#>        <Date> <char>  <num> <char>       <char>
#> 1: 2026-09-28  D.USD 1.1378  daily          USD
#> 2: 2026-09-29  D.USD 1.1355  daily          USD
#> 3: 2026-09-30  D.USD 1.1355  daily          USD
#> 4: 2026-10-01  D.USD 1.1298  daily          USD
#> 5: 2026-10-02  D.USD 1.1225  daily          USD

# fetch multiple monthly average exchange rates
nbb_data("DF_EXR", "M.USD+GBP", start_period = "2024-01")
#>           date    key     value    freq exr_currency
#>         <Date> <char>     <num>  <char>       <char>
#>  1: 2024-01-01  M.GBP 0.8587300 monthly          GBP
#>  2: 2024-02-01  M.GBP 0.8546600 monthly          GBP
#>  3: 2024-03-01  M.GBP 0.8552400 monthly          GBP
#>  4: 2024-04-01  M.GBP 0.8565800 monthly          GBP
#>  5: 2024-05-01  M.GBP 0.8556400 monthly          GBP
#>  6: 2024-06-01  M.GBP 0.8464300 monthly          GBP
#>  7: 2024-07-01  M.GBP 0.8433200 monthly          GBP
#>  8: 2024-08-01  M.GBP 0.8515000 monthly          GBP
#>  9: 2024-09-01  M.GBP 0.8402100 monthly          GBP
#> 10: 2024-10-01  M.GBP 0.8349600 monthly          GBP
#> 11: 2024-11-01  M.GBP 0.8337900 monthly          GBP
#> 12: 2024-12-01  M.GBP 0.8280400 monthly          GBP
#> 13: 2025-01-01  M.GBP 0.8390809 monthly          GBP
#> 14: 2025-02-01  M.GBP 0.8307100 monthly          GBP
#> 15: 2025-03-01  M.GBP 0.8370252 monthly          GBP
#> 16: 2025-04-01  M.GBP 0.8537865 monthly          GBP
#> 17: 2025-05-01  M.GBP 0.8434952 monthly          GBP
#> 18: 2025-06-01  M.GBP 0.8498095 monthly          GBP
#> 19: 2025-07-01  M.GBP 0.8646870 monthly          GBP
#> 20: 2025-08-01  M.GBP 0.8652762 monthly          GBP
#> 21: 2025-09-01  M.GBP 0.8689455 monthly          GBP
#> 22: 2025-10-01  M.GBP 0.8715522 monthly          GBP
#> 23: 2025-11-01  M.GBP 0.8799650 monthly          GBP
#> 24: 2025-12-01  M.GBP 0.8750000 monthly          GBP
#> 25: 2026-01-01  M.GBP 0.8682810 monthly          GBP
#> 26: 2026-02-01  M.GBP 0.8703150 monthly          GBP
#> 27: 2026-03-01  M.GBP 0.8663109 monthly          GBP
#> 28: 2026-04-01  M.GBP 0.8693330 monthly          GBP
#> 29: 2026-05-01  M.GBP 0.8656480 monthly          GBP
#> 30: 2026-06-01  M.GBP 0.8637200 monthly          GBP
#> 31: 2026-07-01  M.GBP 0.8539152 monthly          GBP
#> 32: 2026-08-01  M.GBP 0.8560557 monthly          GBP
#> 33: 2026-09-01  M.GBP 0.8581250 monthly          GBP
#> 34: 2024-01-01  M.USD 1.0905000 monthly          USD
#> 35: 2024-02-01  M.USD 1.0795000 monthly          USD
#> 36: 2024-03-01  M.USD 1.0872000 monthly          USD
#> 37: 2024-04-01  M.USD 1.0728000 monthly          USD
#> 38: 2024-05-01  M.USD 1.0812000 monthly          USD
#> 39: 2024-06-01  M.USD 1.0759000 monthly          USD
#> 40: 2024-07-01  M.USD 1.0844000 monthly          USD
#> 41: 2024-08-01  M.USD 1.1012000 monthly          USD
#> 42: 2024-09-01  M.USD 1.1106000 monthly          USD
#> 43: 2024-10-01  M.USD 1.0904000 monthly          USD
#> 44: 2024-11-01  M.USD 1.0630000 monthly          USD
#> 45: 2024-12-01  M.USD 1.0479000 monthly          USD
#> 46: 2025-01-01  M.USD 1.0353727 monthly          USD
#> 47: 2025-02-01  M.USD 1.0412500 monthly          USD
#> 48: 2025-03-01  M.USD 1.0806810 monthly          USD
#> 49: 2025-04-01  M.USD 1.1213950 monthly          USD
#> 50: 2025-05-01  M.USD 1.1278048 monthly          USD
#> 51: 2025-06-01  M.USD 1.1516190 monthly          USD
#> 52: 2025-07-01  M.USD 1.1676870 monthly          USD
#> 53: 2025-08-01  M.USD 1.1631429 monthly          USD
#> 54: 2025-09-01  M.USD 1.1732227 monthly          USD
#> 55: 2025-10-01  M.USD 1.1630435 monthly          USD
#> 56: 2025-11-01  M.USD 1.1560200 monthly          USD
#> 57: 2025-12-01  M.USD 1.1708714 monthly          USD
#> 58: 2026-01-01  M.USD 1.1738238 monthly          USD
#> 59: 2026-02-01  M.USD 1.1823950 monthly          USD
#> 60: 2026-03-01  M.USD 1.1558318 monthly          USD
#> 61: 2026-04-01  M.USD 1.1706400 monthly          USD
#> 62: 2026-05-01  M.USD 1.1673200 monthly          USD
#> 63: 2026-06-01  M.USD 1.1518000 monthly          USD
#> 64: 2026-07-01  M.USD 1.1417478 monthly          USD
#> 65: 2026-08-01  M.USD 1.1593095 monthly          USD
#> 66: 2026-09-01  M.USD 1.1513227 monthly          USD
#>           date    key     value    freq exr_currency
#>         <Date> <char>     <num>  <char>       <char>

# fetch Belgian HICP inflation
nbb_data("DF_HICP_2025", "M.BE.000000.2025.HCP.GROWTH_RATE", last_n = 5L)
#>          date                              key   value    freq ref_area
#>        <Date>                           <char>   <num>  <char>   <char>
#> 1: 2026-05-01 M.BE.000000.2025.HCP.GROWTH_RATE 3.96418 monthly       BE
#> 2: 2026-06-01 M.BE.000000.2025.HCP.GROWTH_RATE 3.34435 monthly       BE
#> 3: 2026-07-01 M.BE.000000.2025.HCP.GROWTH_RATE 3.64536 monthly       BE
#> 4: 2026-08-01 M.BE.000000.2025.HCP.GROWTH_RATE 4.18822 monthly       BE
#> 5: 2026-09-01 M.BE.000000.2025.HCP.GROWTH_RATE 4.63074 monthly       BE
#>    nbb_coicop index_base index_type  derivation
#>        <char>     <char>     <char>      <char>
#> 1:     000000       2025        HCP GROWTH_RATE
#> 2:     000000       2025        HCP GROWTH_RATE
#> 3:     000000       2025        HCP GROWTH_RATE
#> 4:     000000       2025        HCP GROWTH_RATE
#> 5:     000000       2025        HCP GROWTH_RATE
# }
```
