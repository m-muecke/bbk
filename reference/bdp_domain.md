# Fetch Banco de Portugal (BdP) domains

Retrieve the list of available statistical domains from the BPstat API,
or details for a single domain.

## Usage

``` r
bdp_domain(domain_id = NULL, lang = "en")
```

## Source

<https://bpstat.bportugal.pt/data/docs>

## Arguments

- domain_id:

  (`NULL` \| `integer(1)`)  
  Optional domain ID. If `NULL`, all domains are returned.

- lang:

  (`character(1)`)  
  Language for labels, either `"en"` or `"pt"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with available domains.

## See also

Other metadata:
[`banxico_metadata()`](https://m-muecke.github.io/bbk/reference/banxico_metadata.md),
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bcb_currencies()`](https://m-muecke.github.io/bbk/reference/bcb_currencies.md),
[`bdf_dimension()`](https://m-muecke.github.io/bbk/reference/bdf_dimension.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`boi_dimension()`](https://m-muecke.github.io/bbk/reference/boi_dimension.md),
[`boi_metadata()`](https://m-muecke.github.io/bbk/reference/boi_metadata.md),
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
[`cnb_dimension()`](https://m-muecke.github.io/bbk/reference/cnb_dimension.md),
[`cnb_indicators()`](https://m-muecke.github.io/bbk/reference/cnb_indicators.md),
[`cnb_snapshots()`](https://m-muecke.github.io/bbk/reference/cnb_snapshots.md),
[`cnb_tree()`](https://m-muecke.github.io/bbk/reference/cnb_tree.md),
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
[`snb_metadata()`](https://m-muecke.github.io/bbk/reference/snb_metadata.md),
[`snb_toc()`](https://m-muecke.github.io/bbk/reference/snb_toc.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
bdp_domain()
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
#> 30:    37        NA
#> 31:    38        40
#> 32:    39        40
#> 33:    40        NA
#> 34:    41        40
#> 35:    43        NA
#> 36:    44        43
#> 37:    45        11
#> 38:    47        37
#> 39:    48        37
#> 40:    49        37
#> 41:    50        37
#> 42:    51        37
#> 43:    52        37
#> 44:    53        37
#> 45:    54        11
#> 46:    55        11
#> 47:    56        11
#> 48:    58        11
#> 49:    59        NA
#> 50:   128        16
#> 51:   130        NA
#> 52:   131       130
#> 53:   134        11
#> 54:   139        43
#> 55:   160        NA
#> 56:   161       160
#> 57:   162       160
#> 58:   163        11
#> 59:   167        NA
#> 60:   168       167
#> 61:   169       167
#> 62:   170       167
#> 63:   172        16
#> 64:   178       190
#> 65:   179        11
#> 66:   181        11
#> 67:   186        14
#> 68:   188       190
#> 69:   189       190
#> 70:   190        NA
#> 71:   194        15
#> 72:   203        15
#> 73:   204        15
#> 74:   206       190
#> 75:   207        14
#> 76:   209        14
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
#> 30:                                                                                             Economic activity indicators
#> 31:                                                                                                         Commodity prices
#> 32:                                                                                                           Housing prices
#> 33:                                                                                                                   Prices
#> 34:                                                                                      Harmonised index of consumer prices
#> 35:                                                                                             Population and labour market
#> 36:                                                                                            Labour costs and productivity
#> 37:                                                     Time-series for the Portuguese economy - Household disposable income
#> 38:                                                                                                    Confidence indicators
#> 39:                                                                                                    Coincident indicators
#> 40:                                                                                     Sectorial indicators - Manufacturing
#> 41:                                                                                             Sectorial indicators - Trade
#> 42:                                                                                          Sectorial indicators - Services
#> 43:                                                                                       Sectoral indicators - Construction
#> 44:                                                                                             International trade of goods
#> 45:                                                                                                 GDP Expenditure approach
#> 46:                                                                                                  GDP Production approach
#> 47:                                                                                               Net Lending/Net Borrowing 
#> 48:                                                                                                        Income and saving
#> 49:                                                                                           Financial stability indicators
#> 50:                                                                                    General government financial accounts
#> 51:                                                                                                          Monetary policy
#> 52:                                                                                                              Instruments
#> 53:                                          Time-series for the Portuguese economy - Employment (national accounts concept)
#> 54:                                       Time-series for the Portuguese economy - Labour force, employment and unemployment
#> 55:                                                                                                 Globalisation statistics
#> 56:                                                                        Foreign Direct Investment - Directional Principle
#> 57:                                                                            Foreign Direct Investment - Ultimate Investor
#> 58:                                                              National financial accounts - Interlinkages between sectors
#> 59:                                                                     Corporations from the central balance-sheet database
#> 60:                                                              Quarterly economic and financial indicators of corporations
#> 61:                                                                 Annual economic and financial indicators of corporations
#> 62:                                                                                            Central balance-sheet studies
#> 63:                                                                             Non-financial accounts of General government
#> 64:                                                              Economic and financial indicators of corporations by region
#> 65:                                                                                             Investment and capital stock
#> 66:                                                                                              National accounts deflators
#> 67:                                                                                                 Loans for house purchase
#> 68:                                                                                                                    Loans
#> 69:                                                                                                 Inward direct investment
#> 70:                                                                                                      Regional statistics
#> 71:                                                                                                        Securities issues
#> 72:                                                                                            Nominal exchange rate indices
#> 73:                                                                                                     Securities holdings 
#> 74:                                                                                                                 Deposits
#> 75:                                                                            Interest rates by sector of economic activity
#> 76:                                                                                                          Consumer credit
#>                                                                                                                        label
#>                                                                                                                       <char>
#>        short_label has_series num_series num_datasets
#>             <char>     <lgcl>      <int>        <int>
#>  1:             FA       TRUE      16644            1
#>  2:             ES      FALSE         NA           NA
#>  3:            BOP       TRUE       6673            8
#>  4:            IIP       TRUE       4747            5
#>  5:           EBIS       TRUE        799            4
#>  6:            IRS       TRUE        378            2
#>  7:             PS       TRUE        399           19
#>  8:            BCS       TRUE        323            2
#>  9:             BO       TRUE         46            1
#> 10:             NA      FALSE         NA           NA
#> 11:            CPI       TRUE        144            2
#> 12:            PEU       TRUE        517           10
#> 13:             MF      FALSE         NA           NA
#> 14:            ERS      FALSE         NA           NA
#> 15:            GGS      FALSE         NA           NA
#> 16:         IndNFC       TRUE        442            4
#> 17:          MFIBS       TRUE       4000           25
#> 18:            BSI       TRUE         49            1
#> 19:            IRS       TRUE        263           10
#> 20:            MMS       TRUE        153            3
#> 21:     OFIFACMLBS       TRUE        128            2
#> 22:           IFBS       TRUE        777            2
#> 23:            SMS       TRUE         17            3
#> 24:            GGF       TRUE         32            4
#> 25:            GGD       TRUE        280            8
#> 26:             ER       TRUE        705            1
#> 27:            ERI       TRUE         90            1
#> 28:       TSPE-GDP       TRUE         49            2
#> 29:        TSPE-HW       TRUE         11            1
#> 30:            EAI      FALSE         NA           NA
#> 31:           Comp       TRUE          6            2
#> 32:             HP       TRUE          9            2
#> 33:              P      FALSE         NA           NA
#> 34:           HICP       TRUE         79            4
#> 35:            PLM      FALSE         NA           NA
#> 36:            LCP       TRUE         10            1
#> 37:       TSPE-HDI       TRUE         14            2
#> 38:          IConf       TRUE          7            2
#> 39:         CoincI       TRUE          2            1
#> 40:       SI-Manuf       TRUE         41           10
#> 41:       SI-Trade       TRUE         30            6
#> 42:        SI-Serv       TRUE         24            4
#> 43:       SI-Const       TRUE          2            2
#> 44:      IT-goods        TRUE         72            3
#> 45: NA-Expenditure       TRUE        511            3
#> 46:  NA-Production       TRUE        186            2
#> 47:   NA-Financing       TRUE          6            1
#> 48:  NA-Households       TRUE         58            1
#> 49:            FSI       TRUE         29            2
#> 50:           GGFA       TRUE         53            1
#> 51:             MP      FALSE         NA           NA
#> 52:            INS       TRUE          2            1
#> 53:        TSPE-LA       TRUE          3            1
#> 54:                      TRUE          4            1
#> 55:                     FALSE         NA           NA
#> 56:                      TRUE      10540            2
#> 57:                      TRUE       5109            1
#> 58:                      TRUE        200            1
#> 59:           CBSD      FALSE         NA           NA
#> 60:          CBSDQ       TRUE        147            1
#> 61:          CBSDA       TRUE       1018            2
#> 62:          CBSDS       TRUE       6757            2
#> 63:  NA-Rev Exp GG       TRUE        107            1
#> 64:            BCR       TRUE       6901            2
#> 65:         NA-ICS       TRUE         60            1
#> 66:         CN-NAD       TRUE        386            3
#> 67:                      TRUE         40            4
#> 68:            LOA       TRUE        700            2
#> 69:            FDI       TRUE         20            1
#> 70:             RS      FALSE         NA           NA
#> 71:             SI       TRUE        392            1
#> 72:          NEInd       TRUE         15            1
#> 73:                      TRUE         40            1
#> 74:            DEP       TRUE        108            1
#> 75:           ECAE       TRUE          5            1
#> 76:                      TRUE        121            2
#>        short_label has_series num_series num_datasets
#>             <char>     <lgcl>      <int>        <int>
# }
```
