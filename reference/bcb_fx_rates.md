# Fetch Banco Central do Brasil (BCB) exchange rates

Retrieve PTAX foreign exchange reference rates from the Banco Central do
Brasil Olinda API. The rates are the closing (Fechamento) bid and ask
quotations expressed in Brazilian real (BRL) per unit of the foreign
currency.

## Usage

``` r
bcb_fx_rates(currency, start_date, end_date = NULL)
```

## Source

<https://dadosabertos.bcb.gov.br/>

## Arguments

- currency:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  One or more ISO 4217 currency codes (e.g. `"USD"`, `c("USD", "EUR")`).
  See
  [`bcb_currencies()`](https://m-muecke.github.io/bbk/reference/bcb_currencies.md)
  for the available currencies.

- start_date:

  (`Date(1)` \| `character(1)`)  
  Start date of the data (e.g., `"2024-01-01"`).

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End date of the data, in the same format as start_date. If `NULL`, the
  `start_date` is used. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns `date`, `currency`, `bid`, and `ask`.

## Details

Rates are published only on business days, so weekends and holidays
return no rows.

## See also

Other data:
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
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
# fetch USD/BRL closing rates
bcb_fx_rates("USD", start_date = "2024-01-01", end_date = "2024-01-31")
#>           date currency    bid    ask
#>         <Date>   <char>  <num>  <num>
#>  1: 2024-01-02      USD 4.8910 4.8916
#>  2: 2024-01-03      USD 4.9206 4.9212
#>  3: 2024-01-04      USD 4.9182 4.9188
#>  4: 2024-01-05      USD 4.8893 4.8899
#>  5: 2024-01-08      USD 4.8844 4.8850
#>  6: 2024-01-09      USD 4.8931 4.8937
#>  7: 2024-01-10      USD 4.8895 4.8901
#>  8: 2024-01-11      USD 4.8788 4.8794
#>  9: 2024-01-12      USD 4.8537 4.8543
#> 10: 2024-01-15      USD 4.8759 4.8765
#> 11: 2024-01-16      USD 4.9032 4.9038
#> 12: 2024-01-17      USD 4.9340 4.9346
#> 13: 2024-01-18      USD 4.9397 4.9403
#> 14: 2024-01-19      USD 4.9217 4.9223
#> 15: 2024-01-22      USD 4.9484 4.9490
#> 16: 2024-01-23      USD 4.9709 4.9715
#> 17: 2024-01-24      USD 4.9186 4.9192
#> 18: 2024-01-25      USD 4.9226 4.9232
#> 19: 2024-01-26      USD 4.9119 4.9125
#> 20: 2024-01-29      USD 4.9219 4.9225
#> 21: 2024-01-30      USD 4.9632 4.9638
#> 22: 2024-01-31      USD 4.9529 4.9535
#>           date currency    bid    ask
#>         <Date>   <char>  <num>  <num>

# fetch multiple currencies
bcb_fx_rates(c("USD", "EUR"), start_date = "2024-01-01", end_date = "2024-01-31")
#>           date currency    bid    ask
#>         <Date>   <char>  <num>  <num>
#>  1: 2024-01-02      USD 4.8910 4.8916
#>  2: 2024-01-03      USD 4.9206 4.9212
#>  3: 2024-01-04      USD 4.9182 4.9188
#>  4: 2024-01-05      USD 4.8893 4.8899
#>  5: 2024-01-08      USD 4.8844 4.8850
#>  6: 2024-01-09      USD 4.8931 4.8937
#>  7: 2024-01-10      USD 4.8895 4.8901
#>  8: 2024-01-11      USD 4.8788 4.8794
#>  9: 2024-01-12      USD 4.8537 4.8543
#> 10: 2024-01-15      USD 4.8759 4.8765
#> 11: 2024-01-16      USD 4.9032 4.9038
#> 12: 2024-01-17      USD 4.9340 4.9346
#> 13: 2024-01-18      USD 4.9397 4.9403
#> 14: 2024-01-19      USD 4.9217 4.9223
#> 15: 2024-01-22      USD 4.9484 4.9490
#> 16: 2024-01-23      USD 4.9709 4.9715
#> 17: 2024-01-24      USD 4.9186 4.9192
#> 18: 2024-01-25      USD 4.9226 4.9232
#> 19: 2024-01-26      USD 4.9119 4.9125
#> 20: 2024-01-29      USD 4.9219 4.9225
#> 21: 2024-01-30      USD 4.9632 4.9638
#> 22: 2024-01-31      USD 4.9529 4.9535
#> 23: 2024-01-02      EUR 5.3517 5.3543
#> 24: 2024-01-03      EUR 5.3649 5.3676
#> 25: 2024-01-04      EUR 5.3874 5.3900
#> 26: 2024-01-05      EUR 5.3665 5.3691
#> 27: 2024-01-08      EUR 5.3577 5.3603
#> 28: 2024-01-09      EUR 5.3423 5.3434
#> 29: 2024-01-10      EUR 5.3618 5.3635
#> 30: 2024-01-11      EUR 5.3398 5.3425
#> 31: 2024-01-12      EUR 5.3216 5.3242
#> 32: 2024-01-15      EUR 5.3381 5.3407
#> 33: 2024-01-16      EUR 5.3347 5.3373
#> 34: 2024-01-17      EUR 5.3519 5.3545
#> 35: 2024-01-18      EUR 5.3596 5.3622
#> 36: 2024-01-19      EUR 5.3558 5.3569
#> 37: 2024-01-22      EUR 5.3863 5.3875
#> 38: 2024-01-23      EUR 5.3835 5.3861
#> 39: 2024-01-24      EUR 5.3608 5.3634
#> 40: 2024-01-25      EUR 5.3317 5.3328
#> 41: 2024-01-26      EUR 5.3363 5.3374
#> 42: 2024-01-29      EUR 5.3137 5.3163
#> 43: 2024-01-30      EUR 5.3776 5.3803
#> 44: 2024-01-31      EUR 5.3793 5.3805
#>           date currency    bid    ask
#>         <Date>   <char>  <num>  <num>
# }
```
