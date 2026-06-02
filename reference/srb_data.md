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
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
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
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md)

## Examples

``` r
# \donttest{
# fetch USD/SEK exchange rate
srb_data("SEKUSDPMI", start_date = "2024-01-01")
#>            date       key    value
#>          <Date>    <char>    <num>
#>   1: 2024-01-02 SEKUSDPMI 10.18118
#>   2: 2024-01-03 SEKUSDPMI 10.24956
#>   3: 2024-01-04 SEKUSDPMI 10.21684
#>   4: 2024-01-05 SEKUSDPMI 10.28752
#>   5: 2024-01-08 SEKUSDPMI 10.24073
#>  ---                              
#> 598: 2026-05-26 SEKUSDPMI  9.30419
#> 599: 2026-05-27 SEKUSDPMI  9.27172
#> 600: 2026-05-28 SEKUSDPMI  9.31523
#> 601: 2026-05-29 SEKUSDPMI  9.25112
#> 602: 2026-06-01 SEKUSDPMI  9.26413

# fetch EUR/SEK exchange rate
srb_data("SEKEURPMI", start_date = "2024-01-01")
#> Waiting 60s for retry backoff ■                               
#> Waiting 60s for retry backoff ■■                              
#> Waiting 60s for retry backoff ■■■                             
#> Waiting 60s for retry backoff ■■■■■                           
#> Waiting 60s for retry backoff ■■■■■■                          
#> Waiting 60s for retry backoff ■■■■■■■■                        
#> Waiting 60s for retry backoff ■■■■■■■■■                       
#> Waiting 60s for retry backoff ■■■■■■■■■■■                     
#> Waiting 60s for retry backoff ■■■■■■■■■■■■                    
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■                  
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■                 
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■               
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■              
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■■■            
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■■■■           
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■         
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■        
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■      
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■     
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> Waiting 60s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
#>            date       key   value
#>          <Date>    <char>   <num>
#>   1: 2024-01-02 SEKEURPMI 11.1545
#>   2: 2024-01-03 SEKEURPMI 11.1915
#>   3: 2024-01-04 SEKEURPMI 11.1905
#>   4: 2024-01-05 SEKEURPMI 11.2350
#>   5: 2024-01-08 SEKEURPMI 11.2095
#>  ---                             
#> 598: 2026-05-26 SEKEURPMI 10.8245
#> 599: 2026-05-27 SEKEURPMI 10.7895
#> 600: 2026-05-28 SEKEURPMI 10.8215
#> 601: 2026-05-29 SEKEURPMI 10.7720
#> 602: 2026-06-01 SEKEURPMI 10.7890
# }
```
