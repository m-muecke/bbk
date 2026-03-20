# Fetch Österreichische Nationalbank (OeNB) data frequency

Fetch Österreichische Nationalbank (OeNB) data frequency

## Usage

``` r
onb_frequency(hier_id, key, ..., lang = "en")
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
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`nob_metadata()`](https://m-muecke.github.io/bbk/reference/nob_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md),
[`snb_dimensions()`](https://m-muecke.github.io/bbk/reference/snb_dimensions.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
onb_frequency(hier_id = 74, key = "VDBOSBHAGBSTIN")
#>      freq           available            pos  dval1  dval2  dval3  dval4
#>    <char>              <char>         <char> <char> <char> <char> <char>
#> 1:      M Jan.  80 - Jan.  26 VDBOSBHAGBSTIN      N     AT     Z5     25
#> 2:      A         1959 - 2026 VDBOSBHAGBSTIN      N     AT     Z5     01
#> 3:      M Jan.  80 - Jan.  26 VDBOSBHAGBSTIN      N     AT     Z5     01
#> 4:      A         2013 - 2023 VDBOSBHAGBSTIN      N     AT     Z5     02
onb_frequency(hier_id = 11, key = "VDBFKBSC217000")
#>      freq           available            pos  dval1   dval2  dval3  dval4
#>    <char>              <char>         <char> <char>  <char> <char> <char>
#> 1:      A         1998 - 2025 VDBFKBSC217000     AT 00100KI     AT    Z0Z
#> 2:      M Jan.  98 - Feb.  26 VDBFKBSC217000     AT 00100KI     AT    Z0Z
# }
```
