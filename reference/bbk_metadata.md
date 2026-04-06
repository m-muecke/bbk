# Fetch Deutsche Bundesbank (BBk) metadata

Retrieve metadata from the Bundesbank time series database via the SDMX
Web Service.

## Usage

``` r
bbk_metadata(type, id = NULL, lang = "en")
```

## Source

<https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-metadata>

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
  Language to query, either `"en"` or `"de"`. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested metadata. The columns are:

- id:

  The id of the metadata

- name:

  The name of the metadata

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
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
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
bbk_metadata("datastructure")
#>                     id
#>                 <char>
#>  1:           BBK_BSPL
#>  2:           BBK_DOES
#>  3:            BBK_ERX
#>  4:          BBK_ESBOP
#>  5:           BBK_EXBS
#>  6:           BBK_DOSC
#>  7:           BBK_DOSR
#>  8:           BBK_EXNA
#>  9:           BBK_EXPR
#> 10:           BBK_EXEI
#> 11:           BBK_ACIP
#> 12:         BBK_BSPL_S
#> 13:           BBK_ACS2
#> 14:          BBK_BLS_G
#> 15:           BBK_DOGO
#> 16:           BBK_DOLM
#> 17:          BBK_MAMMS
#> 18:           BBK_DOBS
#> 19:           BBK_DOET
#> 20:           BBK_DOPR
#> 21:           BBK_DORE
#> 22:           BBK_EREW
#> 23:           BBK_ESNB
#> 24:           BBK_EXGF
#> 25:           BBK_EXLP
#> 26:          BBK_MAMMU
#> 27:       BBK_NAAC2011
#> 28:           BBK_SEHA
#> 29:           BBK_SESS
#> 30:          BBK_SEFU3
#> 31:          BBK_SEFU2
#> 32:           BBK_SEHD
#> 33:           BBK_SEIS
#> 34:           BBK_SESP
#> 35:           BBK_RTD1
#> 36:           BBK_BSPS
#> 37:           BBK_MAFA
#> 38:           BBK_EREI
#> 39:      BBK_MAMM_EST1
#> 40:            BBK_TH3
#> 41: BBK_MAMM_ECB_MMSR1
#> 42:     BBK_MAMM_MMSR1
#> 43:           BBK_DOCR
#> 44:           BBK_SESY
#> 45:           BBK_BBK1
#> 46:           BBK_SEDI
#> 47:         BBK_ES_BOP
#> 48:          BBK_VOEXP
#> 49:            BBK_GFS
#> 50:         BBK_BSBBK1
#> 51:        BBK_BSBBK10
#> 52:        BBK_BSBBK11
#> 53:        BBK_BSBBK12
#> 54:        BBK_BSBBK13
#> 55:        BBK_BSBBK20
#> 56:         BBK_BSBBK4
#> 57:         BBK_BSBBK5
#> 58:         BBK_BSBBK6
#> 59:         BBK_BSBBK7
#> 60:         BBK_BSBBK8
#> 61:         BBK_BSBBK9
#> 62:           BBK_IRBB
#> 63:            BBK_IRM
#> 64:          BBK_IRCBR
#> 65:           BBK_IRMM
#> 66:        BBK_BSEBBK1
#> 67:           BBK_SEEI
#> 68:       BBK_MAFABBK1
#> 69:       BBK_AQFA2010
#> 70:         BBK_BSPAY1
#> 71:         BBK_BSPAY2
#> 72:         BBK_BSPAY3
#> 73:         BBK_BSPAY4
#> 74:         BBK_BSPAY5
#> 75:         BBK_BSPAY6
#> 76:         BBK_BSPAY8
#> 77:        BBK_BSPAY11
#> 78:        BBK_BSPAY12
#> 79:     BBK_BSPAY_SSIA
#> 80:           BBK_BSI1
#> 81:         BBK_ES_FDI
#> 82:         BBK_WACAAF
#> 83:          BBK_EXPR2
#>                     id
#>                 <char>
#>                                                                                                                                                name
#>                                                                                                                                              <char>
#>  1:                                                                                                                                 Profit and loss
#>  2:                                                                                  Short-term economic indicators (classified by economic sector)
#>  3:         ECB euro reference exchange rates, exchange rates in particular countries, special drawing rights, precious metal prices, further rates
#>  4:                                                                                                          BOP Data Structure Definition (15-DIM)
#>  5:                                                                                              Business and consumer surveys of foreign countries
#>  6:                                                                              System of  indicators for the German commercial real estate market
#>  7:                                                                                 System of indicators for the German residential property market
#>  8:                                                                                                          National Accounts of foreign countries
#>  9:                                                                                                            Consumer Prices of foreign countries
#> 10:                                                                                                         Leading indicators of foreign countries
#> 11:                                                                Deutsche Bundesbank,  Insurance Corporations and Pension Undertakings Statistics
#> 12:                                                                                                                    Profit and loss (IFRS-group)
#> 13:                                              Deutsche Bundesbank,  Insurance Corporations and Pension Undertakings Statistics, Solvency II data
#> 14:                                                                                                                             Bank Lending Survey
#> 15:                                                                                                                                     Commodities
#> 16:                                                                                                                         Labour market - Germany
#> 17:                                                                             Money Market Statistical Reporting_Aggregats_Secured Market Segment
#> 18:                                                                                                                Corporate Balance Sheet Analysis
#> 19:                                                                                                                           German external trade
#> 20:                                                                                             Price statistics (classified by goods and services)
#> 21:                                                                                                                              Real Estate Prices
#> 22:                                                                                  Indicators of price competitiveness / Effective exchange rates
#> 23:                                                                                                      External positions of enterprises (14-DIM)
#> 24:                                                                                                         Government Finance of foreign countries
#> 25:                                                                                               Labour Market and Population of foreign countries
#> 26:                                                                           Money Market Statistical Reporting_Aggregats_Unsecured Market Segment
#> 27:                                                                                                                    National Accounts - ESA 2010
#> 28:                                                                                                                             WpInvest aggregates
#> 29:                                                                                                           Securities Issues Statistics (Shares)
#> 30:                                                                                                        Performance Indices Investment Funds BBk
#> 31:                                                                                                                            Investment Funds BBk
#> 32:                                                                                                             Number of customer deposit accounts
#> 33:                                                                                                            Securities Issues Statistics (Bonds)
#> 34:                                                                                                                             Sales and Purchases
#> 35:                                                                                                                                   Realtime Data
#> 36:                                                                                                                             Payments Statistics
#> 37:                                                                                                                           Financial market data
#> 38:                                                                                                         Indices of exchange rate effects on IIP
#> 39:                                                                                                                            Euro Short-Term Rate
#> 40:                                                                                                                    Time series of department H3
#> 41:                                                                                                                   Money Market Statistics (ECB)
#> 42:                                                                                               Money Market Statistics (ECB; based on ECB_MMSR1)
#> 43:                                                                                                                              Calendar regressor
#> 44:                                                                                                                                   Single yields
#> 45:                                                                                                            SDMX structure for BBK01 time series
#> 46:                                                               Discount interest rates pursuant to section 253 (2) of the German Commercial Code
#> 47:                                                                                                          BOP Data Structure Definition (17-DIM)
#> 48:                                                                                                        Macroeconomic Expectations and Forecasts
#> 49:                                                                                                                   Government finance statistics
#> 50:                                           Banking statistics, Balance Sheet Items, BSI - Banks in Germany (MFI and non-MFI credit institutions)
#> 51: Banking statistics, Balance Sheet Items,  German contribution, ECB-aggregates  (MFI and non-MFI credit institutions), Bundesbank BSI-statistics
#> 52:                                                                             Banking statistics, Balance Sheet Items, Weekly financial statement
#> 53:                                                                                                   IMF data, Financial Soundnes Indicators, SDDS
#> 54:                                                           Banking statistics, Balance Sheet Items, ECB-aggregates (non-MFI credit institutions)
#> 55:                                                                                 Banking statistics, Balance Sheet Items, historical time series
#> 56:                                         Banking statistics, Balance Sheet Items, BSI - Multi-office banks (MFI and non-MFI credit institutions)
#> 57:                                          Banking statistics, Balance Sheet Items,  BSI - Foreign branches (MFI and non-MFI credit institutions)
#> 58:                                                             Banking statistics, Balance Sheet Items, Foreign subsidiaries of German banks (MFI)
#> 59:                                                                        Banking statistics, Balance Sheet Items, BSI - Regional statistics (MFI)
#> 60:                                                                    Banking statistics, Balance Sheet Items, FVC - Financial vehicle corporation
#> 61:                                                      Banking statistics, Balance Sheet Items, structural figures, size categories, publications
#> 62:                                                                                         Bundesbank's interest rate statistics (until June 2003)
#> 63:                                                                                                                    MFI interest rate statistics
#> 64:                                                                                                                              Central bank rates
#> 65:                                                                                                                                    Money market
#> 66:                                                                                           Banking statistics, External Position of Banks, AUSTA
#> 67:                                                                                  Expectation of inflation rate and expected real interest rates
#> 68:                                                                                                               Financial market data, short keys
#> 69:                                                                                                       Financial accounts - internet time series
#> 70:                                                                                                                        Payments Statistics 2021
#> 71:                                                                                                                        Payments Statistics 2021
#> 72:                                                                                                                             Payments Statistics
#> 73:                                                                                                                             Payments Statistics
#> 74:                                                                                                                             Payments Statistics
#> 75:                                                                                                                             Payments Statistics
#> 76:                                                                                                                             Payments Statistics
#> 77:                                                                                                                             Payments Statistics
#> 78:                                                                                                                             Payments Statistics
#> 79:                                                                                                            ZVS additional structural indicators
#> 80:                                                                              Deutsche Bundesbank, Balance Sheet Items, EMU, Monetary aggregates
#> 81:                                                                                                          FDI Data Structure Definition (18-DIM)
#> 82:                                                                        Statistics of negotiated wages - Aggregates and forecasts of time series
#> 83:                                                                                           Consumer Prices of foreign countries (incl. ECOICOP2)
#>                                                                                                                                                name
#>                                                                                                                                              <char>
bbk_metadata("dataflow", "BBSIS")
#>        id                                                    name
#>    <char>                                                  <char>
#> 1:  BBSIS Yields, term structure and securities issues statistics
bbk_metadata("codelist", "CL_BBK_ACIP_ASSET_LIABILITY")
#>                             id                 name
#>                         <char>               <char>
#> 1: CL_BBK_ACIP_ASSET_LIABILITY Assets / Liabilities
#> 2: CL_BBK_ACIP_ASSET_LIABILITY               Assets
#> 3: CL_BBK_ACIP_ASSET_LIABILITY          Liabilities
bbk_metadata("concept", "CS_BBK_BSPL")
#>              id                                          name
#>          <char>                                        <char>
#>  1: CS_BBK_BSPL                               Profit and loss
#>  2: CS_BBK_BSPL                               Frequency (BBk)
#>  3: CS_BBK_BSPL Area (countries, list of countries), BBk only
#>  4: CS_BBK_BSPL                              Adjustment (BBk)
#>  5: CS_BBK_BSPL                    Reference sector breakdown
#>  6: CS_BBK_BSPL                              Profit/Loss Item
#>  7: CS_BBK_BSPL                             Original maturity
#>  8: CS_BBK_BSPL                                     Data type
#>  9: CS_BBK_BSPL                              Counterpart area
#> 10: CS_BBK_BSPL                            Counterpart Sector
#> 11: CS_BBK_BSPL Area (ISO currency codes, list of currencies)
#> 12: CS_BBK_BSPL                                        Suffix
#> 13: CS_BBK_BSPL                          Time period or range
#> 14: CS_BBK_BSPL                              Time format code
#> 15: CS_BBK_BSPL                             Observation value
#> 16: CS_BBK_BSPL                            Observation status
#> 17: CS_BBK_BSPL                   Pre-break observation value
#> 18: CS_BBK_BSPL                                         Title
#> 19: CS_BBK_BSPL                                          Unit
#> 20: CS_BBK_BSPL                               Unit multiplier
#> 21: CS_BBK_BSPL                                      Decimals
#> 22: CS_BBK_BSPL                          Collection indicator
#> 23: CS_BBK_BSPL                                       Comment
#> 24: CS_BBK_BSPL           Comment on observation (in english)
#> 25: CS_BBK_BSPL                        Comment on observation
#> 26: CS_BBK_BSPL                            Title (in english)
#> 27: CS_BBK_BSPL                                      category
#> 28: CS_BBK_BSPL                                 Grafics title
#> 29: CS_BBK_BSPL                         Grafics title english
#> 30: CS_BBK_BSPL                              Grafics position
#> 31: CS_BBK_BSPL                                 Timeserieskey
#> 32: CS_BBK_BSPL                     Hypothetically euro-based
#> 33: CS_BBK_BSPL     Absolute change vis-à-vis previous period
#> 34: CS_BBK_BSPL   Percentage change vis-à-vis previous period
#> 35: CS_BBK_BSPL                  Year-on-year absolute change
#> 36: CS_BBK_BSPL                Year-on-year percentage change
#> 37: CS_BBK_BSPL                                    Conversion
#> 38: CS_BBK_BSPL                            Conversion english
#>              id                                          name
#>          <char>                                        <char>
# }
```
