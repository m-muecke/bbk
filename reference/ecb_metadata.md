# Fetch European Central Bank (ECB) metadata

Retrieve metadata from the ECB time series database via the SDMX Web
Service.

## Usage

``` r
ecb_metadata(type, agency = NULL, id = NULL)
```

## Source

<https://data.ecb.europa.eu/help/api/metadata>

## Arguments

- type:

  (`character(1)`)  
  The type of metadata to query. One of: `"datastructure"`,
  `"dataflow"`, `"codelist"`, or `"concept"`.

- agency:

  (`NULL` \| `character(1)`)  
  The id of the agency to query. Default `NULL`.

- id:

  (`NULL` \| `character(1)`)  
  The id of the resource to query. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested metadata. The columns are:

- agency:

  The agency of the metadata

- id:

  The id of the metadata

- name:

  The name of the metadata

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
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
[`cnb_dimension()`](https://m-muecke.github.io/bbk/reference/cnb_dimension.md),
[`cnb_indicators()`](https://m-muecke.github.io/bbk/reference/cnb_indicators.md),
[`cnb_snapshots()`](https://m-muecke.github.io/bbk/reference/cnb_snapshots.md),
[`cnb_tree()`](https://m-muecke.github.io/bbk/reference/cnb_tree.md),
[`ecb_dimension()`](https://m-muecke.github.io/bbk/reference/ecb_dimension.md),
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
ecb_metadata("datastructure")
#>       agency              id
#>       <char>          <char>
#>  1:      ECB        ECB_AME1
#>  2:      ECB        ECB_BCS1
#>  3:      ECB        ECB_BKN1
#>  4:      ECB        ECB_BLS1
#>  5:      ECB        ECB_BOP1
#>  6:      ECB     ECB_BOP_BNT
#>  7:      ECB        ECB_BSI1
#>  8:      ECB        ECB_CAR1
#>  9:      ECB        ECB_CBD1
#> 10:      ECB        ECB_CBD2
#> 11:      ECB        ECB_CCP1
#> 12:      ECB        ECB_CES1
#> 13:      ECB        ECB_CPP3
#> 14:      ECB        ECB_DCM1
#> 15:      ECB         ECB_DD1
#> 16:      ECB        ECB_DWA1
#> 17:      ECB        ECB_EFS1
#> 18:      ECB       ECB_EMMS1
#> 19:      ECB        ECB_EON1
#> 20:      ECB        ECB_ESA1
#> 21:      ECB        ECB_EST1
#> 22:      ECB        ECB_EWT1
#> 23:      ECB        ECB_EXR1
#> 24:      ECB        ECB_FCT1
#> 25:      ECB        ECB_FMD2
#> 26:      ECB        ECB_FVC1
#> 27:      ECB        ECB_FXS1
#> 28:      ECB        ECB_GST1
#> 29:      ECB        ECB_ICO1
#> 30:      ECB        ECB_ICP1
#> 31:      ECB        ECB_ICP2
#> 32:      ECB        ECB_ICP3
#> 33:      ECB       ECB_ICPF1
#> 34:      ECB        ECB_IFI1
#> 35:      ECB        ECB_ILM1
#> 36:      ECB        ECB_IRS1
#> 37:      ECB        ECB_IVF1
#> 38:      ECB        ECB_LIG1
#> 39:      ECB        ECB_MFI1
#> 40:      ECB        ECB_MIR1
#> 41:      ECB        ECB_MMS1
#> 42:      ECB       ECB_MMSR1
#> 43:      ECB        ECB_MPD1
#> 44:      ECB        ECB_OFI1
#> 45:      ECB        ECB_OMO1
#> 46:      ECB        ECB_PAY1
#> 47:      ECB       ECB_PAY10
#> 48:      ECB       ECB_PAY11
#> 49:      ECB       ECB_PAY12
#> 50:      ECB       ECB_PAY13
#> 51:      ECB       ECB_PAY14
#> 52:      ECB        ECB_PAY2
#> 53:      ECB        ECB_PAY3
#> 54:      ECB        ECB_PAY4
#> 55:      ECB        ECB_PAY5
#> 56:      ECB        ECB_PAY6
#> 57:      ECB        ECB_PAY7
#> 58:      ECB        ECB_PAY8
#> 59:      ECB        ECB_PAY9
#> 60:      ECB        ECB_PFM1
#> 61:      ECB        ECB_PSS1
#> 62:      ECB        ECB_RAI1
#> 63:      ECB        ECB_RES1
#> 64:      ECB        ECB_RIR2
#> 65:      ECB        ECB_RPP1
#> 66:      ECB        ECB_RTD1
#> 67:      ECB        ECB_SAFE
#> 68:      ECB        ECB_SEC1
#> 69:      ECB        ECB_SEE1
#> 70:      ECB      ECB_SESFOD
#> 71:      ECB        ECB_SHI1
#> 72:      ECB        ECB_SHS6
#> 73:      ECB        ECB_SSI1
#> 74:      ECB        ECB_SSS1
#> 75:      ECB        ECB_STP1
#> 76:      ECB        ECB_STS1
#> 77:      ECB        ECB_SUP1
#> 78:      ECB        ECB_SUR1
#> 79:      ECB        ECB_SUR2
#> 80:      ECB        ECB_TGB1
#> 81:      ECB        ECB_TRD1
#> 82:      ECB        ECB_WTS1
#> 83:      ECB EUROSTAT_BOP_01
#> 84:    ESTAT             JVS
#> 85:    ESTAT             LCI
#> 86:    ESTAT         NA_MAIN
#> 87:    ESTAT          NA_SEC
#> 88: EUROSTAT    ESTAT_ESAIEA
#> 89: EUROSTAT   EUROSTAT_JVC2
#> 90: EUROSTAT   EUROSTAT_LFS1
#> 91:      IMF             BOP
#> 92:      IMF         BOP1_15
#>       agency              id
#>       <char>          <char>
#>                                                                                                                        name
#>                                                                                                                      <char>
#>  1:                                                                                                                   AMECO
#>  2:                                                                                               Business Cycle Statistics
#>  3:                                                                                                    Banknotes Statistics
#>  4:                                                                                          Bank Lending Survey Statistics
#>  5:                                                               Balance of Payments, I.I.P. and Reserve Assets Statistics
#>  6:                                                                               Statistics on Shipments of Euro Banknotes
#>  7:                                                                                                     Balance Sheet Items
#>  8:                                                                                                          Car Statistics
#>  9:                                                                                 Statistics on Consolidated Banking Data
#> 10:                                                                                 Statistics on Consolidated Banking Data
#> 11:                                                                                Central Counterparty Clearing Statistics
#> 12:                                                                                            Consumer Expectations Survey
#> 13:                                                                                    Commercial property price statistics
#> 14:                                                                                                                Dealogic
#> 15:                                                                                                            Derived Data
#> 16:                                                                                          Distributional Wealth Accounts
#> 17:                                                                                                ECB Financial Statements
#> 18:                                                                                        Extended Money Market Statistics
#> 19:                                                                                                     Internal Eonia Rate
#> 20:                                                                                                 ESA95 National Accounts
#> 21:                                                                                                    Euro Short-Term Rate
#> 22:                                                                                                        ECB Wage Tracker
#> 23:                                                                                                          Exchange Rates
#> 24:                                                                                                                Forecast
#> 25:                                                                 Financial market data (not related to foreign exchange)
#> 26:                                                                    Financial Vehicle Corporation Assets and Liabilities
#> 27:                                                    Foreign eXchange Statistics (foreign reserves & exchange operations)
#> 28:                                                                                                   Government Statistics
#> 29:                                                                                       Insurance corporations operations
#> 30:                                                                                              Indices of Consumer Prices
#> 31:                                                                                              Indices of Consumer Prices
#> 32:                                                                                              Indices of Consumer Prices
#> 33:                                                         Insurance corporations and pension funds assets and liabilities
#> 34:                                                                                     Indicators of Financial Integration
#> 35:                                                                                           Internal Liquidity Management
#> 36:                                                                Interest Rate Statistics (2004 EU Member States & ACCBs)
#> 37:                                                                                                        Investment Funds
#> 38:                                                                                        Large Insurance Group Statistics
#> 39:                                                                           MFI - List of monetary financial institutions
#> 40:                                                                                            MFI Interest Rate Statistics
#> 41:                                                                                                     Money Market Survey
#> 42:                                                                                                 Money Market Statistics
#> 43:                                                                                       Macroeconomic Projection database
#> 44:                                                                                          Other Financial Intermediaries
#> 45:                                                                                                  Open market operations
#> 46:                                                                                  Payments transactions (Key indicators)
#> 47:                                                                      Electronic card payments sent by merchant category
#> 48:                                                     Number of cards issued by resident PSPs by card function and scheme
#> 49:                                                      Number of terminals provided by resident PSPs by type and function
#> 50:                                                                              Number of participants in payments systems
#> 51:                                                                                        Transactions in payments systems
#> 52:                                                                                 Credit transfers (including fraud data)
#> 53:                                                                                    Direct debits (including fraud data)
#> 54:                                                                     E-money payment transactions (including fraud data)
#> 55:                                                   Card payments and cash withdrawals using cards (including fraud data)
#> 56:                                                                      Payment initiation services (including fraud data)
#> 57:                                                                                 Losses due to fraud by liability bearer
#> 58:                                                                                  ATM, OTC and POS terminal transactions
#> 59:                                                                                   Payments transactions by PSP category
#> 60:                                                                                        Pension funds` number of members
#> 61:                                                                                          Payment and Settlement Systems
#> 62:                                                                                              Risk Assessment Indicators
#> 63:                                                                                                  Real Estate Statistics
#> 64:                                                                                                   Retail Interest Rates
#> 65:                                                                                   Residential Property Price Indicators
#> 66:                                                        Real Time Database (context of Euro Area Business Cycle Network)
#> 67:                                                         Survey on the Access to Finance of Small and Medium Enterprises
#> 68:                                                                                                              Securities
#> 69:                                                                                Securities Exchange (trading) Statistics
#> 70: Survey on credit terms and conditions in euro-denominated securities financing and over-the-counter derivatives markets
#> 71:                                                                                Structural Housing Indicators Statistics
#> 72:                                                                                           Securities Holding Statistics
#> 73:                                                                               Banking Structural Statistical Indicators
#> 74:                                                                                        Securities Settlement Statistics
#> 75:                                                                             Short-Term European Paper Statistics (STEP)
#> 76:                                                                                                   Short-Term Statistics
#> 77:                                                                                          Supervisory Banking Statistics
#> 78:                                                                                                         Opinion Surveys
#> 79:                                                                                                         Opinion Surveys
#> 80:                                                                                                         Target Balances
#> 81:                                                                                                          External Trade
#> 82:                                                            Overall, Import, Export and Double Export Weights Statistics
#> 83:                                                                                            Eurostat Balance of Payments
#> 84:                                                                                                  Job Vacancy Statistics
#> 85:                                                                                                       Labour Cost Index
#> 86:                                                                                        National Account Main Aggregates
#> 87:                                                                                                National Sector Accounts
#> 88:                                                                                                                  Sector
#> 89:                                                                                                  Job Vacancy Statistics
#> 90:                                                                                                     Labour Force Survey
#> 91:                                                                          Balance of Payments, I.I.P. and Reserve Assets
#> 92:                                                                   Balance of Payments, I.I.P. and Reserve Assets, v1.15
#>                                                                                                                        name
#>                                                                                                                      <char>
ecb_metadata("datastructure", "ECB")
#>     agency              id
#>     <char>          <char>
#>  1:    ECB        ECB_AME1
#>  2:    ECB        ECB_BCS1
#>  3:    ECB        ECB_BKN1
#>  4:    ECB        ECB_BLS1
#>  5:    ECB        ECB_BOP1
#>  6:    ECB     ECB_BOP_BNT
#>  7:    ECB        ECB_BSI1
#>  8:    ECB        ECB_CAR1
#>  9:    ECB        ECB_CBD1
#> 10:    ECB        ECB_CBD2
#> 11:    ECB        ECB_CCP1
#> 12:    ECB        ECB_CES1
#> 13:    ECB        ECB_CPP3
#> 14:    ECB        ECB_DCM1
#> 15:    ECB         ECB_DD1
#> 16:    ECB        ECB_DWA1
#> 17:    ECB        ECB_EFS1
#> 18:    ECB       ECB_EMMS1
#> 19:    ECB        ECB_EON1
#> 20:    ECB        ECB_ESA1
#> 21:    ECB        ECB_EST1
#> 22:    ECB        ECB_EWT1
#> 23:    ECB        ECB_EXR1
#> 24:    ECB        ECB_FCT1
#> 25:    ECB        ECB_FMD2
#> 26:    ECB        ECB_FVC1
#> 27:    ECB        ECB_FXS1
#> 28:    ECB        ECB_GST1
#> 29:    ECB        ECB_ICO1
#> 30:    ECB        ECB_ICP1
#> 31:    ECB        ECB_ICP2
#> 32:    ECB        ECB_ICP3
#> 33:    ECB       ECB_ICPF1
#> 34:    ECB        ECB_IFI1
#> 35:    ECB        ECB_ILM1
#> 36:    ECB        ECB_IRS1
#> 37:    ECB        ECB_IVF1
#> 38:    ECB        ECB_LIG1
#> 39:    ECB        ECB_MFI1
#> 40:    ECB        ECB_MIR1
#> 41:    ECB        ECB_MMS1
#> 42:    ECB       ECB_MMSR1
#> 43:    ECB        ECB_MPD1
#> 44:    ECB        ECB_OFI1
#> 45:    ECB        ECB_OMO1
#> 46:    ECB        ECB_PAY1
#> 47:    ECB       ECB_PAY10
#> 48:    ECB       ECB_PAY11
#> 49:    ECB       ECB_PAY12
#> 50:    ECB       ECB_PAY13
#> 51:    ECB       ECB_PAY14
#> 52:    ECB        ECB_PAY2
#> 53:    ECB        ECB_PAY3
#> 54:    ECB        ECB_PAY4
#> 55:    ECB        ECB_PAY5
#> 56:    ECB        ECB_PAY6
#> 57:    ECB        ECB_PAY7
#> 58:    ECB        ECB_PAY8
#> 59:    ECB        ECB_PAY9
#> 60:    ECB        ECB_PFM1
#> 61:    ECB        ECB_PSS1
#> 62:    ECB        ECB_RAI1
#> 63:    ECB        ECB_RES1
#> 64:    ECB        ECB_RIR2
#> 65:    ECB        ECB_RPP1
#> 66:    ECB        ECB_RTD1
#> 67:    ECB        ECB_SAFE
#> 68:    ECB        ECB_SEC1
#> 69:    ECB        ECB_SEE1
#> 70:    ECB      ECB_SESFOD
#> 71:    ECB        ECB_SHI1
#> 72:    ECB        ECB_SHS6
#> 73:    ECB        ECB_SSI1
#> 74:    ECB        ECB_SSS1
#> 75:    ECB        ECB_STP1
#> 76:    ECB        ECB_STS1
#> 77:    ECB        ECB_SUP1
#> 78:    ECB        ECB_SUR1
#> 79:    ECB        ECB_SUR2
#> 80:    ECB        ECB_TGB1
#> 81:    ECB        ECB_TRD1
#> 82:    ECB        ECB_WTS1
#> 83:    ECB EUROSTAT_BOP_01
#>     agency              id
#>     <char>          <char>
#>                                                                                                                        name
#>                                                                                                                      <char>
#>  1:                                                                                                                   AMECO
#>  2:                                                                                               Business Cycle Statistics
#>  3:                                                                                                    Banknotes Statistics
#>  4:                                                                                          Bank Lending Survey Statistics
#>  5:                                                               Balance of Payments, I.I.P. and Reserve Assets Statistics
#>  6:                                                                               Statistics on Shipments of Euro Banknotes
#>  7:                                                                                                     Balance Sheet Items
#>  8:                                                                                                          Car Statistics
#>  9:                                                                                 Statistics on Consolidated Banking Data
#> 10:                                                                                 Statistics on Consolidated Banking Data
#> 11:                                                                                Central Counterparty Clearing Statistics
#> 12:                                                                                            Consumer Expectations Survey
#> 13:                                                                                    Commercial property price statistics
#> 14:                                                                                                                Dealogic
#> 15:                                                                                                            Derived Data
#> 16:                                                                                          Distributional Wealth Accounts
#> 17:                                                                                                ECB Financial Statements
#> 18:                                                                                        Extended Money Market Statistics
#> 19:                                                                                                     Internal Eonia Rate
#> 20:                                                                                                 ESA95 National Accounts
#> 21:                                                                                                    Euro Short-Term Rate
#> 22:                                                                                                        ECB Wage Tracker
#> 23:                                                                                                          Exchange Rates
#> 24:                                                                                                                Forecast
#> 25:                                                                 Financial market data (not related to foreign exchange)
#> 26:                                                                    Financial Vehicle Corporation Assets and Liabilities
#> 27:                                                    Foreign eXchange Statistics (foreign reserves & exchange operations)
#> 28:                                                                                                   Government Statistics
#> 29:                                                                                       Insurance corporations operations
#> 30:                                                                                              Indices of Consumer Prices
#> 31:                                                                                              Indices of Consumer Prices
#> 32:                                                                                              Indices of Consumer Prices
#> 33:                                                         Insurance corporations and pension funds assets and liabilities
#> 34:                                                                                     Indicators of Financial Integration
#> 35:                                                                                           Internal Liquidity Management
#> 36:                                                                Interest Rate Statistics (2004 EU Member States & ACCBs)
#> 37:                                                                                                        Investment Funds
#> 38:                                                                                        Large Insurance Group Statistics
#> 39:                                                                           MFI - List of monetary financial institutions
#> 40:                                                                                            MFI Interest Rate Statistics
#> 41:                                                                                                     Money Market Survey
#> 42:                                                                                                 Money Market Statistics
#> 43:                                                                                       Macroeconomic Projection database
#> 44:                                                                                          Other Financial Intermediaries
#> 45:                                                                                                  Open market operations
#> 46:                                                                                  Payments transactions (Key indicators)
#> 47:                                                                      Electronic card payments sent by merchant category
#> 48:                                                     Number of cards issued by resident PSPs by card function and scheme
#> 49:                                                      Number of terminals provided by resident PSPs by type and function
#> 50:                                                                              Number of participants in payments systems
#> 51:                                                                                        Transactions in payments systems
#> 52:                                                                                 Credit transfers (including fraud data)
#> 53:                                                                                    Direct debits (including fraud data)
#> 54:                                                                     E-money payment transactions (including fraud data)
#> 55:                                                   Card payments and cash withdrawals using cards (including fraud data)
#> 56:                                                                      Payment initiation services (including fraud data)
#> 57:                                                                                 Losses due to fraud by liability bearer
#> 58:                                                                                  ATM, OTC and POS terminal transactions
#> 59:                                                                                   Payments transactions by PSP category
#> 60:                                                                                        Pension funds` number of members
#> 61:                                                                                          Payment and Settlement Systems
#> 62:                                                                                              Risk Assessment Indicators
#> 63:                                                                                                  Real Estate Statistics
#> 64:                                                                                                   Retail Interest Rates
#> 65:                                                                                   Residential Property Price Indicators
#> 66:                                                        Real Time Database (context of Euro Area Business Cycle Network)
#> 67:                                                         Survey on the Access to Finance of Small and Medium Enterprises
#> 68:                                                                                                              Securities
#> 69:                                                                                Securities Exchange (trading) Statistics
#> 70: Survey on credit terms and conditions in euro-denominated securities financing and over-the-counter derivatives markets
#> 71:                                                                                Structural Housing Indicators Statistics
#> 72:                                                                                           Securities Holding Statistics
#> 73:                                                                               Banking Structural Statistical Indicators
#> 74:                                                                                        Securities Settlement Statistics
#> 75:                                                                             Short-Term European Paper Statistics (STEP)
#> 76:                                                                                                   Short-Term Statistics
#> 77:                                                                                          Supervisory Banking Statistics
#> 78:                                                                                                         Opinion Surveys
#> 79:                                                                                                         Opinion Surveys
#> 80:                                                                                                         Target Balances
#> 81:                                                                                                          External Trade
#> 82:                                                            Overall, Import, Export and Double Export Weights Statistics
#> 83:                                                                                            Eurostat Balance of Payments
#>                                                                                                                        name
#>                                                                                                                      <char>
ecb_metadata("datastructure", "ECB", "ECB_EXR1")
#>    agency       id           name
#>    <char>   <char>         <char>
#> 1:    ECB ECB_EXR1 Exchange Rates
ecb_metadata("datastructure", id = "ECB_EXR1")
#>    agency       id           name
#>    <char>   <char>         <char>
#> 1:    ECB ECB_EXR1 Exchange Rates
# }
```
