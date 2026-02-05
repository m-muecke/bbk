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
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md)

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
#> 17:      ECB        ECB_EON1
#> 18:      ECB        ECB_ESA1
#> 19:      ECB        ECB_EST1
#> 20:      ECB        ECB_EWT1
#> 21:      ECB        ECB_EXR1
#> 22:      ECB        ECB_FCT1
#> 23:      ECB        ECB_FMD2
#> 24:      ECB        ECB_FVC1
#> 25:      ECB        ECB_FXS1
#> 26:      ECB        ECB_GST1
#> 27:      ECB        ECB_ICO1
#> 28:      ECB        ECB_ICP1
#> 29:      ECB        ECB_ICP2
#> 30:      ECB        ECB_ICP3
#> 31:      ECB       ECB_ICPF1
#> 32:      ECB        ECB_IFI1
#> 33:      ECB        ECB_ILM1
#> 34:      ECB        ECB_IRS1
#> 35:      ECB        ECB_IVF1
#> 36:      ECB        ECB_LIG1
#> 37:      ECB        ECB_MFI1
#> 38:      ECB        ECB_MIR1
#> 39:      ECB        ECB_MMS1
#> 40:      ECB       ECB_MMSR1
#> 41:      ECB        ECB_MPD1
#> 42:      ECB        ECB_OFI1
#> 43:      ECB        ECB_OMO1
#> 44:      ECB        ECB_PAY1
#> 45:      ECB       ECB_PAY10
#> 46:      ECB       ECB_PAY11
#> 47:      ECB       ECB_PAY12
#> 48:      ECB       ECB_PAY13
#> 49:      ECB       ECB_PAY14
#> 50:      ECB        ECB_PAY2
#> 51:      ECB        ECB_PAY3
#> 52:      ECB        ECB_PAY4
#> 53:      ECB        ECB_PAY5
#> 54:      ECB        ECB_PAY6
#> 55:      ECB        ECB_PAY7
#> 56:      ECB        ECB_PAY8
#> 57:      ECB        ECB_PAY9
#> 58:      ECB        ECB_PFM1
#> 59:      ECB        ECB_PSS1
#> 60:      ECB        ECB_RAI1
#> 61:      ECB        ECB_RES1
#> 62:      ECB        ECB_RIR2
#> 63:      ECB        ECB_RPP1
#> 64:      ECB        ECB_RTD1
#> 65:      ECB        ECB_SAFE
#> 66:      ECB        ECB_SEC1
#> 67:      ECB        ECB_SEE1
#> 68:      ECB      ECB_SESFOD
#> 69:      ECB        ECB_SHI1
#> 70:      ECB        ECB_SHS6
#> 71:      ECB        ECB_SSI1
#> 72:      ECB        ECB_SSS1
#> 73:      ECB        ECB_STP1
#> 74:      ECB        ECB_STS1
#> 75:      ECB        ECB_SUP1
#> 76:      ECB        ECB_SUR1
#> 77:      ECB        ECB_SUR2
#> 78:      ECB        ECB_TGB1
#> 79:      ECB        ECB_TRD1
#> 80:      ECB        ECB_WTS1
#> 81:      ECB EUROSTAT_BOP_01
#> 82:    ESTAT             JVS
#> 83:    ESTAT             LCI
#> 84:    ESTAT         NA_MAIN
#> 85:    ESTAT          NA_SEC
#> 86: EUROSTAT    ESTAT_ESAIEA
#> 87: EUROSTAT   EUROSTAT_JVC2
#> 88: EUROSTAT   EUROSTAT_LFS1
#> 89:      IMF             BOP
#> 90:      IMF         BOP1_15
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
#> 17:                                                                                                     Internal Eonia Rate
#> 18:                                                                                                 ESA95 National Accounts
#> 19:                                                                                                    Euro Short-Term Rate
#> 20:                                                                                                        ECB Wage Tracker
#> 21:                                                                                                          Exchange Rates
#> 22:                                                                                                                Forecast
#> 23:                                                                 Financial market data (not related to foreign exchange)
#> 24:                                                                    Financial Vehicle Corporation Assets and Liabilities
#> 25:                                                    Foreign eXchange Statistics (foreign reserves & exchange operations)
#> 26:                                                                                                   Government Statistics
#> 27:                                                                                       Insurance corporations operations
#> 28:                                                                                              Indices of Consumer Prices
#> 29:                                                                                              Indices of Consumer Prices
#> 30:                                                                                              Indices of Consumer Prices
#> 31:                                                         Insurance corporations and pension funds assets and liabilities
#> 32:                                                                                     Indicators of Financial Integration
#> 33:                                                                                           Internal Liquidity Management
#> 34:                                                                Interest Rate Statistics (2004 EU Member States & ACCBs)
#> 35:                                                                                                        Investment Funds
#> 36:                                                                                        Large Insurance Group Statistics
#> 37:                                                                           MFI - List of monetary financial institutions
#> 38:                                                                                            MFI Interest Rate Statistics
#> 39:                                                                                                     Money Market Survey
#> 40:                                                                                                 Money Market Statistics
#> 41:                                                                                       Macroeconomic Projection database
#> 42:                                                                                          Other Financial Intermediaries
#> 43:                                                                                                  Open market operations
#> 44:                                                                                  Payments transactions (Key indicators)
#> 45:                                                                      Electronic card payments sent by merchant category
#> 46:                                                     Number of cards issued by resident PSPs by card function and scheme
#> 47:                                                      Number of terminals provided by resident PSPs by type and function
#> 48:                                                                              Number of participants in payments systems
#> 49:                                                                                        Transactions in payments systems
#> 50:                                                                                 Credit transfers (including fraud data)
#> 51:                                                                                    Direct debits (including fraud data)
#> 52:                                                                     E-money payment transactions (including fraud data)
#> 53:                                                   Card payments and cash withdrawals using cards (including fraud data)
#> 54:                                                                      Payment initiation services (including fraud data)
#> 55:                                                                                 Losses due to fraud by liability bearer
#> 56:                                                                                  ATM, OTC and POS terminal transactions
#> 57:                                                                                   Payments transactions by PSP category
#> 58:                                                                                        Pension funds` number of members
#> 59:                                                                                          Payment and Settlement Systems
#> 60:                                                                                              Risk Assessment Indicators
#> 61:                                                                                                  Real Estate Statistics
#> 62:                                                                                                   Retail Interest Rates
#> 63:                                                                                   Residential Property Price Indicators
#> 64:                                                        Real Time Database (context of Euro Area Business Cycle Network)
#> 65:                                                         Survey on the Access to Finance of Small and Medium Enterprises
#> 66:                                                                                                              Securities
#> 67:                                                                                Securities Exchange (trading) Statistics
#> 68: Survey on credit terms and conditions in euro-denominated securities financing and over-the-counter derivatives markets
#> 69:                                                                                Structural Housing Indicators Statistics
#> 70:                                                                                           Securities Holding Statistics
#> 71:                                                                               Banking Structural Statistical Indicators
#> 72:                                                                                        Securities Settlement Statistics
#> 73:                                                                             Short-Term European Paper Statistics (STEP)
#> 74:                                                                                                   Short-Term Statistics
#> 75:                                                                                          Supervisory Banking Statistics
#> 76:                                                                                                         Opinion Surveys
#> 77:                                                                                                         Opinion Surveys
#> 78:                                                                                                         Target Balances
#> 79:                                                                                                          External Trade
#> 80:                                                            Overall, Import, Export and Double Export Weights Statistics
#> 81:                                                                                            Eurostat Balance of Payments
#> 82:                                                                                                  Job Vacancy Statistics
#> 83:                                                                                                       Labour Cost Index
#> 84:                                                                                        National Account Main Aggregates
#> 85:                                                                                                National Sector Accounts
#> 86:                                                                                                                  Sector
#> 87:                                                                                                  Job Vacancy Statistics
#> 88:                                                                                                     Labour Force Survey
#> 89:                                                                          Balance of Payments, I.I.P. and Reserve Assets
#> 90:                                                                   Balance of Payments, I.I.P. and Reserve Assets, v1.15
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
#> 17:    ECB        ECB_EON1
#> 18:    ECB        ECB_ESA1
#> 19:    ECB        ECB_EST1
#> 20:    ECB        ECB_EWT1
#> 21:    ECB        ECB_EXR1
#> 22:    ECB        ECB_FCT1
#> 23:    ECB        ECB_FMD2
#> 24:    ECB        ECB_FVC1
#> 25:    ECB        ECB_FXS1
#> 26:    ECB        ECB_GST1
#> 27:    ECB        ECB_ICO1
#> 28:    ECB        ECB_ICP1
#> 29:    ECB        ECB_ICP2
#> 30:    ECB        ECB_ICP3
#> 31:    ECB       ECB_ICPF1
#> 32:    ECB        ECB_IFI1
#> 33:    ECB        ECB_ILM1
#> 34:    ECB        ECB_IRS1
#> 35:    ECB        ECB_IVF1
#> 36:    ECB        ECB_LIG1
#> 37:    ECB        ECB_MFI1
#> 38:    ECB        ECB_MIR1
#> 39:    ECB        ECB_MMS1
#> 40:    ECB       ECB_MMSR1
#> 41:    ECB        ECB_MPD1
#> 42:    ECB        ECB_OFI1
#> 43:    ECB        ECB_OMO1
#> 44:    ECB        ECB_PAY1
#> 45:    ECB       ECB_PAY10
#> 46:    ECB       ECB_PAY11
#> 47:    ECB       ECB_PAY12
#> 48:    ECB       ECB_PAY13
#> 49:    ECB       ECB_PAY14
#> 50:    ECB        ECB_PAY2
#> 51:    ECB        ECB_PAY3
#> 52:    ECB        ECB_PAY4
#> 53:    ECB        ECB_PAY5
#> 54:    ECB        ECB_PAY6
#> 55:    ECB        ECB_PAY7
#> 56:    ECB        ECB_PAY8
#> 57:    ECB        ECB_PAY9
#> 58:    ECB        ECB_PFM1
#> 59:    ECB        ECB_PSS1
#> 60:    ECB        ECB_RAI1
#> 61:    ECB        ECB_RES1
#> 62:    ECB        ECB_RIR2
#> 63:    ECB        ECB_RPP1
#> 64:    ECB        ECB_RTD1
#> 65:    ECB        ECB_SAFE
#> 66:    ECB        ECB_SEC1
#> 67:    ECB        ECB_SEE1
#> 68:    ECB      ECB_SESFOD
#> 69:    ECB        ECB_SHI1
#> 70:    ECB        ECB_SHS6
#> 71:    ECB        ECB_SSI1
#> 72:    ECB        ECB_SSS1
#> 73:    ECB        ECB_STP1
#> 74:    ECB        ECB_STS1
#> 75:    ECB        ECB_SUP1
#> 76:    ECB        ECB_SUR1
#> 77:    ECB        ECB_SUR2
#> 78:    ECB        ECB_TGB1
#> 79:    ECB        ECB_TRD1
#> 80:    ECB        ECB_WTS1
#> 81:    ECB EUROSTAT_BOP_01
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
#> 17:                                                                                                     Internal Eonia Rate
#> 18:                                                                                                 ESA95 National Accounts
#> 19:                                                                                                    Euro Short-Term Rate
#> 20:                                                                                                        ECB Wage Tracker
#> 21:                                                                                                          Exchange Rates
#> 22:                                                                                                                Forecast
#> 23:                                                                 Financial market data (not related to foreign exchange)
#> 24:                                                                    Financial Vehicle Corporation Assets and Liabilities
#> 25:                                                    Foreign eXchange Statistics (foreign reserves & exchange operations)
#> 26:                                                                                                   Government Statistics
#> 27:                                                                                       Insurance corporations operations
#> 28:                                                                                              Indices of Consumer Prices
#> 29:                                                                                              Indices of Consumer Prices
#> 30:                                                                                              Indices of Consumer Prices
#> 31:                                                         Insurance corporations and pension funds assets and liabilities
#> 32:                                                                                     Indicators of Financial Integration
#> 33:                                                                                           Internal Liquidity Management
#> 34:                                                                Interest Rate Statistics (2004 EU Member States & ACCBs)
#> 35:                                                                                                        Investment Funds
#> 36:                                                                                        Large Insurance Group Statistics
#> 37:                                                                           MFI - List of monetary financial institutions
#> 38:                                                                                            MFI Interest Rate Statistics
#> 39:                                                                                                     Money Market Survey
#> 40:                                                                                                 Money Market Statistics
#> 41:                                                                                       Macroeconomic Projection database
#> 42:                                                                                          Other Financial Intermediaries
#> 43:                                                                                                  Open market operations
#> 44:                                                                                  Payments transactions (Key indicators)
#> 45:                                                                      Electronic card payments sent by merchant category
#> 46:                                                     Number of cards issued by resident PSPs by card function and scheme
#> 47:                                                      Number of terminals provided by resident PSPs by type and function
#> 48:                                                                              Number of participants in payments systems
#> 49:                                                                                        Transactions in payments systems
#> 50:                                                                                 Credit transfers (including fraud data)
#> 51:                                                                                    Direct debits (including fraud data)
#> 52:                                                                     E-money payment transactions (including fraud data)
#> 53:                                                   Card payments and cash withdrawals using cards (including fraud data)
#> 54:                                                                      Payment initiation services (including fraud data)
#> 55:                                                                                 Losses due to fraud by liability bearer
#> 56:                                                                                  ATM, OTC and POS terminal transactions
#> 57:                                                                                   Payments transactions by PSP category
#> 58:                                                                                        Pension funds` number of members
#> 59:                                                                                          Payment and Settlement Systems
#> 60:                                                                                              Risk Assessment Indicators
#> 61:                                                                                                  Real Estate Statistics
#> 62:                                                                                                   Retail Interest Rates
#> 63:                                                                                   Residential Property Price Indicators
#> 64:                                                        Real Time Database (context of Euro Area Business Cycle Network)
#> 65:                                                         Survey on the Access to Finance of Small and Medium Enterprises
#> 66:                                                                                                              Securities
#> 67:                                                                                Securities Exchange (trading) Statistics
#> 68: Survey on credit terms and conditions in euro-denominated securities financing and over-the-counter derivatives markets
#> 69:                                                                                Structural Housing Indicators Statistics
#> 70:                                                                                           Securities Holding Statistics
#> 71:                                                                               Banking Structural Statistical Indicators
#> 72:                                                                                        Securities Settlement Statistics
#> 73:                                                                             Short-Term European Paper Statistics (STEP)
#> 74:                                                                                                   Short-Term Statistics
#> 75:                                                                                          Supervisory Banking Statistics
#> 76:                                                                                                         Opinion Surveys
#> 77:                                                                                                         Opinion Surveys
#> 78:                                                                                                         Target Balances
#> 79:                                                                                                          External Trade
#> 80:                                                            Overall, Import, Export and Double Export Weights Statistics
#> 81:                                                                                            Eurostat Balance of Payments
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
