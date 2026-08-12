# Fetch Bank of Israel (BoI) metadata

Retrieve metadata from the Bank of Israel SDMX Web Service.

## Usage

``` r
boi_metadata(type, id = NULL, lang = "en")
```

## Source

<https://www.boi.org.il/en/>

## Arguments

- type:

  (`character(1)`)  
  The type of metadata to query. One of: `"datastructure"`,
  `"dataflow"`, `"codelist"`, or `"concept"`.

- id:

  (`NULL` \| `character(1)`)  
  The id to query. Default `NULL`.

- lang:

  (`character(1)`)  
  Language for names, either `"en"` or `"he"`. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested metadata.

## See also

Other metadata:
[`banxico_metadata()`](https://m-muecke.github.io/bbk/reference/banxico_metadata.md),
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bcb_currencies()`](https://m-muecke.github.io/bbk/reference/bcb_currencies.md),
[`bdf_dimension()`](https://m-muecke.github.io/bbk/reference/bdf_dimension.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`boi_dimension()`](https://m-muecke.github.io/bbk/reference/boi_dimension.md),
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
boi_metadata("dataflow")
#>               id                                                       name
#>           <char>                                                     <char>
#>  1:          ACC                                                       <NA>
#>  2:          ATM                                                       <NA>
#>  3:       BBS_99                             Monthly Balance Sheets - Banks
#>  4:       BFR_99                               Financial Statements - Banks
#>  5:          BIR    Interest rates and business volume - exc. housing loans
#>  6:  BIR_MRTG_99         Interest rates and business volume - housing loans
#>  7:          BKN                                        Banknotes and Coins
#>  8:       BMB_99                                       Balances for housing
#>  9:          BOP                                                       <NA>
#> 10:           BR                                          BOI interest rate
#> 11:        BTS_7                                   Business Tendency Survey
#> 12:          CAP                                                       <NA>
#> 13:        CARDS                                                       <NA>
#> 14:         CCIR Credit Card Companies - Interest Rates and Business Volume
#> 15:          CCP                                                       <NA>
#> 16:      CHEQUES                                                     Checks
#> 17:         CONS                                               Construction
#> 18:     DEBT_AGG                                 Debt and credit aggregates
#> 19:          DEM                                                       <NA>
#> 20:          DRV                                             Trade Turnover
#> 21:     ECON_IND                                                       <NA>
#> 22:          ENR                                                     Energy
#> 23:          EXR                                             Exchange rates
#> 24:          EXS                                        External Statistics
#> 25:         EZER                                                       EZER
#> 26: EZER_PIK_MOS                                                       <NA>
#> 27:          FTR                                              Foreign Trade
#> 28:       INSINV                                                       <NA>
#> 29:      INSINV2                                    Institutional Investors
#> 30:          LBM                                               Labor Market
#> 31:          MAG                                         Monetay Aggregates
#> 32:        MASAV                                                  ACH-MASAV
#> 33:           MF                                               Mutual Funds
#> 34:          MNF                                                   Industry
#> 35:           NA                                          National Accounts
#> 36:          PRI                                                       <NA>
#> 37:           PS                                              Public Sector
#> 38:   REAL_ES_DF                                                Real estate
#> 39:          REV                                                       <NA>
#> 40:       SECDWH                                            Securities TASE
#> 41:          TLB                                               Telbor rates
#> 42:        ZAHAV                                                 RTGS-ZAHAV
#> 43:          ZCM                Inflation expectations and zero yield curve
#>               id                                                       name
#>           <char>                                                     <char>
boi_metadata("datastructure")
#>                   id                                                     name
#>               <char>                                                   <char>
#>  1:              ACC                                               Accounting
#>  2:              ATM                                                      ATM
#>  3:              BBS                                    Monthly Balance Sheet
#>  4:              BFR                                Banking Financial Reports
#>  5:              BIR                                   Banking Interest Rates
#>  6:         BIR_MRTG        INTEREST RATE AND BUSINESS VOLUME - HOUSING LOANS
#>  7:              BKN                                      Banknotes and Coins
#>  8:              BMB                                 Banking Mortgage Balance
#>  9:              BOP                                      Balance of Payments
#> 10:              BTS                                 BUSINESS TENDENCY SURVEY
#> 11:              CAP                                            Capital Stock
#> 12:            CARDS                                                    Cards
#> 13:             CCIR Credit Card Companies Interest Rates and Business Volume
#> 14:              CCP                                             Credit cards
#> 15:          CHEQUES                                                  Cheques
#> 16:             CONS                                             Construction
#> 17:         DEBT_AGG                               Debt and credit aggregates
#> 18:              DEM                                               DEMOGRAPHY
#> 19:              DRV                                              Derivatives
#> 20: DSD_EZER_PIK_MOS                                             EZER PIK MOS
#> 21:         ECON_IND                          Indicators of economic activity
#> 22:              ENR                                                   Energy
#> 23:              EXR                                           Exchange Rates
#> 24:              EXS                                      External Statistics
#> 25:          FTR_NEW                                        Foreign Trade NEW
#> 26:           INSINV                                  Institutional Investors
#> 27:          INSINV2                                  Institutional Investors
#> 28:              LBM                                             LABOR MARKET
#> 29:              MAG                                      Monetary aggregates
#> 30:            MASAV                                                    Masav
#> 31:               MF                                             Mutual Funds
#> 32:              MNF                                            Manufacturing
#> 33:               NA                                        National Accounts
#> 34:              PRI                                            Price Indices
#> 35:               PS                                            Public Sector
#> 36:              RBB                  Central Bank rates and Inter-Bank rates
#> 37:          REAL_ES                                              Real estate
#> 38:              REV                                          Revenue Indices
#> 39:           SECDWH                                      Securities TASE DWH
#> 40:            ZAHAV                                                    Zahav
#> 41:              ZCM                                              Zero Coupon
#>                   id                                                     name
#>               <char>                                                   <char>
boi_metadata("codelist", "CL_FREQ")
#>          id                  name
#>      <char>                <char>
#>  1: CL_FREQ             Frequency
#>  2: CL_FREQ  Daily – businessweek
#>  3: CL_FREQ              Minutely
#>  4: CL_FREQ                Annual
#>  5: CL_FREQ Half-yearly, semester
#>  6: CL_FREQ             Quarterly
#>  7: CL_FREQ               Monthly
#>  8: CL_FREQ                Weekly
#>  9: CL_FREQ                 Daily
#> 10: CL_FREQ                Hourly
#> 11: CL_FREQ              Biweekly
#> 12: CL_FREQ           Semimonthly
# }
```
