
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bbk

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/m-muecke/bbk/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/m-muecke/bbk/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

bbk is minimal R client for the
[Bundesbank](https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service)
SDMX Web Service API.

## Installation

You can install the development version of bbk from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("m-muecke/bbk")
```

## Usage

bbk functions are prefixed with `bb_` and follow the naming convention
of the API. The usual workflow would be to search for the time series
key on the [Bundesbank
website](https://www.bundesbank.de/en/statistics/time-series-databases)
and then use it to retrieve the data with either `bb_data()` or
`bb_series` depending on your needs.

``` r
library(bbk)

# fetch 10 year daily yield curve
yield_curve <- bb_data(
  flow = "BBSIS",
  key = "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
  start_period = "2020-01-01"
)
yield_curve
#> # A tibble: 1,098 × 8
#>   date       key            title category unit  unit_multiplier frequency value
#>   <date>     <chr>          <chr> <chr>    <chr> <chr>           <chr>     <dbl>
#> 1 2020-01-02 D.I.ZAR.ZI.EU… Yiel… GKZR     perc… 0               daily     -0.16
#> 2 2020-01-03 D.I.ZAR.ZI.EU… Yiel… GKZR     perc… 0               daily     -0.27
#> 3 2020-01-06 D.I.ZAR.ZI.EU… Yiel… GKZR     perc… 0               daily     -0.27
#> 4 2020-01-07 D.I.ZAR.ZI.EU… Yiel… GKZR     perc… 0               daily     -0.27
#> 5 2020-01-08 D.I.ZAR.ZI.EU… Yiel… GKZR     perc… 0               daily     -0.27
#> # ℹ 1,093 more rows
```

<img src="man/figures/README-plotting-1.png" width="100%" />

## Related work

- [bundesbank](https://github.com/enricoschumann/bundesbank): R scripts
  for downloading time-series data from the Bundesbank
- [rsdmx](https://github.com/opensdmx/rsdmx): R package for reading SDMX
  data and metadata.
- [readsdmx](https://github.com/mdequeljoe/readsdmx): R package for
  reading SDMX data and metadata.
