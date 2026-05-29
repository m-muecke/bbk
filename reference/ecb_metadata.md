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
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
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
#> 17:      ECB       ECB_EMMS1
#> 18:      ECB        ECB_EON1
#> 19:      ECB        ECB_ESA1
#> 20:      ECB        ECB_EST1
#> 21:      ECB        ECB_EWT1
#> 22:      ECB        ECB_EXR1
#> 23:      ECB        ECB_FCT1
#> 24:      ECB        ECB_FMD2
#> 25:      ECB        ECB_FVC1
#> 26:      ECB        ECB_FXS1
#> 27:      ECB        ECB_GST1
#> 28:      ECB        ECB_ICO1
#> 29:      ECB        ECB_ICP1
#> 30:      ECB        ECB_ICP2
#> 31:      ECB        ECB_ICP3
#> 32:      ECB       ECB_ICPF1
#> 33:      ECB        ECB_IFI1
#> 34:      ECB        ECB_ILM1
#> 35:      ECB        ECB_IRS1
#> 36:      ECB        ECB_IVF1
#> 37:      ECB        ECB_LIG1
#> 38:      ECB        ECB_MFI1
#> 39:      ECB        ECB_MIR1
#> 40:      ECB        ECB_MMS1
#> 41:      ECB       ECB_MMSR1
#> 42:      ECB        ECB_MPD1
#> 43:      ECB        ECB_OFI1
#> 44:      ECB        ECB_OMO1
#> 45:      ECB        ECB_PAY1
#> 46:      ECB       ECB_PAY10
#> 47:      ECB       ECB_PAY11
#> 48:      ECB       ECB_PAY12
#> 49:      ECB       ECB_PAY13
#> 50:      ECB       ECB_PAY14
#> 51:      ECB        ECB_PAY2
#> 52:      ECB        ECB_PAY3
#> 53:      ECB        ECB_PAY4
#> 54:      ECB        ECB_PAY5
#> 55:      ECB        ECB_PAY6
#> 56:      ECB        ECB_PAY7
#> 57:      ECB        ECB_PAY8
#> 58:      ECB        ECB_PAY9
#> 59:      ECB        ECB_PFM1
#> 60:      ECB        ECB_PSS1
#> 61:      ECB        ECB_RAI1
#> 62:      ECB        ECB_RES1
#> 63:      ECB        ECB_RIR2
#> 64:      ECB        ECB_RPP1
#> 65:      ECB        ECB_RTD1
#> 66:      ECB        ECB_SAFE
#> 67:      ECB        ECB_SEC1
#> 68:      ECB        ECB_SEE1
#> 69:      ECB      ECB_SESFOD
#> 70:      ECB        ECB_SHI1
#> 71:      ECB        ECB_SHS6
#> 72:      ECB        ECB_SSI1
#> 73:      ECB        ECB_SSS1
#> 74:      ECB        ECB_STP1
#> 75:      ECB        ECB_STS1
#> 76:      ECB        ECB_SUP1
#> 77:      ECB        ECB_SUR1
#> 78:      ECB        ECB_SUR2
#> 79:      ECB        ECB_TGB1
#> 80:      ECB        ECB_TRD1
#> 81:      ECB        ECB_WTS1
#> 82:      ECB EUROSTAT_BOP_01
#> 83:    ESTAT             JVS
#> 84:    ESTAT             LCI
#> 85:    ESTAT         NA_MAIN
#> 86:    ESTAT          NA_SEC
#> 87: EUROSTAT    ESTAT_ESAIEA
#> 88: EUROSTAT   EUROSTAT_JVC2
#> 89: EUROSTAT   EUROSTAT_LFS1
#> 90:      IMF             BOP
#> 91:      IMF         BOP1_15
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
#> 17:                                                                                        Extended Money Market Statistics
#> 18:                                                                                                     Internal Eonia Rate
#> 19:                                                                                                 ESA95 National Accounts
#> 20:                                                                                                    Euro Short-Term Rate
#> 21:                                                                                                        ECB Wage Tracker
#> 22:                                                                                                          Exchange Rates
#> 23:                                                                                                                Forecast
#> 24:                                                                 Financial market data (not related to foreign exchange)
#> 25:                                                                    Financial Vehicle Corporation Assets and Liabilities
#> 26:                                                    Foreign eXchange Statistics (foreign reserves & exchange operations)
#> 27:                                                                                                   Government Statistics
#> 28:                                                                                       Insurance corporations operations
#> 29:                                                                                              Indices of Consumer Prices
#> 30:                                                                                              Indices of Consumer Prices
#> 31:                                                                                              Indices of Consumer Prices
#> 32:                                                         Insurance corporations and pension funds assets and liabilities
#> 33:                                                                                     Indicators of Financial Integration
#> 34:                                                                                           Internal Liquidity Management
#> 35:                                                                Interest Rate Statistics (2004 EU Member States & ACCBs)
#> 36:                                                                                                        Investment Funds
#> 37:                                                                                        Large Insurance Group Statistics
#> 38:                                                                           MFI - List of monetary financial institutions
#> 39:                                                                                            MFI Interest Rate Statistics
#> 40:                                                                                                     Money Market Survey
#> 41:                                                                                                 Money Market Statistics
#> 42:                                                                                       Macroeconomic Projection database
#> 43:                                                                                          Other Financial Intermediaries
#> 44:                                                                                                  Open market operations
#> 45:                                                                                  Payments transactions (Key indicators)
#> 46:                                                                      Electronic card payments sent by merchant category
#> 47:                                                     Number of cards issued by resident PSPs by card function and scheme
#> 48:                                                      Number of terminals provided by resident PSPs by type and function
#> 49:                                                                              Number of participants in payments systems
#> 50:                                                                                        Transactions in payments systems
#> 51:                                                                                 Credit transfers (including fraud data)
#> 52:                                                                                    Direct debits (including fraud data)
#> 53:                                                                     E-money payment transactions (including fraud data)
#> 54:                                                   Card payments and cash withdrawals using cards (including fraud data)
#> 55:                                                                      Payment initiation services (including fraud data)
#> 56:                                                                                 Losses due to fraud by liability bearer
#> 57:                                                                                  ATM, OTC and POS terminal transactions
#> 58:                                                                                   Payments transactions by PSP category
#> 59:                                                                                        Pension funds` number of members
#> 60:                                                                                          Payment and Settlement Systems
#> 61:                                                                                              Risk Assessment Indicators
#> 62:                                                                                                  Real Estate Statistics
#> 63:                                                                                                   Retail Interest Rates
#> 64:                                                                                   Residential Property Price Indicators
#> 65:                                                        Real Time Database (context of Euro Area Business Cycle Network)
#> 66:                                                         Survey on the Access to Finance of Small and Medium Enterprises
#> 67:                                                                                                              Securities
#> 68:                                                                                Securities Exchange (trading) Statistics
#> 69: Survey on credit terms and conditions in euro-denominated securities financing and over-the-counter derivatives markets
#> 70:                                                                                Structural Housing Indicators Statistics
#> 71:                                                                                           Securities Holding Statistics
#> 72:                                                                               Banking Structural Statistical Indicators
#> 73:                                                                                        Securities Settlement Statistics
#> 74:                                                                             Short-Term European Paper Statistics (STEP)
#> 75:                                                                                                   Short-Term Statistics
#> 76:                                                                                          Supervisory Banking Statistics
#> 77:                                                                                                         Opinion Surveys
#> 78:                                                                                                         Opinion Surveys
#> 79:                                                                                                         Target Balances
#> 80:                                                                                                          External Trade
#> 81:                                                            Overall, Import, Export and Double Export Weights Statistics
#> 82:                                                                                            Eurostat Balance of Payments
#> 83:                                                                                                  Job Vacancy Statistics
#> 84:                                                                                                       Labour Cost Index
#> 85:                                                                                        National Account Main Aggregates
#> 86:                                                                                                National Sector Accounts
#> 87:                                                                                                                  Sector
#> 88:                                                                                                  Job Vacancy Statistics
#> 89:                                                                                                     Labour Force Survey
#> 90:                                                                          Balance of Payments, I.I.P. and Reserve Assets
#> 91:                                                                   Balance of Payments, I.I.P. and Reserve Assets, v1.15
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
#> 17:    ECB       ECB_EMMS1
#> 18:    ECB        ECB_EON1
#> 19:    ECB        ECB_ESA1
#> 20:    ECB        ECB_EST1
#> 21:    ECB        ECB_EWT1
#> 22:    ECB        ECB_EXR1
#> 23:    ECB        ECB_FCT1
#> 24:    ECB        ECB_FMD2
#> 25:    ECB        ECB_FVC1
#> 26:    ECB        ECB_FXS1
#> 27:    ECB        ECB_GST1
#> 28:    ECB        ECB_ICO1
#> 29:    ECB        ECB_ICP1
#> 30:    ECB        ECB_ICP2
#> 31:    ECB        ECB_ICP3
#> 32:    ECB       ECB_ICPF1
#> 33:    ECB        ECB_IFI1
#> 34:    ECB        ECB_ILM1
#> 35:    ECB        ECB_IRS1
#> 36:    ECB        ECB_IVF1
#> 37:    ECB        ECB_LIG1
#> 38:    ECB        ECB_MFI1
#> 39:    ECB        ECB_MIR1
#> 40:    ECB        ECB_MMS1
#> 41:    ECB       ECB_MMSR1
#> 42:    ECB        ECB_MPD1
#> 43:    ECB        ECB_OFI1
#> 44:    ECB        ECB_OMO1
#> 45:    ECB        ECB_PAY1
#> 46:    ECB       ECB_PAY10
#> 47:    ECB       ECB_PAY11
#> 48:    ECB       ECB_PAY12
#> 49:    ECB       ECB_PAY13
#> 50:    ECB       ECB_PAY14
#> 51:    ECB        ECB_PAY2
#> 52:    ECB        ECB_PAY3
#> 53:    ECB        ECB_PAY4
#> 54:    ECB        ECB_PAY5
#> 55:    ECB        ECB_PAY6
#> 56:    ECB        ECB_PAY7
#> 57:    ECB        ECB_PAY8
#> 58:    ECB        ECB_PAY9
#> 59:    ECB        ECB_PFM1
#> 60:    ECB        ECB_PSS1
#> 61:    ECB        ECB_RAI1
#> 62:    ECB        ECB_RES1
#> 63:    ECB        ECB_RIR2
#> 64:    ECB        ECB_RPP1
#> 65:    ECB        ECB_RTD1
#> 66:    ECB        ECB_SAFE
#> 67:    ECB        ECB_SEC1
#> 68:    ECB        ECB_SEE1
#> 69:    ECB      ECB_SESFOD
#> 70:    ECB        ECB_SHI1
#> 71:    ECB        ECB_SHS6
#> 72:    ECB        ECB_SSI1
#> 73:    ECB        ECB_SSS1
#> 74:    ECB        ECB_STP1
#> 75:    ECB        ECB_STS1
#> 76:    ECB        ECB_SUP1
#> 77:    ECB        ECB_SUR1
#> 78:    ECB        ECB_SUR2
#> 79:    ECB        ECB_TGB1
#> 80:    ECB        ECB_TRD1
#> 81:    ECB        ECB_WTS1
#> 82:    ECB EUROSTAT_BOP_01
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
#> 17:                                                                                        Extended Money Market Statistics
#> 18:                                                                                                     Internal Eonia Rate
#> 19:                                                                                                 ESA95 National Accounts
#> 20:                                                                                                    Euro Short-Term Rate
#> 21:                                                                                                        ECB Wage Tracker
#> 22:                                                                                                          Exchange Rates
#> 23:                                                                                                                Forecast
#> 24:                                                                 Financial market data (not related to foreign exchange)
#> 25:                                                                    Financial Vehicle Corporation Assets and Liabilities
#> 26:                                                    Foreign eXchange Statistics (foreign reserves & exchange operations)
#> 27:                                                                                                   Government Statistics
#> 28:                                                                                       Insurance corporations operations
#> 29:                                                                                              Indices of Consumer Prices
#> 30:                                                                                              Indices of Consumer Prices
#> 31:                                                                                              Indices of Consumer Prices
#> 32:                                                         Insurance corporations and pension funds assets and liabilities
#> 33:                                                                                     Indicators of Financial Integration
#> 34:                                                                                           Internal Liquidity Management
#> 35:                                                                Interest Rate Statistics (2004 EU Member States & ACCBs)
#> 36:                                                                                                        Investment Funds
#> 37:                                                                                        Large Insurance Group Statistics
#> 38:                                                                           MFI - List of monetary financial institutions
#> 39:                                                                                            MFI Interest Rate Statistics
#> 40:                                                                                                     Money Market Survey
#> 41:                                                                                                 Money Market Statistics
#> 42:                                                                                       Macroeconomic Projection database
#> 43:                                                                                          Other Financial Intermediaries
#> 44:                                                                                                  Open market operations
#> 45:                                                                                  Payments transactions (Key indicators)
#> 46:                                                                      Electronic card payments sent by merchant category
#> 47:                                                     Number of cards issued by resident PSPs by card function and scheme
#> 48:                                                      Number of terminals provided by resident PSPs by type and function
#> 49:                                                                              Number of participants in payments systems
#> 50:                                                                                        Transactions in payments systems
#> 51:                                                                                 Credit transfers (including fraud data)
#> 52:                                                                                    Direct debits (including fraud data)
#> 53:                                                                     E-money payment transactions (including fraud data)
#> 54:                                                   Card payments and cash withdrawals using cards (including fraud data)
#> 55:                                                                      Payment initiation services (including fraud data)
#> 56:                                                                                 Losses due to fraud by liability bearer
#> 57:                                                                                  ATM, OTC and POS terminal transactions
#> 58:                                                                                   Payments transactions by PSP category
#> 59:                                                                                        Pension funds` number of members
#> 60:                                                                                          Payment and Settlement Systems
#> 61:                                                                                              Risk Assessment Indicators
#> 62:                                                                                                  Real Estate Statistics
#> 63:                                                                                                   Retail Interest Rates
#> 64:                                                                                   Residential Property Price Indicators
#> 65:                                                        Real Time Database (context of Euro Area Business Cycle Network)
#> 66:                                                         Survey on the Access to Finance of Small and Medium Enterprises
#> 67:                                                                                                              Securities
#> 68:                                                                                Securities Exchange (trading) Statistics
#> 69: Survey on credit terms and conditions in euro-denominated securities financing and over-the-counter derivatives markets
#> 70:                                                                                Structural Housing Indicators Statistics
#> 71:                                                                                           Securities Holding Statistics
#> 72:                                                                               Banking Structural Statistical Indicators
#> 73:                                                                                        Securities Settlement Statistics
#> 74:                                                                             Short-Term European Paper Statistics (STEP)
#> 75:                                                                                                   Short-Term Statistics
#> 76:                                                                                          Supervisory Banking Statistics
#> 77:                                                                                                         Opinion Surveys
#> 78:                                                                                                         Opinion Surveys
#> 79:                                                                                                         Target Balances
#> 80:                                                                                                          External Trade
#> 81:                                                            Overall, Import, Export and Double Export Weights Statistics
#> 82:                                                                                            Eurostat Balance of Payments
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
