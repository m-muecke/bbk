# Fetch Banco de Portugal (BdP) series metadata

Retrieve metadata for one or more series from the BPstat API. This is
useful to discover the `domain_id` and `dataset_id` needed for
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md).

## Usage

``` r
bdp_series(series_ids, lang = "en")
```

## Source

<https://bpstat.bportugal.pt/data/docs>

## Arguments

- series_ids:

  ([`integer()`](https://rdrr.io/r/base/integer.html))  
  One or more series IDs to look up.

- lang:

  (`character(1)`)  
  Language for labels, either `"EN"` or `"PT"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with series metadata including `domain_ids` and `dataset_id`.

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
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
bdp_series(12518356L)
#>          id                     label                  short_label
#>       <int>                    <char>                       <char>
#> 1: 12518356 GDP at market prices-CP-A GDPmp PT A Current Prices M€
#>                                                                                                 description
#>                                                                                                      <char>
#> 1: GDP expenditure approach - GDP at market prices - Portugal - current prices - millions of euros - annual
#>                          dataset_id domain_id      obs_updated_at
#>                              <char>     <int>              <POSc>
#> 1: ce3e4e50cda325537eff729ef64037cd        54 2025-10-28 17:00:00
# }
```
