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
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_fx_rates()`](https://m-muecke.github.io/bbk/reference/bcb_fx_rates.md),
[`bcb_inflation()`](https://m-muecke.github.io/bbk/reference/bcb_inflation.md),
[`bcb_selic()`](https://m-muecke.github.io/bbk/reference/bcb_selic.md),
[`bcb_top5()`](https://m-muecke.github.io/bbk/reference/bcb_top5.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_czeonia()`](https://m-muecke.github.io/bbk/reference/cnb_czeonia.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
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
bde_latest("D_1NBAF472")
#>                   date        key value   freq            title decimals symbol
#>                 <POSc>     <char> <num> <char>           <char>    <int> <char>
#> 1: 2026-05-01 08:15:00 D_1NBAF472 2.804      M One-year Euribor        3      %
#>     trend
#>    <char>
#> 1:      +
bde_latest(c("D_1NBAF472", "DTNPDE2010_P0000P_PS_APU"))
#>                   date                      key   value   freq
#>                 <POSc>                   <char>   <num> <char>
#> 1: 2026-05-01 08:15:00               D_1NBAF472   2.804      M
#> 2: 2026-01-01 09:15:00 DTNPDE2010_P0000P_PS_APU 101.600      Q
#>                                        title decimals symbol  trend
#>                                       <char>    <int> <char> <char>
#> 1:                          One-year Euribor        3      %      +
#> 2: EDP debt. General government. % of GDP mp        1      %      +
# }
```
