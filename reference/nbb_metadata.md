# Fetch National Bank of Belgium (NBB) metadata

Retrieve metadata from the National Bank of Belgium SDMX Web Service
(NBB.Stat).

## Usage

``` r
nbb_metadata(type, id = NULL, lang = "en")
```

## Source

<https://stat.nbb.be/>

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
  Language for names, one of `"en"`, `"fr"`, or `"nl"`. Default `"en"`.

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
[`boi_metadata()`](https://m-muecke.github.io/bbk/reference/boi_metadata.md),
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
[`cnb_dimension()`](https://m-muecke.github.io/bbk/reference/cnb_dimension.md),
[`cnb_indicators()`](https://m-muecke.github.io/bbk/reference/cnb_indicators.md),
[`cnb_snapshots()`](https://m-muecke.github.io/bbk/reference/cnb_snapshots.md),
[`cnb_tree()`](https://m-muecke.github.io/bbk/reference/cnb_tree.md),
[`ecb_dimension()`](https://m-muecke.github.io/bbk/reference/ecb_dimension.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`nbb_dimension()`](https://m-muecke.github.io/bbk/reference/nbb_dimension.md),
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
nbb_metadata("dataflow")
#>                     id
#>                 <char>
#>   1:        DF_AFCSURV
#>   2: DF_AFCSURV_CREDIT
#>   3:   DF_AGREED_WAGES
#>   4:          DF_AMOLO
#>   5:        DF_AMPORTS
#>  ---                  
#> 191:       DF_TREASURY
#> 192:       DF_TREASVAR
#> 193:         DF_UCIDEV
#> 194:   DF_UNEMPLOYMENT
#> 195:  DF_UNEMPLOY_RATE
#>                                                                                          name
#>                                                                                        <char>
#>   1:                               Quarterly survey on the assessment of financing conditions
#>   2: Quarterly survey on the assessment of financing conditions: Credit constraint perception
#>   3:                                                                Collectively agreed wages
#>   4:                                                       Outstanding amount of linear bonds
#>   5:                                                                              Ports study
#>  ---                                                                                         
#> 191:                                                                                 Treasury
#> 192:              Nominal variation of the net debt and net financial balance of the Treasury
#> 193:                                                                     Developments of UCIs
#> 194:                                         Number of unemployed job-seekers - unemployement
#> 195:                                                             Harmonised unemployment rate
nbb_metadata("datastructure", "DSD_EXR")
#>         id    name
#>     <char>  <char>
#> 1: DSD_EXR EXR DSD
nbb_metadata("codelist", "CL_EXR_CURRENCY")
#>                 id     name
#>             <char>   <char>
#> 1: CL_EXR_CURRENCY Currency
nbb_metadata("dataflow", "DF_EXR", lang = "fr")
#>        id                                                                  name
#>    <char>                                                                <char>
#> 1: DF_EXR Cours de change de référence de l'euro en unités de monnaie nationale
# }
```
