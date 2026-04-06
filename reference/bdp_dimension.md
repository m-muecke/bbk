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
  Language for labels, either `"EN"` or `"PT"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with dimensions or categories.

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
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
bdp_dimension(54L)
#>        id                             label
#>     <int>                            <char>
#>  1:     2            Expenditure aggregates
#>  2:     5 Adjustments and temporary effects
#>  3:    56    Reference institutional sector
#>  4:    54 Counterparty institutional sector
#>  5:    63               Reference territory
#>  6:    59            Counterparty territory
#>  7:    66                         Data type
#>  8:    19          Flows, stocks and prices
#>  9:    40                       Periodicity
#> 10:    18                            Source
#> 11:    70                   Unit of measure
#> 12:    28                  Valuation method
#> 13:    29                           Metrics
#>                                                                                                                                                                                                                                             description
#>                                                                                                                                                                                                                                                  <char>
#>  1:                                                               Expenditure aggregates allow the grouping of expenditure items according to certain homogeneity criteria. That is the case of the GDP breakdown according to the expenditure approach
#>  2: Adjustments and temporary effects are a set of procedures on elementary statistical information that enables, the adjustment from seasonal effects, working days, among other effects, in accordance with methodologies that allow data consistency
#>  3:                                                                                                                                                  Reference institutional sector corresponds to the entity's sector on which statistics are compiled
#>  4:                                                                                             Counterparty institutional sector corresponds to the sector of the opposite entity that has transactions with entities on which statistics are compiled
#>  5:                                                                                                                                              Reference territory corresponds to the geographical and / or economic area of the presented statistics
#>  6:                                                                                                                      Counterparty territory corresponds to the geographical and / or economic area of the opposite part of the presented statistics
#>  7:                                                                                                                                    The type of information comprises the type of features that allows the disaggregation of the statistical results
#>  8:                                    Flows and stocks refer to economic events that occur, respectively, over a given time period and at a given moment in time, while prices refer to the economic value of a statistical variable in a given period
#>  9:                                                                                                                                                                                          The periodicity sets the frequency of the statistical data
#> 10:                                                                                                                                                                         The source indicates the entity responsible for the statistical information
#> 11:                                                                                                                                                    The unit of measure indicates what is the unit and the power by which the statistic is expressed
#> 12:                                                                                                                                          The valuation method defines the evaluation criteria followed in the collection of the statistical results
#> 13:                                                                                                                                                         The metrics translates the calculation method applied in the collection of statistical data
# }
```
