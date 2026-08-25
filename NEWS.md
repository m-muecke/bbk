# bbk 0.13.0

## Breaking changes

* `bbk_data()`, `bbk_series()`, `bis_data()`, `boi_data()`, `boj_data()`, `ecb_data()`, `nob_data()`, and `snb_data()` now return `date` as a `Date` at every frequency. Annual observations use January 1, except BoJ fiscal years, which use April 1. Weekly, quarterly, and semiannual observations use the first day of the period rather than raw labels such as `"2024-Q1"`. This fixes corrupted dates in results that mix annual and subannual series.

## New features

* `boi_data()`, `boi_dimension()`, and `boi_metadata()` now support Bank of Israel (BoI) data.

## Bug fixes

* `banxico_data()` and `banxico_metadata()` now enforce the API's 20-series limit.
* `banxico_data()` and `banxico_metadata()` now include the full error messages returned by the Banxico API.
* `bbk_data()` can now combine series with different attributes.
* `bbk_data()` now keeps untranslated attribute values when English translations are unavailable, so `unit` is no longer missing.
* `bbk_data()`, `bis_data()`, and `ecb_data()` no longer treat observation attributes as series metadata.
* `bbk_metadata()`, `bis_metadata()`, `boi_metadata()`, and `nob_metadata()` now keep entries without a name in the requested language and set their names to `NA`.
* `bbk_metadata()`, `bis_metadata()`, `boi_metadata()`, `ecb_metadata()`, and `nob_metadata()` no longer return names nested inside codelists and concept schemes as separate rows.
* `bbk_series()` now keeps leading observations when a series has a shorter metadata header.
* `bbk_series()` now preserves commas in metadata fields.
* `bbk_series()` now returns a numeric `value` column and omits observations flagged as "Nothing exists".
* `bcb_fx_rates()` now requires three-character currency codes.
* `bde_data()` now supports `lang = "es"`.
* `bde_latest()` now reports unknown series keys instead of an internal error.
* `bdp_data()` now detects weekly, biweekly, and semiannual frequencies. It returns `NA` when there are too few observations to infer a frequency instead of assuming `"annual"`.
* `bdp_data()` now returns correct values for requests covering more than one series, which previously landed on the wrong `key` and, for sparse responses, the wrong dates.
* `bdp_data()` now fetches every page of a result instead of only the first 10 series.
* `bis_data()` now uses `TITLE_TS` when a series has no `TITLE`.
* `boc_data()` now returns an empty table when the requested window has no observations, such as on a weekend.
* `boc_fx_rates()` now returns an empty table when the requested window has no rates.
* `boe_data()` now works outside English locales.
* `boj_data()` now dates fiscal half-year periods to April and October rather than treating them as calendar half-years.
* `cnb_czeonia()` now returns an integer `volume` column when no data are available.
* `cnb_fx_other_rates()` now requires either `year_month` or `year`. Omitting both previously returned an empty table rather than the documented latest month.
* `ecb_fx_rates("latest")` now works outside English locales.
* `nbp_fx_rates()` and `nbp_gold()` now reject `end_date` without `start_date` instead of ignoring it and returning the latest quotation.
* `nob_data()` now requests generic SDMX data and builds series keys from dimensions only. Dataflows with extra series attributes such as `SEC` therefore return valid keys.
* `nob_data()` now keeps dates and values aligned when observations have no value.
* `nob_data()` now supports dataflows without a `FREQ` dimension.
* `onb_data()` and `onb_frequency()` can now combine series with different attributes.
* `onb_metadata()` no longer fails for series whose metadata lists a single release.
* `onb_toc()` now matches each description to the correct element.
* `srb_data()` no longer makes a second request when only `end_date` is supplied.
* `srb_series("groups")` now flattens nested groups without error.

# bbk 0.12.0

* `bcb_data()`, `bcb_currencies()`, `bcb_fx_rates()`, `bcb_expectations()`, `bcb_inflation()`, `bcb_selic()`, and `bcb_top5()` add support for Banco Central do Brasil (BCB) data, covering SGS series, currency lists and exchange rates, and Focus survey market expectations.
* `banxico_data()` and `banxico_metadata()` add support for the Banco de México (Banxico) SIE API, using an API key from `BANXICO_KEY`.
* `nbp_fx_rates()` and `nbp_gold()` now build the request path with the correct dates instead of integer day counts when `start_date`/`end_date` are supplied.

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
