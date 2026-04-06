# Fetch Sveriges Riksbank (SRb) calendar days

Retrieve Swedish banking calendar information from the Sveriges Riksbank
SWEA API.

## Usage

``` r
srb_calendar(start_date, end_date = NULL)
```

## Source

<https://developer.api.riksbank.se/>

## Arguments

- start_date:

  (`Date(1)` \| `character(1)`)  
  Start date of the range (e.g., `"2024-01-01"`).

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End date of the range. If `NULL`, data up to the latest available date
  is returned. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the calendar day information.

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
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
srb_calendar("2024-01-01", "2024-01-31")
#>     calendar_date swedish_bankday week_year week_number quarter_number ultimo
#>            <Date>          <lgcl>     <int>       <int>          <int> <lgcl>
#>  1:    2024-01-01           FALSE      2024           1              1  FALSE
#>  2:    2024-01-02            TRUE      2024           1              1  FALSE
#>  3:    2024-01-03            TRUE      2024           1              1  FALSE
#>  4:    2024-01-04            TRUE      2024           1              1  FALSE
#>  5:    2024-01-05            TRUE      2024           1              1  FALSE
#>  6:    2024-01-06           FALSE      2024           1              1  FALSE
#>  7:    2024-01-07           FALSE      2024           1              1  FALSE
#>  8:    2024-01-08            TRUE      2024           2              1  FALSE
#>  9:    2024-01-09            TRUE      2024           2              1  FALSE
#> 10:    2024-01-10            TRUE      2024           2              1  FALSE
#> 11:    2024-01-11            TRUE      2024           2              1  FALSE
#> 12:    2024-01-12            TRUE      2024           2              1  FALSE
#> 13:    2024-01-13           FALSE      2024           2              1  FALSE
#> 14:    2024-01-14           FALSE      2024           2              1  FALSE
#> 15:    2024-01-15            TRUE      2024           3              1  FALSE
#> 16:    2024-01-16            TRUE      2024           3              1  FALSE
#> 17:    2024-01-17            TRUE      2024           3              1  FALSE
#> 18:    2024-01-18            TRUE      2024           3              1  FALSE
#> 19:    2024-01-19            TRUE      2024           3              1  FALSE
#> 20:    2024-01-20           FALSE      2024           3              1  FALSE
#> 21:    2024-01-21           FALSE      2024           3              1  FALSE
#> 22:    2024-01-22            TRUE      2024           4              1  FALSE
#> 23:    2024-01-23            TRUE      2024           4              1  FALSE
#> 24:    2024-01-24            TRUE      2024           4              1  FALSE
#> 25:    2024-01-25            TRUE      2024           4              1  FALSE
#> 26:    2024-01-26            TRUE      2024           4              1  FALSE
#> 27:    2024-01-27           FALSE      2024           4              1  FALSE
#> 28:    2024-01-28           FALSE      2024           4              1  FALSE
#> 29:    2024-01-29            TRUE      2024           5              1  FALSE
#> 30:    2024-01-30            TRUE      2024           5              1  FALSE
#> 31:    2024-01-31            TRUE      2024           5              1   TRUE
#>     calendar_date swedish_bankday week_year week_number quarter_number ultimo
#>            <Date>          <lgcl>     <int>       <int>          <int> <lgcl>
# }
```
