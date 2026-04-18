# Fetch Norges Bank (NoB) metadata

Retrieve metadata from the Norges Bank SDMX Web Service.

## Usage

``` r
nob_metadata(type, id = NULL, lang = "en")
```

## Source

<https://www.norges-bank.no/en/topics/Statistics/open-data/>

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
  Language for names, either `"en"` or `"no"`. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested metadata.

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
nob_metadata("dataflow")
#>                        id
#>                    <char>
#>  1:            ANN_FX_SPU
#>  2:              ANN_KPRA
#>  3:              ANN_TEST
#>  4:          CBC_CALENDAR
#>  5:       CBC_INSTRUMENTS
#>  6:      CBC_TRANSACTIONS
#>  7:                   EXR
#>  8:              FAUCTION
#>  9:  FINANCIAL_INDICATORS
#> 10:    GOVT_GENERIC_RATES
#> 11:              GOVT_IRS
#> 12:       GOVT_KEYFIGURES
#> 13:   GOVT_PRIMARY_MARKET
#> 14: GOVT_SECONDARY_MARKET
#> 15:       GOVT_ZEROCOUPON
#> 16:                    IR
#> 17:    LIQUIDITY_FORECAST
#> 18:  LIQUIDITY_STATISTICS
#> 19:          MONEY_MARKET
#> 20:                REGNET
#> 21:                   SEC
#> 22: SETTLEMENT_STATISTICS
#> 23:           SHORT_RATES
#>                        id
#>                    <char>
#>                                                               name
#>                                                             <char>
#>  1: Announcement of foreign exchange transactions on behalf of SPU
#>  2:                                   Key policy rate announcement
#>  3:                                  Announcement of test messages
#>  4:                                 Central Bank Issuance Calendar
#>  5:                              Central bank issuance instruments
#>  6:                          Central bank certificate transactions
#>  7:                                                 Exchange rates
#>  8:                        Announcements and results of F-auctions
#>  9:                                           Financial indicators
#> 10:                                         Generic interest rates
#> 11:                                            Interest rate swaps
#> 12:                                  Key Goverment Debt Indicators
#> 13:               Norwegian government securities – Primary market
#> 14:             Norwegian government securities – Secondary market
#> 15:           Norwegian government securities - Zero coupon yields
#> 16:                                                    Policy rate
#> 17:                       Structural liquidity and total liquidity
#> 18:                                           Liquidity statistics
#> 19:                                              Money market data
#> 20:                                               Regional Network
#> 21:            Norwegian government securities - Prices and yields
#> 22:                                          Settlement Statistics
#> 23:                                                    Short rates
#>                                                               name
#>                                                             <char>
nob_metadata("datastructure")
#>                            id
#>                        <char>
#>  1:            DSD_ANN_FX_SPU
#>  2:              DSD_ANN_KPRA
#>  3:              DSD_ANN_TEST
#>  4:          DSD_CBC_CALENDAR
#>  5:       DSD_CBC_INSTRUMENTS
#>  6:      DSD_CBC_TRANSACTIONS
#>  7:                   DSD_EXR
#>  8:              DSD_FAUCTION
#>  9:  DSD_FINANCIAL_INDICATORS
#> 10:    DSD_GOVT_GENERIC_RATES
#> 11:              DSD_GOVT_IRS
#> 12:       DSD_GOVT_KEYFIGURES
#> 13:   DSD_GOVT_PRIMARY_MARKET
#> 14: DSD_GOVT_SECONDARY_MARKET
#> 15:       DSD_GOVT_ZEROCOUPON
#> 16:                    DSD_IR
#> 17:    DSD_LIQUIDITY_FORECAST
#> 18:  DSD_LIQUIDITY_STATISTICS
#> 19:          DSD_MONEY_MARKET
#> 20:                DSD_REGNET
#> 21:                   DSD_SEC
#> 22: DSD_SETTLEMENT_STATISTICS
#> 23:           DSD_SHORT_RATES
#>                            id
#>                        <char>
#>                                                     name
#>                                                   <char>
#>  1: Announcement of foreign exchange transaction for SPU
#>  2:                         Key policy rate announcement
#>  3:                        Announcement of test messages
#>  4:            Central bank certificate auction calendar
#>  5:                             Central bank instruments
#>  6:                Central bank certificate transactions
#>  7:                                       Exchange rates
#>  8:              Announcements and results of F-auctions
#>  9:                                 Financial indicators
#> 10:                               Generic interest rates
#> 11:                                  Interest rate swaps
#> 12:                Norwegian government debt key figures
#> 13:                                       Primary market
#> 14:                            Secondary Market turnover
#> 15:             Government securities Zero coupons rates
#> 16:                                          Policy rate
#> 17:             Structural liquidity and total liquidity
#> 18:                                 Liquidity statistics
#> 19:                                 Money Market Figures
#> 20:                                     Regional Network
#> 21:                                           Securities
#> 22:                                Settlement Statistics
#> 23:                                 Short Interest rates
#>                                                     name
#>                                                   <char>
nob_metadata("codelist", "CL_CURRENCY")
#>               id                name
#>           <char>              <char>
#>   1: CL_CURRENCY            Currency
#>   2: CL_CURRENCY     Norwegian krone
#>   3: CL_CURRENCY         Swiss franc
#>   4: CL_CURRENCY           US dollar
#>   5: CL_CURRENCY                Euro
#>  ---                                
#> 183: CL_CURRENCY ADB Unit of Account
#> 184: CL_CURRENCY         No currency
#> 185: CL_CURRENCY         Yemeni rial
#> 186: CL_CURRENCY      Zambian kwacha
#> 187: CL_CURRENCY   Zimbabwean dollar
# }
```
