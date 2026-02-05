# Fetch Österreichische Nationalbank (OeNB) metadata

Fetch Österreichische Nationalbank (OeNB) metadata

## Usage

``` r
onb_metadata(hier_id, key, ..., lang = "en")
```

## Arguments

- hier_id:

  (`integer(1)`)  
  Hierarchy id to query.

- key:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  The series keys to query.

- ...:

  (`any`)  
  Additional parameters to pass to the API.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## See also

Other metadata:
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md)

## Examples

``` r
# \donttest{
onb_metadata(hier_id = 11, key = "VDBFKBSC217000")
#>                                   title region   unit
#>                                  <char> <char> <char>
#> 1: Loans to euro area residents - total   <NA>   Euro
#>                                                                                                        comment
#>                                                                                                         <char>
#> 1: Collected within the framework of the balance sheet report to the ECB  loans to euro area residents  total.
#>                         classification breaks frequency         last_update
#>                                 <char> <char>    <char>              <char>
#> 1: European Sytem of National Accounts   <NA>     month 2026-01-14 08:02:37
#>    source    lag
#>    <char> <char>
#> 1:   OeNB   <NA>
# }
```
