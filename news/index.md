# Changelog

## bbk (development version)

## bbk 0.8.0

CRAN release: 2025-10-01

- Add missing data in
  [`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md).
- Support for exchange rates from the Bank of Canada (BoC).
- Support for Bank of Canada (BoC) data.

## bbk 0.7.0

CRAN release: 2025-08-25

- Switch to checkmate for input validation.
- Documentation improvements.
- Support for Bank of England (BoE) data.
- Support for Banque de France (BdF) data.
- Support for Banco de España (BdE) data.
- Support for Österreichische Nationalbank (OeNB) data.

## bbk 0.6.0

CRAN release: 2025-02-02

- Migration to data.table package. Internal data manipulation is now
  done using data.table and all functions return data.table objects.
- Support for Swiss National Bank (SNB) data.

## bbk 0.5.0

CRAN release: 2024-12-02

- New function
  [`ecb_euro_rates()`](https://m-muecke.github.io/bbk/reference/ecb_fx_rates.md)
  to get euro foreign exchange reference rates from the European Central
  Bank (ECB).

## bbk 0.4.0

CRAN release: 2024-07-08

- Support for European Central Bank (ECB) data.

## bbk 0.3.0

CRAN release: 2024-06-12

- Prefix in function name has changed from `bb_` to `bbk_`.
- Allow multiple keys in
  [`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md).
- Dynamically parse column names in
  [`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md).
- Support for `/data/flowRef` endpoint.

## bbk 0.2.0

CRAN release: 2024-04-30

- Remove missing rows in `bb_series()`.
- Better title and unit parsing for `bb_series()`.

## bbk 0.1.0

CRAN release: 2024-04-23

- Initial CRAN submission.
