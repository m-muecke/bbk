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
