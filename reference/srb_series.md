# Fetch Sveriges Riksbank (SRb) series metadata

Retrieve available series or group metadata from the Sveriges Riksbank
SWEA API.

## Usage

``` r
srb_series(type = "series")
```

## Source

<https://developer.api.riksbank.se/>

## Arguments

- type:

  (`character(1)`)  
  The type of metadata to query. One of `"series"` or `"groups"`.
  Default `"series"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested metadata.

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_domains()`](https://m-muecke.github.io/bbk/reference/bdp_domains.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
[`ecb_dimension()`](https://m-muecke.github.io/bbk/reference/ecb_dimension.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`nob_dimension()`](https://m-muecke.github.io/bbk/reference/nob_dimension.md),
[`nob_metadata()`](https://m-muecke.github.io/bbk/reference/nob_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md),
[`snb_dimension()`](https://m-muecke.github.io/bbk/reference/snb_dimension.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md)

## Examples

``` r
# \donttest{
srb_series()
#>          series_id                                   source
#>             <char>                                   <char>
#>   1:   SECBREPOEFF                        Sveriges Riksbank
#>   2:   SECBDEPOEFF                        Sveriges Riksbank
#>   3:   SECBLENDEFF                        Sveriges Riksbank
#>   4:   SECBLIKVEFF                        Sveriges Riksbank
#>   5:   SECBMARGEFF                        Sveriges Riksbank
#>  ---                                                       
#> 113:     SEKZARPMI                        Sveriges Riksbank
#> 114:        SEKSDR        International Monetary Fund (IMF)
#> 115:      SEKKIX92  National Institute of Economic Research
#> 116: SEKUSDFO3MFIX Bank for International Settlements (BIS)
#> 117: SEKUSDFO6MFIX Bank for International Settlements (BIS)
#>                     short_description                           mid_description
#>                                <char>                                    <char>
#>   1:                      Policy rate                               Policy rate
#>   2:                     Deposit rate                              Deposit rate
#>   3:                     Lending rate                              Lending rate
#>   4:          Liquidity facility rate                   Liquidity facility rate
#>   5:                    Marginal rate                             Marginal rate
#>  ---                                                                           
#> 113:                              ZAR                    ZAR South Africa, rand
#> 114:                              SDR      SDR Special Drawing Rights (SEK/SDR)
#> 115:                        KIX-index                         Svenskt KIX-index
#> 116: SEK/USD Forward Premium 3 Months SEK/USD Forward Premium Maturity 3-Months
#> 117: SEK/USD Forward Premium 6 Months SEK/USD Forward Premium Maturity 6-Months
#>                                                                                                                                                                                                                                                                                                            long_description
#>                                                                                                                                                                                                                                                                                                                      <char>
#>   1:                                                                           The policy rate is the interest rate at which the banks can borrow or deposit in the Riksbank over a 7-day period. The policy rate is the Riksbank's most important key rate.\nThe policy rate was called The repo rate until June 8, 2022. 
#>   2: The deposit rate is the rate of interest banks receive when they deposit funds in their accounts at the Riksbank overnight and is always 0.75 percentage points lower than the policy rate. The deposit rate is the floor of what is known as the interest rate corridor and is one of the Riksbank's three key rates.
#>   3:                           The lending rate is the rate of interest banks pay when they borrow overnight funds from the Riksbank and is always 0.75 percentage points higher than the policy rate. The lending rate is known as the ceiling of the interest rate corridor and is one of the Riksbank's three key rates.
#>   4:                                                                                     The liquidity facility rate is the interest rate for the lending that the Riksbank offers to the banks in the supplementary liquidity facility. This interest rate is currently 0.75 percentage points higher than the policy rate
#>   5:                                                                                         The marginal rate was the Riksbank's key rate from December 1985 until the end of May 1994. The marginal rate was the rate at which banks could marginally borrow from or deposit in the Riksbank in the interest rate ladder.
#>  ---                                                                                                                                                                                                                                                                                                                       
#> 113:                                                                                                                                                                                                                                                                                                     South African rand
#> 114:                                                                                                                                                                                                                                                                                       Special Drawing Rights (SEK/SDR)
#> 115:                                                                                                                                                                                                                                                                                                      Svenskt KIX-index
#> 116:                                                                                                                                                                                                                                                                              SEK/USD Forward Premium Maturity 3-Months
#> 117:                                                                                                                                                                                                                                                                              SEK/USD Forward Premium Maturity 6-Months
#>      group_id observation_max_date observation_min_date series_closed
#>         <int>               <char>               <char>        <lgcl>
#>   1:        2           2026-04-02           1994-06-01         FALSE
#>   2:        2           2026-04-02           1994-06-01         FALSE
#>   3:        2           2026-04-02           1994-06-01         FALSE
#>   4:        2           2026-04-02           2022-06-08         FALSE
#>   5:        2           1994-05-31           1987-01-30          TRUE
#>  ---                                                                 
#> 113:      130           2026-04-02           1994-03-01         FALSE
#> 114:      138           2026-04-02           2011-06-27         FALSE
#> 115:      151           2026-04-02           1992-11-18         FALSE
#> 116:      155           2026-04-02           1980-01-02         FALSE
#> 117:      155           2026-04-02           1980-01-02         FALSE
# }
```
