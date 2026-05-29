# Fetch Bank for International Settlements (BIS) data

Retrieve time series data from the BIS SDMX Web Service.

## Usage

``` r
bis_data(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL,
  updated_after = NULL
)
```

## Source

<https://stats.bis.org/api-doc/v1/>

## Arguments

- flow:

  (`character(1)`)  
  The dataflow to query. See
  [`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md)
  for available dataflows.

- key:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  The series keys to query using dot-separated dimension values (e.g.,
  `"M.CH"`). Use `+` for multiple values in one dimension (e.g.,
  `"M.CH+US"`). If `NULL`, all data for the flow is returned. Default
  `NULL`.

- start_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  Start date of the data. Supported formats:

  - YYYY for annual data (e.g., `2019`)

  - YYYY-S\[1-2\] for semi-annual data (e.g., `"2019-S1"`)

  - YYYY-Q\[1-4\] for quarterly data (e.g., `"2019-Q1"`)

  - YYYY-MM for monthly data (e.g., `"2019-01"`)

  - YYYY-MM-DD for daily data (e.g., `"2019-01-01"`)

  If `NULL`, no start date restriction is applied (data retrieved from
  the earliest available date). Default `NULL`.

- end_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  End date of the data, in the same format as start_period. If `NULL`,
  no end date restriction is applied (data retrieved up to the most
  recent available date). Default `NULL`.

- first_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the start of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

- last_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the end of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

- updated_after:

  (`NULL` \| `character(1)` \| `Date(1)` \| `POSIXct(1)`)  
  Retrieve only observations updated after the given timestamp (e.g.,
  `"2024-06-01T00:00:00"`). Useful for incremental retrieval. If `NULL`,
  no restriction is applied. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

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
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
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
# fetch Swiss central bank policy rate
bis_data("WS_CBPOL", "M.CH", last_n = 5L)
#>          date    key value    freq
#>        <Date> <char> <num>  <char>
#> 1: 2025-12-01   M.CH     0 monthly
#> 2: 2026-01-01   M.CH     0 monthly
#> 3: 2026-02-01   M.CH     0 monthly
#> 4: 2026-03-01   M.CH     0 monthly
#> 5: 2026-04-01   M.CH     0 monthly
#>                                                                title ref_area
#>                                                               <char>   <char>
#> 1: Central bank policy rates - Switzerland - Monthly - End of period       CH
#> 2: Central bank policy rates - Switzerland - Monthly - End of period       CH
#> 3: Central bank policy rates - Switzerland - Monthly - End of period       CH
#> 4: Central bank policy rates - Switzerland - Monthly - End of period       CH
#> 5: Central bank policy rates - Switzerland - Monthly - End of period       CH
#>             source_ref
#>                 <char>
#> 1: Swiss National Bank
#> 2: Swiss National Bank
#> 3: Swiss National Bank
#> 4: Swiss National Bank
#> 5: Swiss National Bank
#>                                                                                                                                                     compilation
#>                                                                                                                                                          <char>
#> 1: From 13 June 2019 onwards SNB Policy rate; From 1 Jan 2000 to 12 June 2019 mid-point of the SNB target range; from 1 Jan 1946 to 31 Dec 1999: discount rate.
#> 2: From 13 June 2019 onwards SNB Policy rate; From 1 Jan 2000 to 12 June 2019 mid-point of the SNB target range; from 1 Jan 1946 to 31 Dec 1999: discount rate.
#> 3: From 13 June 2019 onwards SNB Policy rate; From 1 Jan 2000 to 12 June 2019 mid-point of the SNB target range; from 1 Jan 1946 to 31 Dec 1999: discount rate.
#> 4: From 13 June 2019 onwards SNB Policy rate; From 1 Jan 2000 to 12 June 2019 mid-point of the SNB target range; from 1 Jan 1946 to 31 Dec 1999: discount rate.
#> 5: From 13 June 2019 onwards SNB Policy rate; From 1 Jan 2000 to 12 June 2019 mid-point of the SNB target range; from 1 Jan 1946 to 31 Dec 1999: discount rate.
#>    decimals
#>      <char>
#> 1:        4
#> 2:        4
#> 3:        4
#> 4:        4
#> 5:        4

# fetch effective exchange rates
bis_data("WS_EER", "M.N.B.CH", start_period = "2020-01")
#>           date      key  value    freq
#>         <Date>   <char>  <num>  <char>
#>  1: 2020-01-01 M.N.B.CH  96.94 monthly
#>  2: 2020-02-01 M.N.B.CH  97.70 monthly
#>  3: 2020-03-01 M.N.B.CH 100.28 monthly
#>  4: 2020-04-01 M.N.B.CH 100.64 monthly
#>  5: 2020-05-01 M.N.B.CH 100.44 monthly
#>  6: 2020-06-01 M.N.B.CH  99.91 monthly
#>  7: 2020-07-01 M.N.B.CH 100.50 monthly
#>  8: 2020-08-01 M.N.B.CH 100.98 monthly
#>  9: 2020-09-01 M.N.B.CH 100.74 monthly
#> 10: 2020-10-01 M.N.B.CH 101.12 monthly
#> 11: 2020-11-01 M.N.B.CH 100.18 monthly
#> 12: 2020-12-01 M.N.B.CH 100.58 monthly
#> 13: 2021-01-01 M.N.B.CH 100.46 monthly
#> 14: 2021-02-01 M.N.B.CH  99.39 monthly
#> 15: 2021-03-01 M.N.B.CH  97.46 monthly
#> 16: 2021-04-01 M.N.B.CH  98.01 monthly
#> 17: 2021-05-01 M.N.B.CH  98.82 monthly
#> 18: 2021-06-01 M.N.B.CH  98.70 monthly
#> 19: 2021-07-01 M.N.B.CH  99.16 monthly
#> 20: 2021-08-01 M.N.B.CH  99.79 monthly
#> 21: 2021-09-01 M.N.B.CH  98.86 monthly
#> 22: 2021-10-01 M.N.B.CH  99.86 monthly
#> 23: 2021-11-01 M.N.B.CH 101.31 monthly
#> 24: 2021-12-01 M.N.B.CH 102.56 monthly
#> 25: 2022-01-01 M.N.B.CH 102.31 monthly
#> 26: 2022-02-01 M.N.B.CH 101.85 monthly
#> 27: 2022-03-01 M.N.B.CH 103.73 monthly
#> 28: 2022-04-01 M.N.B.CH 103.27 monthly
#> 29: 2022-05-01 M.N.B.CH 101.97 monthly
#> 30: 2022-06-01 M.N.B.CH 103.42 monthly
#> 31: 2022-07-01 M.N.B.CH 106.23 monthly
#> 32: 2022-08-01 M.N.B.CH 108.08 monthly
#> 33: 2022-09-01 M.N.B.CH 108.96 monthly
#> 34: 2022-10-01 M.N.B.CH 107.84 monthly
#> 35: 2022-11-01 M.N.B.CH 108.26 monthly
#> 36: 2022-12-01 M.N.B.CH 108.89 monthly
#> 37: 2023-01-01 M.N.B.CH 107.95 monthly
#> 38: 2023-02-01 M.N.B.CH 108.59 monthly
#> 39: 2023-03-01 M.N.B.CH 108.80 monthly
#> 40: 2023-04-01 M.N.B.CH 110.37 monthly
#> 41: 2023-05-01 M.N.B.CH 111.34 monthly
#> 42: 2023-06-01 M.N.B.CH 111.88 monthly
#> 43: 2023-07-01 M.N.B.CH 114.27 monthly
#> 44: 2023-08-01 M.N.B.CH 115.21 monthly
#> 45: 2023-09-01 M.N.B.CH 114.66 monthly
#> 46: 2023-10-01 M.N.B.CH 115.03 monthly
#> 47: 2023-11-01 M.N.B.CH 114.46 monthly
#> 48: 2023-12-01 M.N.B.CH 116.73 monthly
#> 49: 2024-01-01 M.N.B.CH 117.91 monthly
#> 50: 2024-02-01 M.N.B.CH 116.59 monthly
#> 51: 2024-03-01 M.N.B.CH 114.67 monthly
#> 52: 2024-04-01 M.N.B.CH 113.33 monthly
#> 53: 2024-05-01 M.N.B.CH 112.66 monthly
#> 54: 2024-06-01 M.N.B.CH 115.10 monthly
#> 55: 2024-07-01 M.N.B.CH 114.82 monthly
#> 56: 2024-08-01 M.N.B.CH 117.76 monthly
#> 57: 2024-09-01 M.N.B.CH 118.14 monthly
#> 58: 2024-10-01 M.N.B.CH 118.04 monthly
#> 59: 2024-11-01 M.N.B.CH 117.94 monthly
#> 60: 2024-12-01 M.N.B.CH 117.63 monthly
#> 61: 2025-01-01 M.N.B.CH 116.46 monthly
#> 62: 2025-02-01 M.N.B.CH 116.23 monthly
#> 63: 2025-03-01 M.N.B.CH 116.17 monthly
#> 64: 2025-04-01 M.N.B.CH 120.54 monthly
#> 65: 2025-05-01 M.N.B.CH 120.15 monthly
#> 66: 2025-06-01 M.N.B.CH 120.71 monthly
#> 67: 2025-07-01 M.N.B.CH 122.23 monthly
#> 68: 2025-08-01 M.N.B.CH 121.39 monthly
#> 69: 2025-09-01 M.N.B.CH 122.16 monthly
#> 70: 2025-10-01 M.N.B.CH 122.66 monthly
#> 71: 2025-11-01 M.N.B.CH 122.48 monthly
#> 72: 2025-12-01 M.N.B.CH 122.38 monthly
#> 73: 2026-01-01 M.N.B.CH 122.86 monthly
#> 74: 2026-02-01 M.N.B.CH 124.69 monthly
#> 75: 2026-03-01 M.N.B.CH 124.70 monthly
#> 76: 2026-04-01 M.N.B.CH 123.32 monthly
#>           date      key  value    freq
#>         <Date>   <char>  <num>  <char>
#>                                            title eer_type eer_basket ref_area
#>                                           <char>   <char>     <char>   <char>
#>  1: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#>  2: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#>  3: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#>  4: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#>  5: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#>  6: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#>  7: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#>  8: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#>  9: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 10: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 11: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 12: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 13: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 14: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 15: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 16: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 17: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 18: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 19: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 20: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 21: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 22: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 23: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 24: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 25: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 26: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 27: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 28: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 29: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 30: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 31: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 32: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 33: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 34: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 35: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 36: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 37: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 38: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 39: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 40: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 41: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 42: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 43: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 44: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 45: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 46: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 47: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 48: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 49: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 50: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 51: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 52: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 53: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 54: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 55: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 56: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 57: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 58: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 59: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 60: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 61: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 62: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 63: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 64: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 65: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 66: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 67: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 68: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 69: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 70: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 71: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 72: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 73: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 74: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 75: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#> 76: Switzerland - Nominal - Broad (64 economies)        N          B       CH
#>                                            title eer_type eer_basket ref_area
#>                                           <char>   <char>     <char>   <char>
#>     collection                                     title_ts
#>         <char>                                       <char>
#>  1:          A Switzerland - Nominal - Broad (64 economies)
#>  2:          A Switzerland - Nominal - Broad (64 economies)
#>  3:          A Switzerland - Nominal - Broad (64 economies)
#>  4:          A Switzerland - Nominal - Broad (64 economies)
#>  5:          A Switzerland - Nominal - Broad (64 economies)
#>  6:          A Switzerland - Nominal - Broad (64 economies)
#>  7:          A Switzerland - Nominal - Broad (64 economies)
#>  8:          A Switzerland - Nominal - Broad (64 economies)
#>  9:          A Switzerland - Nominal - Broad (64 economies)
#> 10:          A Switzerland - Nominal - Broad (64 economies)
#> 11:          A Switzerland - Nominal - Broad (64 economies)
#> 12:          A Switzerland - Nominal - Broad (64 economies)
#> 13:          A Switzerland - Nominal - Broad (64 economies)
#> 14:          A Switzerland - Nominal - Broad (64 economies)
#> 15:          A Switzerland - Nominal - Broad (64 economies)
#> 16:          A Switzerland - Nominal - Broad (64 economies)
#> 17:          A Switzerland - Nominal - Broad (64 economies)
#> 18:          A Switzerland - Nominal - Broad (64 economies)
#> 19:          A Switzerland - Nominal - Broad (64 economies)
#> 20:          A Switzerland - Nominal - Broad (64 economies)
#> 21:          A Switzerland - Nominal - Broad (64 economies)
#> 22:          A Switzerland - Nominal - Broad (64 economies)
#> 23:          A Switzerland - Nominal - Broad (64 economies)
#> 24:          A Switzerland - Nominal - Broad (64 economies)
#> 25:          A Switzerland - Nominal - Broad (64 economies)
#> 26:          A Switzerland - Nominal - Broad (64 economies)
#> 27:          A Switzerland - Nominal - Broad (64 economies)
#> 28:          A Switzerland - Nominal - Broad (64 economies)
#> 29:          A Switzerland - Nominal - Broad (64 economies)
#> 30:          A Switzerland - Nominal - Broad (64 economies)
#> 31:          A Switzerland - Nominal - Broad (64 economies)
#> 32:          A Switzerland - Nominal - Broad (64 economies)
#> 33:          A Switzerland - Nominal - Broad (64 economies)
#> 34:          A Switzerland - Nominal - Broad (64 economies)
#> 35:          A Switzerland - Nominal - Broad (64 economies)
#> 36:          A Switzerland - Nominal - Broad (64 economies)
#> 37:          A Switzerland - Nominal - Broad (64 economies)
#> 38:          A Switzerland - Nominal - Broad (64 economies)
#> 39:          A Switzerland - Nominal - Broad (64 economies)
#> 40:          A Switzerland - Nominal - Broad (64 economies)
#> 41:          A Switzerland - Nominal - Broad (64 economies)
#> 42:          A Switzerland - Nominal - Broad (64 economies)
#> 43:          A Switzerland - Nominal - Broad (64 economies)
#> 44:          A Switzerland - Nominal - Broad (64 economies)
#> 45:          A Switzerland - Nominal - Broad (64 economies)
#> 46:          A Switzerland - Nominal - Broad (64 economies)
#> 47:          A Switzerland - Nominal - Broad (64 economies)
#> 48:          A Switzerland - Nominal - Broad (64 economies)
#> 49:          A Switzerland - Nominal - Broad (64 economies)
#> 50:          A Switzerland - Nominal - Broad (64 economies)
#> 51:          A Switzerland - Nominal - Broad (64 economies)
#> 52:          A Switzerland - Nominal - Broad (64 economies)
#> 53:          A Switzerland - Nominal - Broad (64 economies)
#> 54:          A Switzerland - Nominal - Broad (64 economies)
#> 55:          A Switzerland - Nominal - Broad (64 economies)
#> 56:          A Switzerland - Nominal - Broad (64 economies)
#> 57:          A Switzerland - Nominal - Broad (64 economies)
#> 58:          A Switzerland - Nominal - Broad (64 economies)
#> 59:          A Switzerland - Nominal - Broad (64 economies)
#> 60:          A Switzerland - Nominal - Broad (64 economies)
#> 61:          A Switzerland - Nominal - Broad (64 economies)
#> 62:          A Switzerland - Nominal - Broad (64 economies)
#> 63:          A Switzerland - Nominal - Broad (64 economies)
#> 64:          A Switzerland - Nominal - Broad (64 economies)
#> 65:          A Switzerland - Nominal - Broad (64 economies)
#> 66:          A Switzerland - Nominal - Broad (64 economies)
#> 67:          A Switzerland - Nominal - Broad (64 economies)
#> 68:          A Switzerland - Nominal - Broad (64 economies)
#> 69:          A Switzerland - Nominal - Broad (64 economies)
#> 70:          A Switzerland - Nominal - Broad (64 economies)
#> 71:          A Switzerland - Nominal - Broad (64 economies)
#> 72:          A Switzerland - Nominal - Broad (64 economies)
#> 73:          A Switzerland - Nominal - Broad (64 economies)
#> 74:          A Switzerland - Nominal - Broad (64 economies)
#> 75:          A Switzerland - Nominal - Broad (64 economies)
#> 76:          A Switzerland - Nominal - Broad (64 economies)
#>     collection                                     title_ts
#>         <char>                                       <char>
# }
```
