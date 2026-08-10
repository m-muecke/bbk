# Fetch Bank of Israel (BoI) data

Retrieve time series data from the Bank of Israel SDMX Web Service.

## Usage

``` r
boi_data(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL
)
```

## Source

<https://www.boi.org.il/en/>

## Arguments

- flow:

  (`character(1)`)  
  The dataflow to query. See
  [`boi_metadata()`](https://m-muecke.github.io/bbk/reference/boi_metadata.md)
  for available dataflows.

- key:

  (`NULL` \| `character(1)`)  
  The series key to query using dot-separated dimension values (e.g.,
  `"RER_GBP_ILS"`). Use `+` for multiple values in one dimension. If
  `NULL`, all data for the flow is returned. Default `NULL`.

- start_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  Start date of the data (e.g., `"2024-01-01"` or `2024`). If `NULL`, no
  start date restriction is applied. Default `NULL`.

- end_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  End date of the data, in the same format as start_period. If `NULL`,
  no end date restriction is applied. Default `NULL`.

- first_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the start of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

- last_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the end of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

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
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
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
# fetch GBP/ILS exchange rate
boi_data("EXR", "RER_GBP_ILS", last_n = 5L)
#>          date                            key  value   freq series_code
#>        <Date>                         <char>  <num> <char>      <char>
#> 1: 2026-08-04 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.0757  daily RER_GBP_ILS
#> 2: 2026-08-05 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.0450  daily RER_GBP_ILS
#> 3: 2026-08-06 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.0576  daily RER_GBP_ILS
#> 4: 2026-08-07 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.0416  daily RER_GBP_ILS
#> 5: 2026-08-10 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.0481  daily RER_GBP_ILS
#>    base_currency counter_currency unit_measure data_type
#>           <char>           <char>       <char>    <char>
#> 1:           GBP              ILS          ILS      OF00
#> 2:           GBP              ILS          ILS      OF00
#> 3:           GBP              ILS          ILS      OF00
#> 4:           GBP              ILS          ILS      OF00
#> 5:           GBP              ILS          ILS      OF00

# fetch a range
boi_data("EXR", "RER_GBP_ILS", start_period = "2024-01-01", end_period = "2024-01-31")
#>           date                            key  value   freq series_code
#>         <Date>                         <char>  <num> <char>      <char>
#>  1: 2024-01-02 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.5849  daily RER_GBP_ILS
#>  2: 2024-01-03 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.6048  daily RER_GBP_ILS
#>  3: 2024-01-04 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.6353  daily RER_GBP_ILS
#>  4: 2024-01-05 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.6362  daily RER_GBP_ILS
#>  5: 2024-01-08 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7238  daily RER_GBP_ILS
#>  6: 2024-01-09 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7267  daily RER_GBP_ILS
#>  7: 2024-01-10 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7804  daily RER_GBP_ILS
#>  8: 2024-01-11 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7680  daily RER_GBP_ILS
#>  9: 2024-01-12 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7546  daily RER_GBP_ILS
#> 10: 2024-01-15 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7782  daily RER_GBP_ILS
#> 11: 2024-01-16 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7645  daily RER_GBP_ILS
#> 12: 2024-01-17 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.8009  daily RER_GBP_ILS
#> 13: 2024-01-18 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7788  daily RER_GBP_ILS
#> 14: 2024-01-19 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7541  daily RER_GBP_ILS
#> 15: 2024-01-22 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7923  daily RER_GBP_ILS
#> 16: 2024-01-23 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7898  daily RER_GBP_ILS
#> 17: 2024-01-24 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7388  daily RER_GBP_ILS
#> 18: 2024-01-25 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7142  daily RER_GBP_ILS
#> 19: 2024-01-26 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.7153  daily RER_GBP_ILS
#> 20: 2024-01-29 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.6831  daily RER_GBP_ILS
#> 21: 2024-01-30 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.6301  daily RER_GBP_ILS
#> 22: 2024-01-31 RER_GBP_ILS.D.GBP.ILS.ILS.OF00 4.6094  daily RER_GBP_ILS
#>           date                            key  value   freq series_code
#>         <Date>                         <char>  <num> <char>      <char>
#>     base_currency counter_currency unit_measure data_type
#>            <char>           <char>       <char>    <char>
#>  1:           GBP              ILS          ILS      OF00
#>  2:           GBP              ILS          ILS      OF00
#>  3:           GBP              ILS          ILS      OF00
#>  4:           GBP              ILS          ILS      OF00
#>  5:           GBP              ILS          ILS      OF00
#>  6:           GBP              ILS          ILS      OF00
#>  7:           GBP              ILS          ILS      OF00
#>  8:           GBP              ILS          ILS      OF00
#>  9:           GBP              ILS          ILS      OF00
#> 10:           GBP              ILS          ILS      OF00
#> 11:           GBP              ILS          ILS      OF00
#> 12:           GBP              ILS          ILS      OF00
#> 13:           GBP              ILS          ILS      OF00
#> 14:           GBP              ILS          ILS      OF00
#> 15:           GBP              ILS          ILS      OF00
#> 16:           GBP              ILS          ILS      OF00
#> 17:           GBP              ILS          ILS      OF00
#> 18:           GBP              ILS          ILS      OF00
#> 19:           GBP              ILS          ILS      OF00
#> 20:           GBP              ILS          ILS      OF00
#> 21:           GBP              ILS          ILS      OF00
#> 22:           GBP              ILS          ILS      OF00
#>     base_currency counter_currency unit_measure data_type
#>            <char>           <char>       <char>    <char>
# }
```
