
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bundesbank

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/m-muecke/bundesbank/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/m-muecke/bundesbank/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of bundesbank is to provide a simple interface to the
[Bundesbank
API](https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service).

## Installation

You can install the development version of bundesbank from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("m-muecke/bundesbank")
```

## Usage

``` r
library(bundesbank)

# fetch 10 year daily yield curve
yield_curve <- bb_data(
  flow = "BBSIS",
  key = "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
  start_period = "2020-01-01"
)

library(ggplot2)

yield_curve$date <- as.Date(yield_curve$date)
ggplot(yield_curve, aes(x = date, y = value)) +
  geom_line() +
  labs(x = "Date", y = "Yield")
```

<img src="man/figures/README-demo-1.png" width="100%" />

## Related work

- [bundesbank](https://github.com/enricoschumann/bundesbank): R scripts
  for downloading time-series data from the Bundesbank
