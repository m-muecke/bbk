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
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md)

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
#> 14:         3      0
#> 15:        31      3
#> 16:      3101     31
#> 17:       318     31
#> 18:       321     31
#> 19:      3102     31
#> 20:      3103     31
#> 21:      3104     31
#> 22:        32      3
#> 23:        33      3
#> 24:        34      3
#> 25:        35      3
#> 26:         4      0
#> 27:        41      4
#> 28:         6      0
#> 29:         7      0
#> 30:        74      7
#> 31:        75      7
#> 32:         8      0
#> 33:         9      0
#> 34:       901      9
#> 35:       902      9
#> 36:       904      9
#> 37:       905      9
#> 38:        97      9
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
#> 14:                                                                       Financial institutions
#> 15:                                                                                        Banks
#> 16:                                      Balance Sheet and Profit & Loss Account - Selected Data
#> 17:                                                               Building and Loan Associations
#> 18:                                                                              Number of Banks
#> 19:                                                                              Severance Funds
#> 20: Foreign subsidiaries, which are fully consolidated by Austrian groups of credit institutions
#> 21:                  Aggregated regulatory capital requirements, financial and income statements
#> 22:                                                                                 Mutual funds
#> 23:                                                                                Pension funds
#> 24:                                                                          Insurance companies
#> 25:                                Instruments subject to credit risk in accordance with FinStab
#> 26:                                                                                   Securities
#> 27:                                                                              Debt securities
#> 28:                                                                      Prices, competitiveness
#> 29:                                                             Economic and industry indicators
#> 30:                                                                           General government
#> 31:                                                                          Economic indicators
#> 32:                                                                           Financial accounts
#> 33:                                                                              External sector
#> 34:                                    Balance of payments and International Investment Position
#> 35:                                                                            Direct investment
#> 36:                                                                         Portfolio investment
#> 37:                                                                             Other investment
#> 38:                                                                    Foreign trade and tourism
#>                                                                                      description
#>                                                                                           <char>
# }
```
