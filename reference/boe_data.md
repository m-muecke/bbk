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
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md)

## Examples

``` r
# \donttest{
boe_data(c("IUMABEDR", "IUALBEDR"), "2015-01-01")
#>            date      key value                           description    freq
#>          <Date>   <char> <num>                                <char>  <char>
#>   1: 2015-01-31 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>   2: 2015-02-28 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>   3: 2015-03-31 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>   4: 2015-04-30 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>   5: 2015-05-31 IUMABEDR  0.50 Monthly average of official Bank Rate monthly
#>  ---                                                                        
#> 140: 2021-12-31 IUALBEDR  0.25           End year official Bank Rate  annual
#> 141: 2022-12-31 IUALBEDR  3.50           End year official Bank Rate  annual
#> 142: 2023-12-31 IUALBEDR  5.25           End year official Bank Rate  annual
#> 143: 2024-12-31 IUALBEDR  4.75           End year official Bank Rate  annual
#> 144: 2025-12-31 IUALBEDR  3.75           End year official Bank Rate  annual
#>          seasonal_adjustment          type output_in instrument_currency
#>                       <char>        <char>    <char>              <char>
#>   1: Not seasonally adjusted Interest rate   Percent            Sterling
#>   2: Not seasonally adjusted Interest rate   Percent            Sterling
#>   3: Not seasonally adjusted Interest rate   Percent            Sterling
#>   4: Not seasonally adjusted Interest rate   Percent            Sterling
#>   5: Not seasonally adjusted Interest rate   Percent            Sterling
#>  ---                                                                    
#> 140:                    <NA> Interest rate   Percent            Sterling
#> 141:                    <NA> Interest rate   Percent            Sterling
#> 142:                    <NA> Interest rate   Percent            Sterling
#> 143:                    <NA> Interest rate   Percent            Sterling
#> 144:                    <NA> Interest rate   Percent            Sterling
#>             instruments
#>                  <char>
#>   1: Official Bank Rate
#>   2: Official Bank Rate
#>   3: Official Bank Rate
#>   4: Official Bank Rate
#>   5: Official Bank Rate
#>  ---                   
#> 140: Official Bank Rate
#> 141: Official Bank Rate
#> 142: Official Bank Rate
#> 143: Official Bank Rate
#> 144: Official Bank Rate
# }
```
