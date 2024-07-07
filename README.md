
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bbk

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/m-muecke/bbk/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/m-muecke/bbk/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/bbk)](https://CRAN.R-project.org/package=bbk)
<!-- badges: end -->

bbk is minimal R client for the [Deutsche
Bundesbank](https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service)
and the [European Central Bank
(ECB)](https://data.ecb.europa.eu/help/api/overview) APIs.

> In the future, it may be extended to other central banks and financial
> institutions. Feel free to open an issue if you have a specific
> request.

## Installation

You can install the released version of **bbk** from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("bbk")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("m-muecke/bbk")
```

## Usage

bbk functions are prefixed with either `bbk_` or `ecb_` depending on the
origin of the data and follow the naming convention of the APIs. The
usual workflow would be to search for the time series key on the [ECB
Portal](https://data.ecb.europa.eu/) or [Bundesbank
website](https://www.bundesbank.de/en/statistics/time-series-databases)
and then use it to retrieve the data.

``` r
library(bbk)

# fetch 10 year daily yield curve
yield_curve <- bbk_data(
  flow = "BBSIS",
  key = "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
  start_period = "2020-01-01"
)
yield_curve
#> # A tibble: 1,152 × 25
#>   date       key           value title freq  bearer_reg item  valuation currency
#>   <date>     <chr>         <dbl> <chr> <chr> <chr>      <chr> <chr>     <chr>   
#> 1 2020-01-02 BBSIS.D.I.ZA… -0.16 Yiel… daily I          ZAR   ZI        EUR     
#> 2 2020-01-03 BBSIS.D.I.ZA… -0.27 Yiel… daily I          ZAR   ZI        EUR     
#> 3 2020-01-06 BBSIS.D.I.ZA… -0.27 Yiel… daily I          ZAR   ZI        EUR     
#> 4 2020-01-07 BBSIS.D.I.ZA… -0.27 Yiel… daily I          ZAR   ZI        EUR     
#> 5 2020-01-08 BBSIS.D.I.ZA… -0.27 Yiel… daily I          ZAR   ZI        EUR     
#> # ℹ 1,147 more rows
#> # ℹ 16 more variables: issuer_class <chr>, listed_sub <chr>,
#> #   security_class <chr>, maturity <chr>, interest_type <chr>,
#> #   interest_rate <chr>, redemption <chr>, certificate <chr>, coverage <chr>,
#> #   rating <chr>, time_format <chr>, decimals <chr>, unit <chr>,
#> #   unit_mult <chr>, category <chr>, unit_eng <chr>
```

<img src="man/figures/README-plotting-1.png" width="100%" />

## Related work

- [bundesbank](https://github.com/enricoschumann/bundesbank): R scripts
  for downloading time-series data from the Bundesbank.
- [ecb](https://github.com/expersso/ecb): R interface to the European
  Central Bank’s Statistical Data Warehouse (SDW) API.
- [rsdmx](https://github.com/opensdmx/rsdmx): R package for reading SDMX
  data and metadata.
- [readsdmx](https://github.com/mdequeljoe/readsdmx): R package for
  reading SDMX data and metadata.
- [pdfetch](https://github.com/abielr/pdfetch): R package for
  downloading economic and financial time series from public sources.
