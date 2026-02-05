# Fetch Österreichische Nationalbank (OeNB) dimension

Fetch Österreichische Nationalbank (OeNB) dimension

## Usage

``` r
onb_dimension(hier_id, key, lang = "en")
```

## Arguments

- hier_id:

  (`integer(1)`)  
  Hierarchy id to query.

- key:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  The series keys to query.

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
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md)

## Examples

``` r
# \donttest{
onb_dimension(hier_id = 11, key = "VDBFKBSC217000")
#>       nr         name hidden
#>    <int>       <char> <char>
#> 1:     1    PRODUZENT  false
#> 2:     2 BANKENSEKTOR  false
#> 3:     3       REGION  false
#> 4:     4     WAEHRUNG   true
# }
```
