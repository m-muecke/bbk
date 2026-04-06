# Fetch Banco de Portugal (BdP) datasets

Retrieve the list of datasets for a given domain from the BPstat API.

## Usage

``` r
bdp_dataset(domain_id, lang = "en")
```

## Source

<https://bpstat.bportugal.pt/data/docs>

## Arguments

- domain_id:

  (`integer(1)`)  
  The domain ID. Use
  [`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md)
  to list available domains.

- lang:

  (`character(1)`)  
  Language for labels, either `"EN"` or `"PT"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with available datasets.

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
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
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
bdp_dataset(54L)
#>                                  id
#>                              <char>
#> 1: 8a9766347128321e0bd8a7806d8d2c02
#> 2: 8b6aeea21d8686f3788d49c7551779df
#> 3: b8689dffe321f45a2e5f70a77295e20d
#> 4: ce3e4e50cda325537eff729ef64037cd
#>                                                                                                                                                                                                                                                                              label
#>                                                                                                                                                                                                                                                                             <char>
#> 1:                                                                                                       Expenditure aggregates; Adjustments and temporary effects; Source; Flows, stocks and prices; Valuation method; Metrics; Periodicity; Reference territory; Unit of measure
#> 2:                                                                                                                  Expenditure aggregates; Source; Flows, stocks and prices; Valuation method; Metrics; Periodicity; Counterparty territory; Reference territory; Unit of measure
#> 3: Expenditure aggregates; Adjustments and temporary effects; Source; Flows, stocks and prices; Valuation method; Metrics; Periodicity; Counterparty institutional sector; Reference institutional sector; Counterparty territory; Reference territory; Data type; Unit of measure
#> 4:                                                                                                                                          Expenditure aggregates; Source; Flows, stocks and prices; Valuation method; Metrics; Periodicity; Reference territory; Unit of measure
#>    num_series      obs_updated_at
#>         <int>              <POSc>
#> 1:         89 2026-03-09 16:30:00
#> 2:          3 2025-10-28 17:00:00
#> 3:          5 2026-03-09 16:30:00
#> 4:        412 2026-03-06 17:00:00
# }
```
