# Fetch Czech National Bank (CNB) PRIBOR rates

Retrieve the Prague Interbank Offered Rate (PRIBOR) reference rates for
all maturities from the CNB API.

## Usage

``` r
cnb_pribor(date = NULL, year = NULL)
```

## Source

<https://api.cnb.cz/cnbapi/swagger-ui.html>

## Arguments

- date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  The date to query. If `NULL`, the latest available rates are returned.
  Mutually exclusive with `year`. Default `NULL`.

- year:

  (`NULL` \| `integer(1)`)  
  A calendar year, returning rates for every working day of that year.
  Mutually exclusive with `date`. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested rates. The `period` column holds the maturity (e.g.
`"ONE_DAY"`, `"THREE_MONTH"`) and `pribor` the rate in percent.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nbp_fx_rates()`](https://m-muecke.github.io/bbk/reference/nbp_fx_rates.md),
[`nbp_gold()`](https://m-muecke.github.io/bbk/reference/nbp_gold.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
# latest rates for all maturities
cnb_pribor()
#>          date      period pribor
#>        <Date>      <char>  <num>
#> 1: 2026-06-05     ONE_DAY   3.50
#> 2: 2026-06-05    ONE_WEEK   3.52
#> 3: 2026-06-05   TWO_WEEKS   3.54
#> 4: 2026-06-05   ONE_MONTH   3.55
#> 5: 2026-06-05 THREE_MONTH   3.60
#> 6: 2026-06-05   SIX_MONTH   3.74
#> 7: 2026-06-05    ONE_YEAR   3.88

# all rates for a given year
cnb_pribor(year = 2024L)
#>             date      period pribor
#>           <Date>      <char>  <num>
#>    1: 2024-01-02     ONE_DAY   6.75
#>    2: 2024-01-02    ONE_WEEK   6.77
#>    3: 2024-01-02   TWO_WEEKS   6.79
#>    4: 2024-01-02   ONE_MONTH   6.80
#>    5: 2024-01-02   TWO_MONTH   6.78
#>   ---                              
#> 2264: 2024-12-31   TWO_MONTH   3.99
#> 2265: 2024-12-31 THREE_MONTH   3.92
#> 2266: 2024-12-31   SIX_MONTH   3.79
#> 2267: 2024-12-31  NINE_MONTH   3.78
#> 2268: 2024-12-31    ONE_YEAR   3.70
# }
```
