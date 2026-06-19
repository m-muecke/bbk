# Fetch Banco de Portugal (BdP) dimensions

Retrieve the list of dimensions for a given domain, or the categories
within a single dimension.

## Usage

``` r
bdp_dimension(domain_id, dimension_id = NULL, lang = "en")
```

## Source

<https://bpstat.bportugal.pt/data/docs>

## Arguments

- domain_id:

  (`integer(1)`)  
  The domain ID. Use
  [`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md)
  to list available domains.

- dimension_id:

  (`NULL` \| `integer(1)`)  
  Optional dimension ID. If `NULL`, all dimensions for the domain are
  returned. If specified, the categories within that dimension are
  returned.

- lang:

  (`character(1)`)  
  Language for labels, either `"en"` or `"pt"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with dimensions or categories.

## See also

Other metadata:
[`banxico_metadata()`](https://m-muecke.github.io/bbk/reference/banxico_metadata.md),
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bcb_currencies()`](https://m-muecke.github.io/bbk/reference/bcb_currencies.md),
[`bdf_dimension()`](https://m-muecke.github.io/bbk/reference/bdf_dimension.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
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
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
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
bdp_dimension(54L)
#>        id                             label
#>     <int>                            <char>
#>  1:     2            Expenditure aggregates
#>  2:     5 Adjustments and temporary effects
#>  3:    63               Reference territory
#>  4:    59            Counterparty territory
#>  5:    19          Flows, stocks and prices
#>  6:    40                       Periodicity
#>  7:    18                            Source
#>  8:    70                   Unit of measure
#>  9:    28                  Valuation method
#> 10:    29                           Metrics
#>                                                                                                                                                                                                                                             description
#>                                                                                                                                                                                                                                                  <char>
#>  1:                                                               Expenditure aggregates allow the grouping of expenditure items according to certain homogeneity criteria. That is the case of the GDP breakdown according to the expenditure approach
#>  2: Adjustments and temporary effects are a set of procedures on elementary statistical information that enables, the adjustment from seasonal effects, working days, among other effects, in accordance with methodologies that allow data consistency
#>  3:                                                                                                                                              Reference territory corresponds to the geographical and / or economic area of the presented statistics
#>  4:                                                                                                                      Counterparty territory corresponds to the geographical and / or economic area of the opposite part of the presented statistics
#>  5:                                    Flows and stocks refer to economic events that occur, respectively, over a given time period and at a given moment in time, while prices refer to the economic value of a statistical variable in a given period
#>  6:                                                                                                                                                                                          The periodicity sets the frequency of the statistical data
#>  7:                                                                                                                                                                         The source indicates the entity responsible for the statistical information
#>  8:                                                                                                                                                    The unit of measure indicates what is the unit and the power by which the statistic is expressed
#>  9:                                                                                                                                          The valuation method defines the evaluation criteria followed in the collection of the statistical results
#> 10:                                                                                                                                                         The metrics translates the calculation method applied in the collection of statistical data
# }
```
