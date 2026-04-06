# Fetch Bank for International Settlements (BIS) metadata

Retrieve metadata from the BIS SDMX Web Service.

## Usage

``` r
bis_metadata(type, id = NULL)
```

## Source

<https://stats.bis.org/api-doc/v1/>

## Arguments

- type:

  (`character(1)`)  
  The type of metadata to query. One of: `"datastructure"`,
  `"dataflow"`, `"codelist"`, or `"concept"`.

- id:

  (`NULL` \| `character(1)`)  
  The id to query. Default `NULL`.

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
bis_metadata("dataflow")
#>                   id                                         name
#>               <char>                                       <char>
#>  1:      BIS_REL_CAL                         BIS_RELEASE_CALENDAR
#>  2:         WS_CBPOL                    Central bank policy rates
#>  3:       WS_CBS_PUB                         Consolidated banking
#>  4:          WS_CBTA                    Central bank total assets
#>  5: WS_CPMI_CASHLESS                       CPMI cashless payments
#>  6:      WS_CPMI_CT1               CPMI comparative tables type 1
#>  7:      WS_CPMI_CT2               CPMI comparative tables type 2
#>  8:  WS_CPMI_DEVICES                         CPMI payment devices
#>  9: WS_CPMI_INSTITUT                            CPMI institutions
#> 10:    WS_CPMI_MACRO                                   CPMI macro
#> 11: WS_CPMI_PARTICIP                            CPMI participants
#> 12:  WS_CPMI_SYSTEMS                                 CPMI systems
#> 13:           WS_CPP                   Commercial property prices
#> 14:    WS_CREDIT_GAP                           Credit-to-GDP gaps
#> 15: WS_DEBT_SEC2_PUB International debt securities (BIS-compiled)
#> 16:   WS_DER_OTC_TOV                     OTC derivatives turnover
#> 17:           WS_DPP         Detailed residential property prices
#> 18:           WS_DSR                          Debt service ratios
#> 19:           WS_EER                     Effective exchange rates
#> 20:           WS_GLI                  Global liquidity indicators
#> 21:     WS_LBS_D_PUB                           Locational banking
#> 22:      WS_LONG_CPI                   Consumer prices statistics
#> 23:     WS_NA_SEC_C3               BIS debt securities statistics
#> 24:    WS_NA_SEC_DSS                   Debt securities statistics
#> 25:    WS_OTC_DERIV2                  OTC derivatives outstanding
#> 26:           WS_SPP         Selected residential property prices
#> 27:            WS_TC                                 Total credit
#> 28:           WS_XRU                     US dollar exchange rates
#> 29:     WS_XTD_DERIV                  Exchange-traded derivatives
#> 30:              CBS              Consolidated Banking Statistics
#> 31:             LBSN Locational Banking Statistics by Nationality
#> 32:             LBSR   Locational Banking Statistics by Residence
#>                   id                                         name
#>               <char>                                       <char>
bis_metadata("datastructure", "BIS_CBPOL")
#>           id                          name
#>       <char>                        <char>
#> 1: BIS_CBPOL BIS Central Bank Policy Rates
bis_metadata("codelist", "CL_FREQ")
#>         id                                  name
#>     <char>                                <char>
#> 1: CL_FREQ        Code list for Frequency (FREQ)
#> 2: CL_FREQ                                Annual
#> 3: CL_FREQ Daily - business week (not supported)
#> 4: CL_FREQ                                 Daily
#> 5: CL_FREQ                 Event (not supported)
#> 6: CL_FREQ                           Half-yearly
#> 7: CL_FREQ                               Monthly
#> 8: CL_FREQ                             Quarterly
#> 9: CL_FREQ                                Weekly
# }
```
