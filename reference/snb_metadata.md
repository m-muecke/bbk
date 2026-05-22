# Fetch Swiss National Bank (SNB) cube metadata

Retrieve cube-level metadata (title, frequency, source, publication
date) from the SNB data portal.

## Usage

``` r
snb_metadata(key, lang = "en")
```

## Source

<https://data.snb.ch/en>

## Arguments

- key:

  (`character(1)`)  
  The series key to query.

- lang:

  (`character(1)`)  
  Language to query, either `"en"` or `"de"`. Default `"en"`.

## Value

A single-row
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns:

- key:

  The cube key

- title:

  The cube title

- sub_title:

  The cube subtitle

- publishing_title:

  The publishing section title

- public_since_date:

  The first publication date

- frequency:

  The frequency specification (e.g., `"Day"`, `"Month"`)

- source:

  The data source

- has_multiple_sources:

  Whether the cube has multiple sources

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
[`snb_toc()`](https://m-muecke.github.io/bbk/reference/snb_toc.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
snb_metadata("rendopar")
#>         key                             title
#>      <char>                            <char>
#> 1: rendopar Nelson-Siegel-Svensson parameters
#>                                                       sub_title
#>                                                          <char>
#> 1: For calculating the daily yield curve of Confederation bonds
#>                     publishing_title public_since_date frequency
#>                               <char>            <Date>    <char>
#> 1: Interest rates and exchange rates        2025-09-01       Day
#>                       source has_multiple_sources
#>                       <char>               <lgcl>
#> 1: Swiss National Bank (SNB)                FALSE
# }
```
