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
[`nbb_dimension()`](https://m-muecke.github.io/bbk/reference/nbb_dimension.md),
[`nbb_metadata()`](https://m-muecke.github.io/bbk/reference/nbb_metadata.md),
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
#>  5:     6         2
#>  6:     8        NA
#>  7:     9        NA
#>  8:    10        16
#>  9:    11        NA
#> 10:    12        40
#> 11:    13        43
#> 12:    14        NA
#> 13:    15        NA
#> 14:    16        NA
#> 15:    18        NA
#> 16:    19        14
#> 17:    20        NA
#> 18:    21        14
#> 19:    22       130
#> 20:    23        14
#> 21:    24        14
#> 22:    26        15
#> 23:    27        16
#> 24:    28        16
#> 25:    29        15
#> 26:    30        40
#> 27:    31        11
#> 28:    32        11
#> 29:    37        NA
#> 30:    38        40
#> 31:    39        40
#> 32:    40        NA
#> 33:    41        40
#> 34:    43        NA
#> 35:    44        43
#> 36:    45        11
#> 37:    47        37
#> 38:    48        37
#> 39:    49        37
#> 40:    50        37
#> 41:    51        37
#> 42:    52        37
#> 43:    53        37
#> 44:    54        11
#> 45:    55        11
#> 46:    56        11
#> 47:    58        11
#> 48:    59        NA
#> 49:   128        16
#> 50:   130        NA
#> 51:   131       130
#> 52:   134        11
#> 53:   139        43
#> 54:   160        NA
#> 55:   161       160
#> 56:   162       160
#> 57:   163        11
#> 58:   167        NA
#> 59:   168       167
#> 60:   169       167
#> 61:   170       167
#> 62:   172        16
#> 63:   178       190
#> 64:   179        11
#> 65:   181        11
#> 66:   186        14
#> 67:   188       190
#> 68:   189       190
#> 69:   190        NA
#> 70:   194        15
#> 71:   203        15
#> 72:   204        15
#> 73:   206       190
#> 74:   207        14
#> 75:   209        14
#>        id parent_id
#>     <int>     <int>
#>                                                                                                                        label
#>                                                                                                                       <char>
#>  1:                                                                                              National financial accounts
#>  2:                                                                                                      External statistics
#>  3:                                                                                                      Balance of payments
#>  4:                                                                                        International investment position
#>  5:                                                                                                   International reserves
#>  6:                                                                                          Payment systems and instruments
#>  7:                                                                                                            Cash issuance
#>  8:                                                                                                           Budget Outturn
#>  9:                                                                                                        National accounts
#> 10:                                                                                                     Consumer price index
#> 11:                                                                                  Population, employment and unemployment
#> 12:                                                                                                   Monetary and financial
#> 13:                                                                                                        Financial markets
#> 14:                                                                                                       General government
#> 15:                                                                                 Indebtedness of the non-financial sector
#> 16:                                                                           Monetary financial institutions' balance sheet
#> 17:                                                                                               Banking system information
#> 18:                                                                                                           Interest rates
#> 19:                                                                                                             Money market
#> 20: Other financial intermediaries, financial auxiliaries and captive financial institutions and money lenders balance sheet
#> 21:                                                                                           Investment funds balance sheet
#> 22:                                                                                                         Secondary market
#> 23:                                                                                             General government financing
#> 24:                                                                                                  General government debt
#> 25:                                                                                                           Exchange rates
#> 26:                                                                                     Real effective exchange rate indices
#> 27:                                          Time-series for the Portuguese economy - GDP and main components of expenditure
#> 28:                                                                Time-series for the Portuguese economy - Household wealth
#> 29:                                                                                             Economic activity indicators
#> 30:                                                                                                         Commodity prices
#> 31:                                                                                                           Housing prices
#> 32:                                                                                                                   Prices
#> 33:                                                                                      Harmonised index of consumer prices
#> 34:                                                                                             Population and labour market
#> 35:                                                                                            Labour costs and productivity
#> 36:                                                     Time-series for the Portuguese economy - Household disposable income
#> 37:                                                                                                    Confidence indicators
#> 38:                                                                                                    Coincident indicators
#> 39:                                                                                     Sectorial indicators - Manufacturing
#> 40:                                                                                             Sectorial indicators - Trade
#> 41:                                                                                          Sectorial indicators - Services
#> 42:                                                                                       Sectoral indicators - Construction
#> 43:                                                                                             International trade of goods
#> 44:                                                                                                 GDP Expenditure approach
#> 45:                                                                                                  GDP Production approach
#> 46:                                                                                               Net Lending/Net Borrowing 
#> 47:                                                                                                        Income and saving
#> 48:                                                                                           Financial stability indicators
#> 49:                                                                                    General government financial accounts
#> 50:                                                                                                          Monetary policy
#> 51:                                                                                                              Instruments
#> 52:                                          Time-series for the Portuguese economy - Employment (national accounts concept)
#> 53:                                       Time-series for the Portuguese economy - Labour force, employment and unemployment
#> 54:                                                                                                 Globalisation statistics
#> 55:                                                                        Foreign Direct Investment - Directional Principle
#> 56:                                                                            Foreign Direct Investment - Ultimate Investor
#> 57:                                                              National financial accounts - Interlinkages between sectors
#> 58:                                                                     Corporations from the central balance-sheet database
#> 59:                                                              Quarterly economic and financial indicators of corporations
#> 60:                                                                 Annual economic and financial indicators of corporations
#> 61:                                                                                            Central balance-sheet studies
#> 62:                                                                             Non-financial accounts of General government
#> 63:                                                              Economic and financial indicators of corporations by region
#> 64:                                                                                             Investment and capital stock
#> 65:                                                                                              National accounts deflators
#> 66:                                                                                                 Loans for house purchase
#> 67:                                                                                                                    Loans
#> 68:                                                                                                 Inward direct investment
#> 69:                                                                                                      Regional statistics
#> 70:                                                                                                        Securities issues
#> 71:                                                                                            Nominal exchange rate indices
#> 72:                                                                                                     Securities holdings 
#> 73:                                                                                                                 Deposits
#> 74:                                                                            Interest rates by sector of economic activity
#> 75:                                                                                                          Consumer credit
#>                                                                                                                        label
#>                                                                                                                       <char>
#>        short_label has_series num_series num_datasets
#>             <char>     <lgcl>      <int>        <int>
#>  1:             FA       TRUE      16644            1
#>  2:             ES      FALSE         NA           NA
#>  3:            BOP       TRUE       6673            8
#>  4:            IIP       TRUE       4747            5
#>  5:            IRS       TRUE        378            2
#>  6:             PS       TRUE        399           19
#>  7:            BCS       TRUE        323            2
#>  8:             BO       TRUE         46            1
#>  9:             NA      FALSE         NA           NA
#> 10:            CPI       TRUE        144            2
#> 11:            PEU       TRUE        517           10
#> 12:             MF      FALSE         NA           NA
#> 13:            ERS      FALSE         NA           NA
#> 14:            GGS      FALSE         NA           NA
#> 15:         IndNFC       TRUE        442            4
#> 16:          MFIBS       TRUE       4000           25
#> 17:            BSI       TRUE         49            1
#> 18:            IRS       TRUE        263           10
#> 19:            MMS       TRUE        153            3
#> 20:     OFIFACMLBS       TRUE        128            2
#> 21:           IFBS       TRUE        777            2
#> 22:            SMS       TRUE         17            3
#> 23:            GGF       TRUE         32            4
#> 24:            GGD       TRUE        280            8
#> 25:             ER       TRUE        705            1
#> 26:            ERI       TRUE         90            1
#> 27:       TSPE-GDP       TRUE         49            2
#> 28:        TSPE-HW       TRUE         11            1
#> 29:            EAI      FALSE         NA           NA
#> 30:           Comp       TRUE          6            2
#> 31:             HP       TRUE          9            2
#> 32:              P      FALSE         NA           NA
#> 33:           HICP       TRUE         79            4
#> 34:            PLM      FALSE         NA           NA
#> 35:            LCP       TRUE         10            1
#> 36:       TSPE-HDI       TRUE         14            2
#> 37:          IConf       TRUE          7            1
#> 38:         CoincI       TRUE          2            1
#> 39:       SI-Manuf       TRUE         41           10
#> 40:       SI-Trade       TRUE         30            6
#> 41:        SI-Serv       TRUE         24            4
#> 42:       SI-Const       TRUE          2            2
#> 43:      IT-goods        TRUE         72            3
#> 44: NA-Expenditure       TRUE        511            3
#> 45:  NA-Production       TRUE        186            2
#> 46:   NA-Financing       TRUE          6            1
#> 47:  NA-Households       TRUE         58            1
#> 48:            FSI       TRUE         29            2
#> 49:           GGFA       TRUE         53            1
#> 50:             MP      FALSE         NA           NA
#> 51:            INS       TRUE          2            1
#> 52:        TSPE-LA       TRUE          3            1
#> 53:                      TRUE          4            1
#> 54:                     FALSE         NA           NA
#> 55:                      TRUE      10718            2
#> 56:                      TRUE       5148            1
#> 57:                      TRUE        200            1
#> 58:           CBSD      FALSE         NA           NA
#> 59:          CBSDQ       TRUE        147            1
#> 60:          CBSDA       TRUE       1018            2
#> 61:          CBSDS       TRUE       6757            2
#> 62:  NA-Rev Exp GG       TRUE        107            1
#> 63:            BCR       TRUE       6902            2
#> 64:         NA-ICS       TRUE         60            1
#> 65:         CN-NAD       TRUE        386            3
#> 66:                      TRUE         40            4
#> 67:            LOA       TRUE        700            2
#> 68:            FDI       TRUE         20            1
#> 69:             RS      FALSE         NA           NA
#> 70:             SI       TRUE        392            1
#> 71:          NEInd       TRUE         15            1
#> 72:                      TRUE         40            1
#> 73:            DEP       TRUE        108            1
#> 74:           ECAE       TRUE          5            1
#> 75:                      TRUE        121            2
#>        short_label has_series num_series num_datasets
#>             <char>     <lgcl>      <int>        <int>
# }
```
