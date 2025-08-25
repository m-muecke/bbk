
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bbk

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/m-muecke/bbk/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/m-muecke/bbk/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/bbk)](https://CRAN.R-project.org/package=bbk)
[![R-universe
version](https://m-muecke.r-universe.dev/bbk/badges/version)](https://m-muecke.r-universe.dev/bbk)
<!-- badges: end -->

bbk is minimal R client for the following APIs:

- [Banco de España
  (BdE)](https://www.bde.es/webbe/en/estadisticas/recursos/api-estadisticas-bde.html)
- [Bank of England
  (BoE)](https://www.bankofengland.co.uk/boeapps/database)
- [Banque de France
  (BdF)](https://webstat.banque-france.fr/en/pages/guide-migration-api/)
- [Deutsche Bundesbank
  (BBk)](https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service)
- [European Central Bank
  (ECB)](https://data.ecb.europa.eu/help/api/overview)
- [Swiss National Bank (SNB)](https://data.snb.ch/en)
- [Österreichische Nationalbank
  (OeNB)](https://www.oenb.at/en/Statistics/User-Defined-Tables/webservice.html)

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

bbk functions are prefixed according to the central bank they access
(`bbk_`, `ecb_`, `snb_`, `boe_`, `bde_`, `bdf_`, `onb_`) and follow the
naming conventions of their respective APIs.

The typical workflow involves:

1.  Finding the time series identifier on the relevant central bank’s
    website
2.  Using the appropriate bbk function to retrieve the data

``` r
library(bbk)

# Deutsche Bundesbank - fetch 10 year daily yield curve
yield_curve <- bbk_data(
  flow = "BBSIS",
  key = "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
  start_period = "2020-01-01"
)
```

<img src="man/figures/README-plotting-1.png" width="100%" />

## Related work

- [SNBdata](https://github.com/enricoschumann/SNBdata): R package for
  downloading data from the Swiss National Bank (SNB).
- [bundesbank](https://github.com/enricoschumann/bundesbank): R scripts
  for downloading time-series data from the Bundesbank.
- [ecb](https://github.com/expersso/ecb): R interface to the European
  Central Bank’s Statistical Data Warehouse (SDW) API.
- [oenb](https://github.com/franzmohr/oenb): R package for accessing the
  OeNB’s API.
- [pdfetch](https://github.com/abielr/pdfetch): R package for
  downloading economic and financial time series from public sources.
- [readsdmx](https://github.com/mdequeljoe/readsdmx): R package for
  reading SDMX data and metadata.
- [rsdmx](https://github.com/eblondel/rsdmx): R package for reading SDMX
  data and metadata.
- [tidyBdE](https://github.com/rOpenSpain/tidyBdE): R package for
  accessing the Banco de España’s API.
