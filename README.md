
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

You can install the released version of bbk from
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
#>             date                                                   key value
#>           <Date>                                                <char> <num>
#>    1: 2020-01-02 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A -0.16
#>    2: 2020-01-03 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A -0.27
#>    3: 2020-01-06 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A -0.27
#>   ---                                                                       
#> 1260: 2024-12-04 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  2.11
#> 1261: 2024-12-05 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  2.10
#> 1262: 2024-12-06 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  2.15
#>                                                                                                                                                                    title
#>                                                                                                                                                                   <char>
#>    1: Yields, derived from the term structure of interest rates, on listed Federal securities with annual coupon payments / residual maturity of 10.0 years / daily data
#>    2: Yields, derived from the term structure of interest rates, on listed Federal securities with annual coupon payments / residual maturity of 10.0 years / daily data
#>    3: Yields, derived from the term structure of interest rates, on listed Federal securities with annual coupon payments / residual maturity of 10.0 years / daily data
#>   ---                                                                                                                                                                   
#> 1260: Yields, derived from the term structure of interest rates, on listed Federal securities with annual coupon payments / residual maturity of 10.0 years / daily data
#> 1261: Yields, derived from the term structure of interest rates, on listed Federal securities with annual coupon payments / residual maturity of 10.0 years / daily data
#> 1262: Yields, derived from the term structure of interest rates, on listed Federal securities with annual coupon payments / residual maturity of 10.0 years / daily data
#>         freq bearer_reg   item valuation currency issuer_class listed_sub
#>       <char>     <char> <char>    <char>   <char>       <char>     <char>
#>    1:  daily          I    ZAR        ZI      EUR        S1311          B
#>    2:  daily          I    ZAR        ZI      EUR        S1311          B
#>    3:  daily          I    ZAR        ZI      EUR        S1311          B
#>   ---                                                                    
#> 1260:  daily          I    ZAR        ZI      EUR        S1311          B
#> 1261:  daily          I    ZAR        ZI      EUR        S1311          B
#> 1262:  daily          I    ZAR        ZI      EUR        S1311          B
#>       security_class maturity interest_type interest_rate redemption
#>               <char>   <char>        <char>        <char>     <char>
#>    1:           A604    R10XX             R             A          A
#>    2:           A604    R10XX             R             A          A
#>    3:           A604    R10XX             R             A          A
#>   ---                                                               
#> 1260:           A604    R10XX             R             A          A
#> 1261:           A604    R10XX             R             A          A
#> 1262:           A604    R10XX             R             A          A
#>       certificate coverage rating time_format decimals    unit unit_mult
#>            <char>   <char> <char>      <char>   <char>  <char>    <char>
#>    1:          _Z       _Z      A         P1D        2 PROZENT         0
#>    2:          _Z       _Z      A         P1D        2 PROZENT         0
#>    3:          _Z       _Z      A         P1D        2 PROZENT         0
#>   ---                                                                   
#> 1260:          _Z       _Z      A         P1D        2 PROZENT         0
#> 1261:          _Z       _Z      A         P1D        2 PROZENT         0
#> 1262:          _Z       _Z      A         P1D        2 PROZENT         0
#>       category unit_eng
#>         <char>   <char>
#>    1:     GKZR  percent
#>    2:     GKZR  percent
#>    3:     GKZR  percent
#>   ---                  
#> 1260:     GKZR  percent
#> 1261:     GKZR  percent
#> 1262:     GKZR  percent
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
