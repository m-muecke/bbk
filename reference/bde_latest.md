# Fetch latest Banco de España (BdE) data

Retrieve the most recently published value for one or more series from
the BdE statistics API.

## Usage

``` r
bde_latest(key, lang = "en")
```

## Source

<https://www.bde.es/webbe/en/estadisticas/recursos/api-estadisticas-bde.html>

## Arguments

- key:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  The series keys to query.

- lang:

  (`character(1)`)  
  Language to query, either `"en"` or `"es"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the latest observation per series.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
bde_latest("D_1NBAF472")
#>                   date        key value   freq            title decimals symbol
#>                 <POSc>     <char> <num> <char>           <char>    <int> <char>
#> 1: 2026-02-01 09:15:00 D_1NBAF472 2.221      M One-year Euribor        3      %
#>     trend
#>    <char>
#> 1:      -
bde_latest(c("D_1NBAF472", "DTNPDE2010_P0000P_PS_APU"))
#>                   date                      key   value   freq
#>                 <POSc>                   <char>   <num> <char>
#> 1: 2026-02-01 09:15:00               D_1NBAF472   2.221      M
#> 2: 2025-07-01 08:15:00 DTNPDE2010_P0000P_PS_APU 103.200      Q
#>                                        title decimals symbol  trend
#>                                       <char>    <int> <char> <char>
#> 1:                          One-year Euribor        3      %      -
#> 2: EDP debt. General government. % of GDP mp        1      %      -
# }
```
