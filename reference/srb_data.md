# Fetch Sveriges Riksbank (SRb) data

Retrieve time series data from the Sveriges Riksbank SWEA API.

## Usage

``` r
srb_data(series, start_date = NULL, end_date = NULL)
```

## Source

<https://developer.api.riksbank.se/>

## Arguments

- series:

  (`character(1)`)  
  The series ID to query. See
  [`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)
  for available series.

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

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md)

## Examples

``` r
# \donttest{
# fetch USD/SEK exchange rate
srb_data("SEKUSDPMI", start_date = "2024-01-01")
#>            date    series    value
#>          <Date>    <char>    <num>
#>   1: 2024-01-02 SEKUSDPMI 10.18118
#>   2: 2024-01-03 SEKUSDPMI 10.24956
#>   3: 2024-01-04 SEKUSDPMI 10.21684
#>   4: 2024-01-05 SEKUSDPMI 10.28752
#>   5: 2024-01-08 SEKUSDPMI 10.24073
#>  ---                              
#> 551: 2026-03-16 SEKUSDPMI  9.38230
#> 552: 2026-03-17 SEKUSDPMI  9.28410
#> 553: 2026-03-18 SEKUSDPMI  9.37200
#> 554: 2026-03-19 SEKUSDPMI  9.40595
#> 555: 2026-03-20 SEKUSDPMI  9.33146

# fetch EUR/SEK exchange rate
srb_data("SEKEURPMI", start_date = "2024-01-01")
#>            date    series   value
#>          <Date>    <char>   <num>
#>   1: 2024-01-02 SEKEURPMI 11.1545
#>   2: 2024-01-03 SEKEURPMI 11.1915
#>   3: 2024-01-04 SEKEURPMI 11.1905
#>   4: 2024-01-05 SEKEURPMI 11.2350
#>   5: 2024-01-08 SEKEURPMI 11.2095
#>  ---                             
#> 551: 2026-03-16 SEKEURPMI 10.7690
#> 552: 2026-03-17 SEKEURPMI 10.7055
#> 553: 2026-03-18 SEKEURPMI 10.7778
#> 554: 2026-03-19 SEKEURPMI 10.8065
#> 555: 2026-03-20 SEKEURPMI 10.7825
# }
```
