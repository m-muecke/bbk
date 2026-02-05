# Fetch Swiss National Bank (SNB) data

Retrieve time series data from the SNB data portal.

## Usage

``` r
snb_data(key, start_date = NULL, end_date = NULL, lang = "en")
```

## Source

<https://data.snb.ch/en>

## Arguments

- key:

  (`character(1)`)  
  The series key to query.

- start_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  Start date of the data.

- end_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  End date of the data.

- lang:

  (`character(1)`)  
  Language to query, either `"en"` or `"de"`. Default `"en"`.

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
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md)

## Examples

``` r
# \donttest{
snb_data("rendopar")
#>              date                  key   value   freq duration  scale overview
#>            <Date>               <char>   <num> <char>   <char> <char>   <char>
#>     1: 1988-01-04 EPB@SNB.rendopar{b0} 4.38600  daily      P1D   <NA>       B0
#>     2: 1988-01-11 EPB@SNB.rendopar{b0} 4.41300  daily      P1D   <NA>       B0
#>     3: 1988-01-18 EPB@SNB.rendopar{b0} 4.53000  daily      P1D   <NA>       B0
#>     4: 1988-01-25 EPB@SNB.rendopar{b0} 4.39100  daily      P1D   <NA>       B0
#>     5: 1988-01-29 EPB@SNB.rendopar{b0} 4.46200  daily      P1D   <NA>       B0
#>    ---                                                                        
#> 45200: 2025-07-25 EPB@SNB.rendopar{t2} 7.82040  daily      P1D   <NA>       T2
#> 45201: 2025-07-28 EPB@SNB.rendopar{t2} 6.86801  daily      P1D   <NA>       T2
#> 45202: 2025-07-29 EPB@SNB.rendopar{t2} 7.73035  daily      P1D   <NA>       T2
#> 45203: 2025-07-30 EPB@SNB.rendopar{t2} 7.76348  daily      P1D   <NA>       T2
#> 45204: 2025-07-31 EPB@SNB.rendopar{t2} 8.23272  daily      P1D   <NA>       T2

# or filter for date range
snb_data("rendopar", "2020-01-01", "2020-12-31")
#>             date                  key       value   freq duration  scale
#>           <Date>               <char>       <num> <char>   <char> <char>
#>    1: 2020-01-03 EPB@SNB.rendopar{b0} -0.05609740  daily      P1D   <NA>
#>    2: 2020-01-06 EPB@SNB.rendopar{b0} -0.07934420  daily      P1D   <NA>
#>    3: 2020-01-07 EPB@SNB.rendopar{b0} -0.08029920  daily      P1D   <NA>
#>    4: 2020-01-08 EPB@SNB.rendopar{b0} -0.06849460  daily      P1D   <NA>
#>    5: 2020-01-09 EPB@SNB.rendopar{b0} -0.00365518  daily      P1D   <NA>
#>   ---                                                                   
#> 1508: 2020-12-22 EPB@SNB.rendopar{t2}  0.82619600  daily      P1D   <NA>
#> 1509: 2020-12-23 EPB@SNB.rendopar{t2}  0.70066400  daily      P1D   <NA>
#> 1510: 2020-12-28 EPB@SNB.rendopar{t2}  0.82467200  daily      P1D   <NA>
#> 1511: 2020-12-29 EPB@SNB.rendopar{t2}  0.84958800  daily      P1D   <NA>
#> 1512: 2020-12-30 EPB@SNB.rendopar{t2}  0.88701000  daily      P1D   <NA>
#>       overview
#>         <char>
#>    1:       B0
#>    2:       B0
#>    3:       B0
#>    4:       B0
#>    5:       B0
#>   ---         
#> 1508:       T2
#> 1509:       T2
#> 1510:       T2
#> 1511:       T2
#> 1512:       T2
# }
```
