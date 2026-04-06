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
[`bdp_domains()`](https://m-muecke.github.io/bbk/reference/bdp_domains.md),
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
#>  4:                   EXR
#>  5:              FAUCTION
#>  6:  FINANCIAL_INDICATORS
#>  7:    GOVT_GENERIC_RATES
#>  8:              GOVT_IRS
#>  9:       GOVT_KEYFIGURES
#> 10:   GOVT_PRIMARY_MARKET
#> 11: GOVT_SECONDARY_MARKET
#> 12:       GOVT_ZEROCOUPON
#> 13:                    IR
#> 14:    LIQUIDITY_FORECAST
#> 15:  LIQUIDITY_STATISTICS
#> 16:          MONEY_MARKET
#> 17:                REGNET
#> 18:                   SEC
#> 19: SETTLEMENT_STATISTICS
#> 20:           SHORT_RATES
#>                        id
#>                    <char>
#>                                                               name
#>                                                             <char>
#>  1: Announcement of foreign exchange transactions on behalf of SPU
#>  2:                                   Key policy rate announcement
#>  3:                                  Announcement of test messages
#>  4:                                                 Exchange rates
#>  5:                        Announcements and results of F-auctions
#>  6:                                           Financial indicators
#>  7:                                         Generic interest rates
#>  8:                                            Interest rate swaps
#>  9:                                  Key Goverment Debt Indicators
#> 10:               Norwegian government securities – Primary market
#> 11:             Norwegian government securities – Secondary market
#> 12:           Norwegian government securities - Zero coupon yields
#> 13:                                                    Policy rate
#> 14:                       Structural liquidity and total liquidity
#> 15:                                           Liquidity statistics
#> 16:                                              Money market data
#> 17:                                               Regional Network
#> 18:            Norwegian government securities - Prices and yields
#> 19:                                          Settlement Statistics
#> 20:                                                    Short rates
#>                                                               name
#>                                                             <char>
nob_metadata("datastructure")
#>                            id
#>                        <char>
#>  1:            DSD_ANN_FX_SPU
#>  2:              DSD_ANN_KPRA
#>  3:              DSD_ANN_TEST
#>  4:                   DSD_EXR
#>  5:              DSD_FAUCTION
#>  6:  DSD_FINANCIAL_INDICATORS
#>  7:    DSD_GOVT_GENERIC_RATES
#>  8:              DSD_GOVT_IRS
#>  9:       DSD_GOVT_KEYFIGURES
#> 10:   DSD_GOVT_PRIMARY_MARKET
#> 11: DSD_GOVT_SECONDARY_MARKET
#> 12:       DSD_GOVT_ZEROCOUPON
#> 13:                    DSD_IR
#> 14:    DSD_LIQUIDITY_FORECAST
#> 15:  DSD_LIQUIDITY_STATISTICS
#> 16:          DSD_MONEY_MARKET
#> 17:                DSD_REGNET
#> 18:                   DSD_SEC
#> 19: DSD_SETTLEMENT_STATISTICS
#> 20:           DSD_SHORT_RATES
#>                            id
#>                        <char>
#>                                                     name
#>                                                   <char>
#>  1: Announcement of foreign exchange transaction for SPU
#>  2:                         Key policy rate announcement
#>  3:                        Announcement of test messages
#>  4:                                       Exchange rates
#>  5:              Announcements and results of F-auctions
#>  6:                                 Financial indicators
#>  7:                               Generic interest rates
#>  8:                                  Interest rate swaps
#>  9:                Norwegian government debt key figures
#> 10:                                       Primary market
#> 11:                            Secondary Market turnover
#> 12:             Government securities Zero coupons rates
#> 13:                                          Policy rate
#> 14:             Structural liquidity and total liquidity
#> 15:                                 Liquidity statistics
#> 16:                                 Money Market Figures
#> 17:                                     Regional Network
#> 18:                                           Securities
#> 19:                                Settlement Statistics
#> 20:                                 Short Interest rates
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
