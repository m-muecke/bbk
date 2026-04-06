# Fetch Banco de Portugal (BdP) domains

Retrieve the list of available statistical domains from the BPstat API.

## Usage

``` r
bdp_domains(lang = "EN")
```

## Source

<https://bpstat.bportugal.pt/data/docs>

## Arguments

- lang:

  (`character(1)`)  
  Language for labels, either `"EN"` or `"PT"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with available domains.

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
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
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
bdp_domains()
#>        id parent_id
#>     <int>     <int>
#>  1:     1        11
#>  2:     2        NA
#>  3:     3         2
#>  4:     4         2
#>  5:     5       160
#>  6:     6         2
#>  7:     8        NA
#>  8:     9        NA
#>  9:    10        16
#> 10:    11        NA
#> 11:    12        40
#> 12:    13        43
#> 13:    14        NA
#> 14:    15        NA
#> 15:    16        NA
#> 16:    18        NA
#> 17:    19        14
#> 18:    20        NA
#> 19:    21        14
#> 20:    22       130
#> 21:    23        14
#> 22:    24        14
#> 23:    26        15
#> 24:    27        16
#> 25:    28        16
#> 26:    29        15
#> 27:    30        40
#> 28:    31        11
#> 29:    32        11
#> 30:    36        16
#> 31:    37        NA
#> 32:    38        40
#> 33:    39        40
#> 34:    40        NA
#> 35:    41        40
#> 36:    43        NA
#> 37:    44        43
#> 38:    45        11
#> 39:    47        37
#> 40:    48        37
#> 41:    49        37
#> 42:    50        37
#> 43:    51        37
#> 44:    52        37
#> 45:    53        37
#> 46:    54        11
#> 47:    55        11
#> 48:    56        11
#> 49:    58        11
#> 50:    59        NA
#> 51:   128        16
#> 52:   130        NA
#> 53:   131       130
#> 54:   134        11
#> 55:   139        43
#> 56:   160        NA
#> 57:   161       160
#> 58:   162       160
#> 59:   163        11
#> 60:   167        NA
#> 61:   168       167
#> 62:   169       167
#> 63:   170       167
#> 64:   172        16
#> 65:   178       190
#> 66:   179        11
#> 67:   181        11
#> 68:   186        14
#> 69:   188       190
#> 70:   189       190
#> 71:   190        NA
#> 72:   194        15
#> 73:   203        15
#> 74:   204        15
#> 75:   206       190
#> 76:   207        14
#> 77:   209        14
#>        id parent_id
#>     <int>     <int>
#>                                                                                                                        label
#>                                                                                                                       <char>
#>  1:                                                                                              National financial accounts
#>  2:                                                                                                      External statistics
#>  3:                                                                                                      Balance of payments
#>  4:                                                                                        International investment position
#>  5:                                                                 International banking statistics on a consolidated basis
#>  6:                                                                                                   International reserves
#>  7:                                                                                          Payment systems and instruments
#>  8:                                                                                                            Cash issuance
#>  9:                                                                                                           Budget Outturn
#> 10:                                                                                                        National accounts
#> 11:                                                                                                     Consumer price index
#> 12:                                                                                  Population, employment and unemployment
#> 13:                                                                                                   Monetary and financial
#> 14:                                                                                                        Financial markets
#> 15:                                                                                                       General government
#> 16:                                                                                 Indebtedness of the non-financial sector
#> 17:                                                                           Monetary financial institutions' balance sheet
#> 18:                                                                                               Banking system information
#> 19:                                                                                                           Interest rates
#> 20:                                                                                                             Money market
#> 21: Other financial intermediaries, financial auxiliaries and captive financial institutions and money lenders balance sheet
#> 22:                                                                                           Investment funds balance sheet
#> 23:                                                                                                         Secondary market
#> 24:                                                                                             General government financing
#> 25:                                                                                                  General government debt
#> 26:                                                                                                           Exchange rates
#> 27:                                                                                     Real effective exchange rate indices
#> 28:                                          Time-series for the Portuguese economy - GDP and main components of expenditure
#> 29:                                                                Time-series for the Portuguese economy - Household wealth
#> 30:                                                       General government interventions to support financial institutions
#> 31:                                                                                             Economic activity indicators
#> 32:                                                                                                         Commodity prices
#> 33:                                                                                                           Housing prices
#> 34:                                                                                                                   Prices
#> 35:                                                                                      Harmonised index of consumer prices
#> 36:                                                                                             Population and labour market
#> 37:                                                                                            Labour costs and productivity
#> 38:                                                     Time-series for the Portuguese economy - Household disposable income
#> 39:                                                                                                    Confidence indicators
#> 40:                                                                                                    Coincident indicators
#> 41:                                                                                     Sectorial indicators - Manufacturing
#> 42:                                                                                             Sectorial indicators - Trade
#> 43:                                                                                          Sectorial indicators - Services
#> 44:                                                                                       Sectoral indicators - Construction
#> 45:                                                                                             International trade of goods
#> 46:                                                                                                 GDP Expenditure approach
#> 47:                                                                                                  GDP Production approach
#> 48:                                                                                               Net Lending/Net Borrowing 
#> 49:                                                                                                        Income and saving
#> 50:                                                                                           Financial stability indicators
#> 51:                                                                                    General government financial accounts
#> 52:                                                                                                          Monetary policy
#> 53:                                                                                                              Instruments
#> 54:                                          Time-series for the Portuguese economy - Employment (national accounts concept)
#> 55:                                       Time-series for the Portuguese economy - Labour force, employment and unemployment
#> 56:                                                                                                 Globalisation statistics
#> 57:                                                                        Foreign Direct Investment - Directional Principle
#> 58:                                                                            Foreign Direct Investment - Ultimate Investor
#> 59:                                                              National financial accounts - Interlinkages between sectors
#> 60:                                                                     Corporations from the central balance-sheet database
#> 61:                                                              Quarterly economic and financial indicators of corporations
#> 62:                                                                 Annual economic and financial indicators of corporations
#> 63:                                                                                            Central balance-sheet studies
#> 64:                                                                             Non-financial accounts of General government
#> 65:                                                              Economic and financial indicators of corporations by region
#> 66:                                                                                             Investment and capital stock
#> 67:                                                                                              National accounts deflators
#> 68:                                                                                                 Loans for house purchase
#> 69:                                                                                                                    Loans
#> 70:                                                                                                 Inward direct investment
#> 71:                                                                                                      Regional statistics
#> 72:                                                                                                        Securities issues
#> 73:                                                                                            Nominal exchange rate indices
#> 74:                                                                                                     Securities holdings 
#> 75:                                                                                                                 Deposits
#> 76:                                                                            Interest rates by sector of economic activity
#> 77:                                                                                                          Consumer credit
#>                                                                                                                        label
#>                                                                                                                       <char>
#>        short_label has_series num_series num_datasets
#>             <char>     <lgcl>      <int>        <int>
#>  1:             FA       TRUE      16644            1
#>  2:             ES      FALSE         NA           NA
#>  3:            BOP       TRUE       6673            8
#>  4:            IIP       TRUE       4746            5
#>  5:           EBIS       TRUE        799            4
#>  6:            IRS       TRUE        378            2
#>  7:             PS       TRUE        399           19
#>  8:            BCS       TRUE        323            2
#>  9:             BO       TRUE        128            1
#> 10:             NA      FALSE         NA           NA
#> 11:            CPI       TRUE        134            4
#> 12:            PEU       TRUE        517           10
#> 13:             MF      FALSE         NA           NA
#> 14:            ERS      FALSE         NA           NA
#> 15:            GGS      FALSE         NA           NA
#> 16:         IndNFC       TRUE        442            4
#> 17:          MFIBS       TRUE       4094           25
#> 18:            BSI       TRUE         49            1
#> 19:            IRS       TRUE        263           10
#> 20:            MMS       TRUE        153            3
#> 21:     OFIFACMLBS       TRUE        128            2
#> 22:           IFBS       TRUE        777            2
#> 23:            SMS       TRUE         17            3
#> 24:            GGF       TRUE         32            4
#> 25:            GGD       TRUE        582            8
#> 26:             ER       TRUE        705            1
#> 27:            ERI       TRUE         86            1
#> 28:       TSPE-GDP       TRUE         49            2
#> 29:        TSPE-HW       TRUE         11            1
#> 30:         GGISFI       TRUE         39            3
#> 31:            EAI      FALSE         NA           NA
#> 32:           Comp       TRUE          8            2
#> 33:             HP       TRUE          9            2
#> 34:              P      FALSE         NA           NA
#> 35:           HICP       TRUE         79            5
#> 36:            PLM      FALSE         NA           NA
#> 37:            LCP       TRUE         10            1
#> 38:       TSPE-HDI       TRUE         14            2
#> 39:          IConf       TRUE          7            2
#> 40:         CoincI       TRUE          2            1
#> 41:       SI-Manuf       TRUE         86           13
#> 42:       SI-Trade       TRUE         43            7
#> 43:        SI-Serv       TRUE         30            5
#> 44:       SI-Const       TRUE          2            2
#> 45:      IT-goods        TRUE         72            3
#> 46: NA-Expenditure       TRUE        509            4
#> 47:  NA-Production       TRUE        186            2
#> 48:   NA-Financing       TRUE          6            1
#> 49:  NA-Households       TRUE         58            2
#> 50:            FSI       TRUE         29            2
#> 51:           GGFA       TRUE         53            1
#> 52:             MP      FALSE         NA           NA
#> 53:            INS       TRUE          2            1
#> 54:        TSPE-LA       TRUE          3            1
#> 55:                      TRUE          4            1
#> 56:                     FALSE         NA           NA
#> 57:                      TRUE      10540            2
#> 58:                      TRUE       5109            1
#> 59:                      TRUE        200            1
#> 60:           CBSD      FALSE         NA           NA
#> 61:          CBSDQ       TRUE        147            1
#> 62:          CBSDA       TRUE       1018            2
#> 63:          CBSDS       TRUE       6757            2
#> 64:  NA-Rev Exp GG       TRUE        107            1
#> 65:            BCR       TRUE       6901            2
#> 66:         NA-ICS       TRUE         60            1
#> 67:         CN-NAD       TRUE        386            3
#> 68:                      TRUE         40            4
#> 69:            LOA       TRUE        700            2
#> 70:            FDI       TRUE         20            1
#> 71:             RS      FALSE         NA           NA
#> 72:             SI       TRUE        392            1
#> 73:          NEInd       TRUE         15            1
#> 74:                      TRUE         40            1
#> 75:            DEP       TRUE        108            1
#> 76:           ECAE       TRUE          5            1
#> 77:                      TRUE        121            2
#>        short_label has_series num_series num_datasets
#>             <char>     <lgcl>      <int>        <int>
# }
```
