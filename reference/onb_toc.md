# Fetch Österreichische Nationalbank (OeNB) table of contents

Fetch Österreichische Nationalbank (OeNB) table of contents

## Usage

``` r
onb_toc(lang = "en")
```

## Arguments

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
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
[`snb_dimension()`](https://m-muecke.github.io/bbk/reference/snb_dimension.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
onb_toc()
#>            id parent
#>         <int>  <int>
#>  1:         1      0
#>  2:        11      1
#>  3:        18      1
#>  4:        13      1
#>  5:        14      1
#>  6: 100140001     14
#>  7: 100140002     14
#>  8:         2      0
#>  9:        22      2
#> 10:        23      2
#> 11:        24      2
#> 12:        25      2
#> 13:      2502     25
#> 14:      2503     25
#> 15:      2504     25
#> 16:         3      0
#> 17:        31      3
#> 18:      3101     31
#> 19:       318     31
#> 20:       321     31
#> 21:      3102     31
#> 22:      3103     31
#> 23:      3104     31
#> 24:        32      3
#> 25:        33      3
#> 26:        34      3
#> 27:        35      3
#> 28:         4      0
#> 29:        41      4
#> 30:         6      0
#> 31:         7      0
#> 32:        74      7
#> 33:        75      7
#> 34:         8      0
#> 35:         9      0
#> 36:       901      9
#> 37:       902      9
#> 38:       904      9
#> 39:       905      9
#> 40:        97      9
#>            id parent
#>         <int>  <int>
#>                                                                                      description
#>                                                                                           <char>
#>  1:                                                     OeNB, Eurosystem and monetary indicators
#>  2:                                     Balance sheet items of the Oesterreichische Nationalbank
#>  3:                                        International reserves and foreign currency liquidity
#>  4:                                          Monetary aggregates, consolidated MFI balance sheet
#>  5:                                                                   Loans and deposits of MFIs
#>  6:                                                                         Development of loans
#>  7:                                                                   Loans and deposits of MFIs
#>  8:                                                            Interest rates and exchange rates
#>  9:                          Euro area money market interest rates and Eurosystem Interest Rates
#> 10:                                                        Interest rates of credit institutions
#> 11:                                                              Austrian government bond yields
#> 12:                                                                               Exchange rates
#> 13:                                                  Effective exchange rate indices of the Euro
#> 14:                                                                          ECB reference rates
#> 15:                                               Currencies and foreign exchange rates in other
#> 16:                                                                       Financial institutions
#> 17:                                                                                        Banks
#> 18:                                      Balance Sheet and Profit & Loss Account - Selected Data
#> 19:                                                               Building and Loan Associations
#> 20:                                                                              Number of Banks
#> 21:                                                                              Severance Funds
#> 22: Foreign subsidiaries, which are fully consolidated by Austrian groups of credit institutions
#> 23:                  Aggregated regulatory capital requirements, financial and income statements
#> 24:                                                                                 Mutual funds
#> 25:                                                                                Pension funds
#> 26:                                                                          Insurance companies
#> 27:                                Instruments subject to credit risk in accordance with FinStab
#> 28:                                                                                   Securities
#> 29:                                                                              Debt securities
#> 30:                                                                      Prices, competitiveness
#> 31:                                                             Economic and industry indicators
#> 32:                                                                           General government
#> 33:                                                                          Economic indicators
#> 34:                                                                           Financial accounts
#> 35:                                                                              External sector
#> 36:                                    Balance of payments and International Investment Position
#> 37:                                                                            Direct investment
#> 38:                                                                         Portfolio investment
#> 39:                                                                             Other investment
#> 40:                                                                    Foreign trade and tourism
#>                                                                                      description
#>                                                                                           <char>
# }
```
