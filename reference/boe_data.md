# Fetch Bank of England (BoE) data

Retrieve time series data from the BoE database.

## Usage

``` r
boe_data(key, start_date, end_date = Sys.Date())
```

## Source

<https://www.bankofengland.co.uk/boeapps/database>

## Arguments

- key:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  The series keys to query.

- start_date:

  (`character(1)` \| `Date(1)`)  
  Start date of the data.

- end_date:

  (`character(1)` \| `Date(1)`)  
  End date of the data. Default is today's date.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

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
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
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
# Bank Rate
boe_data("IUDBEDR", "2015-01-01")
#>             date     key value        description   freq        instruments
#>           <Date>  <char> <num>             <char> <char>             <char>
#>    1: 2015-01-02 IUDBEDR  0.50 Official Bank Rate  daily Official Bank Rate
#>    2: 2015-01-05 IUDBEDR  0.50 Official Bank Rate  daily Official Bank Rate
#>    3: 2015-01-06 IUDBEDR  0.50 Official Bank Rate  daily Official Bank Rate
#>    4: 2015-01-07 IUDBEDR  0.50 Official Bank Rate  daily Official Bank Rate
#>    5: 2015-01-08 IUDBEDR  0.50 Official Bank Rate  daily Official Bank Rate
#>   ---                                                                      
#> 2875: 2026-05-20 IUDBEDR  3.75 Official Bank Rate  daily Official Bank Rate
#> 2876: 2026-05-21 IUDBEDR  3.75 Official Bank Rate  daily Official Bank Rate
#> 2877: 2026-05-22 IUDBEDR  3.75 Official Bank Rate  daily Official Bank Rate
#> 2878: 2026-05-26 IUDBEDR  3.75 Official Bank Rate  daily Official Bank Rate
#> 2879: 2026-05-27 IUDBEDR  3.75 Official Bank Rate  daily Official Bank Rate

# SONIA daily rate
boe_data("IUDSOIA", "2015-01-01")
#>             date     key  value
#>           <Date>  <char>  <num>
#>    1: 2015-01-02 IUDSOIA 0.4316
#>    2: 2015-01-05 IUDSOIA 0.4335
#>    3: 2015-01-06 IUDSOIA 0.4300
#>    4: 2015-01-07 IUDSOIA 0.4292
#>    5: 2015-01-08 IUDSOIA 0.4339
#>   ---                          
#> 2874: 2026-05-19 IUDSOIA 3.7302
#> 2875: 2026-05-20 IUDSOIA 3.7301
#> 2876: 2026-05-21 IUDSOIA 3.7309
#> 2877: 2026-05-22 IUDSOIA 3.7301
#> 2878: 2026-05-26 IUDSOIA 3.7290
#>                                               description   freq
#>                                                    <char> <char>
#>    1: Daily Sterling overnight index average (SONIA) rate  daily
#>    2: Daily Sterling overnight index average (SONIA) rate  daily
#>    3: Daily Sterling overnight index average (SONIA) rate  daily
#>    4: Daily Sterling overnight index average (SONIA) rate  daily
#>    5: Daily Sterling overnight index average (SONIA) rate  daily
#>   ---                                                           
#> 2874: Daily Sterling overnight index average (SONIA) rate  daily
#> 2875: Daily Sterling overnight index average (SONIA) rate  daily
#> 2876: Daily Sterling overnight index average (SONIA) rate  daily
#> 2877: Daily Sterling overnight index average (SONIA) rate  daily
#> 2878: Daily Sterling overnight index average (SONIA) rate  daily

# 10-year nominal par yield
boe_data("IUDMNPY", "2015-01-01")
#>             date     key  value
#>           <Date>  <char>  <num>
#>    1: 2015-01-02 IUDMNPY 1.7846
#>    2: 2015-01-05 IUDMNPY 1.7162
#>    3: 2015-01-06 IUDMNPY 1.6465
#>    4: 2015-01-07 IUDMNPY 1.6584
#>    5: 2015-01-08 IUDMNPY 1.6970
#>   ---                          
#> 2874: 2026-05-19 IUDMNPY 5.0833
#> 2875: 2026-05-20 IUDMNPY 4.9554
#> 2876: 2026-05-21 IUDMNPY 4.9293
#> 2877: 2026-05-22 IUDMNPY 4.8666
#> 2878: 2026-05-26 IUDMNPY 4.8428
#>                                                               description
#>                                                                    <char>
#>    1: Yield from British Government Securities, 10 year Nominal Par Yield
#>    2: Yield from British Government Securities, 10 year Nominal Par Yield
#>    3: Yield from British Government Securities, 10 year Nominal Par Yield
#>    4: Yield from British Government Securities, 10 year Nominal Par Yield
#>    5: Yield from British Government Securities, 10 year Nominal Par Yield
#>   ---                                                                    
#> 2874: Yield from British Government Securities, 10 year Nominal Par Yield
#> 2875: Yield from British Government Securities, 10 year Nominal Par Yield
#> 2876: Yield from British Government Securities, 10 year Nominal Par Yield
#> 2877: Yield from British Government Securities, 10 year Nominal Par Yield
#> 2878: Yield from British Government Securities, 10 year Nominal Par Yield
#>         freq     seasonal_adjustment   type output_in instrument_currency
#>       <char>                  <char> <char>    <char>              <char>
#>    1:  daily Not seasonally adjusted  Yield   Percent            Sterling
#>    2:  daily Not seasonally adjusted  Yield   Percent            Sterling
#>    3:  daily Not seasonally adjusted  Yield   Percent            Sterling
#>    4:  daily Not seasonally adjusted  Yield   Percent            Sterling
#>    5:  daily Not seasonally adjusted  Yield   Percent            Sterling
#>   ---                                                                    
#> 2874:  daily Not seasonally adjusted  Yield   Percent            Sterling
#> 2875:  daily Not seasonally adjusted  Yield   Percent            Sterling
#> 2876:  daily Not seasonally adjusted  Yield   Percent            Sterling
#> 2877:  daily Not seasonally adjusted  Yield   Percent            Sterling
#> 2878:  daily Not seasonally adjusted  Yield   Percent            Sterling
#>                      instruments
#>                           <char>
#>    1: Nominal par yield, 10 year
#>    2: Nominal par yield, 10 year
#>    3: Nominal par yield, 10 year
#>    4: Nominal par yield, 10 year
#>    5: Nominal par yield, 10 year
#>   ---                           
#> 2874: Nominal par yield, 10 year
#> 2875: Nominal par yield, 10 year
#> 2876: Nominal par yield, 10 year
#> 2877: Nominal par yield, 10 year
#> 2878: Nominal par yield, 10 year

# multiple series
boe_data(c("IUMABEDR", "IUALBEDR"), "2015-01-01")
#>            date      key value                           description    freq
#>          <Date>   <char> <num>                                <char>  <char>
#>   1: 2015-01-31 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>   2: 2015-02-28 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>   3: 2015-03-31 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>   4: 2015-04-30 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>   5: 2015-05-31 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>  ---                                                                        
#> 143: 2021-12-31 IUALBEDR  0.25           End year official Bank Rate  annual
#> 144: 2022-12-31 IUALBEDR  3.50           End year official Bank Rate  annual
#> 145: 2023-12-31 IUALBEDR  5.25           End year official Bank Rate  annual
#> 146: 2024-12-31 IUALBEDR  4.75           End year official Bank Rate  annual
#> 147: 2025-12-31 IUALBEDR  3.75           End year official Bank Rate  annual
#>          seasonal_adjustment          type output_in instrument_currency
#>                       <char>        <char>    <char>              <char>
#>   1: Not seasonally adjusted Interest rate   Percent            Sterling
#>   2: Not seasonally adjusted Interest rate   Percent            Sterling
#>   3: Not seasonally adjusted Interest rate   Percent            Sterling
#>   4: Not seasonally adjusted Interest rate   Percent            Sterling
#>   5: Not seasonally adjusted Interest rate   Percent            Sterling
#>  ---                                                                    
#> 143:                    <NA> Interest rate   Percent            Sterling
#> 144:                    <NA> Interest rate   Percent            Sterling
#> 145:                    <NA> Interest rate   Percent            Sterling
#> 146:                    <NA> Interest rate   Percent            Sterling
#> 147:                    <NA> Interest rate   Percent            Sterling
#>             instruments
#>                  <char>
#>   1: Official Bank Rate
#>   2: Official Bank Rate
#>   3: Official Bank Rate
#>   4: Official Bank Rate
#>   5: Official Bank Rate
#>  ---                   
#> 143: Official Bank Rate
#> 144: Official Bank Rate
#> 145: Official Bank Rate
#> 146: Official Bank Rate
#> 147: Official Bank Rate
# }
```
