# bbk (development version)

* Support for Banco Central do Brasil (BCB) data.
* `banxico_data()` and `banxico_metadata()` add support for the Banco de México (Banxico) SIE API, using an API key from `BANXICO_KEY`.

# bbk 0.11.0

## New features

* `bdf_dimension()` returns the dimension structure for a given Banque de France dataset.
* `cnb_czeonia()` returns the CZEONIA overnight reference rate from the Czech National Bank (CNB).
* `cnb_data()`, `cnb_indicators()`, `cnb_dimension()`, `cnb_tree()`, and `cnb_snapshots()` add support for the Czech National Bank (CNB) ARAD database, using an API key from `CNB_ARAD_KEY`.
* `cnb_fx_other_rates()` returns the Czech National Bank (CNB) monthly exchange rates for other (less commonly traded) currencies.
* `cnb_fx_rates()` and `cnb_pribor()` add support for Czech National Bank (CNB) exchange rate fixings and PRIBOR reference rates.
* `snb_metadata()` returns cube-level metadata (title, frequency, source, publication date) from the SNB data portal.
* `snb_toc()` returns the publication topic tree from the SNB data portal.

## Bug fixes

* Data requests no longer abort when a series uses an unsupported frequency code; the code is kept and the date is returned unparsed.
* `bbk_data()` now returns the correct observations per series when querying multiple keys.
* `bdp_data()` now keeps missing observations as `NA` instead of returning an empty result.
* `bis_data()` and `ecb_data()` now keep dates and values aligned when a series has observations without a value.
* `boc_data()` now applies `start_date` and `end_date` when fetching a group, which were previously ignored.
* `boj_data()` no longer errors when a series omits both the English and Japanese translations of its name or unit.
* `onb_data()` no longer errors and returns an empty table when a series has no observations in the requested period.

# bbk 0.10.0

* `bbk_data()`, `bis_data()`, and `bdp_data()` gained an `updated_after` argument for incremental retrieval of revised observations, matching the existing parameter on `ecb_data()`. All four now accept a `Date`, `POSIXct`, or ISO 8601 string.
* `bis_data()` now requests the SDMX generic data format explicitly, fixing a silent regression where the BIS endpoint started returning structure-specific data and the parser produced zero rows.
* Support for Banco de Portugal (BdP) data.
* Support for Bank of Japan (BoJ) data.
* Support for National Bank of Poland (NBP) exchange rates and gold prices.

# bbk 0.9.0

* Add optional caching of API responses via `options(bbk.cache = TRUE)`. Cached
  responses are stored for 1 day by default and can be customized with
  `options(bbk.cache_max_age = seconds)`. Use `bbk_cache_dir()` to find the cache
  location and `bbk_cache_clear()` to clear it.
* Support for Bank for International Settlements (BIS) data.
* Support for Norges Bank (NoB) data.
* `boc_data()` now returns a `value` column instead of `rate` for consistency with other data functions.
* `bde_latest()` returns the most recently published value for one or more BdE series.
* `bbk_dimension()` returns the dimension structure for a given Bundesbank dataflow.
* `bis_dimension()` returns the dimension structure for a given BIS dataflow.
* `ecb_data()` gains an `updated_after` parameter to retrieve only observations updated after a given timestamp.
* `ecb_dimension()` returns the dimension structure for a given ECB dataflow.
* `nob_dimension()` returns the dimension structure for a given Norges Bank dataflow.
* `snb_dimension()` returns the dimension structure for a given SNB cube.
* `srb_calendar()` returns Swedish banking calendar day information.
* `srb_cross_rates()` computes cross exchange rates between two Riksbank currency series.
* Support for Sveriges Riksbank (SRb) data.

# bbk 0.8.0

* Add missing data in `bbk_series()`.
* Support for exchange rates from the Bank of Canada (BoC).
* Support for Bank of Canada (BoC) data.

# bbk 0.7.0

* Switch to checkmate for input validation.
* Documentation improvements.
* Support for Bank of England (BoE) data.
* Support for Banque de France (BdF) data.
* Support for Banco de España (BdE) data.
* Support for Österreichische Nationalbank (OeNB) data.

# bbk 0.6.0

* Migration to data.table package. Internal data manipulation is now done using
  data.table and all functions return data.table objects.
* Support for Swiss National Bank (SNB) data.

# bbk 0.5.0

* New function `ecb_euro_rates()` to get euro foreign exchange reference rates
  from the European Central Bank (ECB).

# bbk 0.4.0

* Support for European Central Bank (ECB) data.

# bbk 0.3.0

* Prefix in function name has changed from `bb_` to `bbk_`.
* Allow multiple keys in `bbk_data()`.
* Dynamically parse column names in `bbk_data()`.
* Support for `/data/flowRef` endpoint.

# bbk 0.2.0

* Remove missing rows in `bb_series()`.
* Better title and unit parsing for `bb_series()`.

# bbk 0.1.0

* Initial CRAN submission.
