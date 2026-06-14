# Fetch Banco Central do Brasil (BCB) inflation expectations

Retrieve the rolling 12- or 24-month inflation expectations from the
Banco Central do Brasil Focus survey (Relatório Focus) via the Olinda
API.

## Usage

``` r
bcb_inflation(
  horizon = "12m",
  indicator = NULL,
  start_date = NULL,
  end_date = NULL
)
```

## Source

<https://dadosabertos.bcb.gov.br/>

## Arguments

- horizon:

  (`character(1)`)  
  The forecast horizon, either `"12m"` (next 12 months) or `"24m"` (next
  24 months). Default `"12m"`.

- indicator:

  (`NULL` \| `character(1)`)  
  The economic indicator to filter on (e.g. `"IPCA"`, `"Selic"`,
  `"Câmbio"`). If `NULL`, all indicators are returned. Default `NULL`.

- start_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  Start of the survey date range (e.g., `"2024-01-01"`). If `NULL`, no
  lower bound is applied. Default `NULL`.

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End of the survey date range, in the same format as start_date. If
  `NULL`, no upper bound is applied. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns `date`, `indicator`, `smoothed`, `mean`, `median`, `sd`,
`min`, `max`, `respondents`, and `base`. The `smoothed` column indicates
whether the forecast is the smoothed (suavizada) series.

## See also

Other data:
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_fx_rates()`](https://m-muecke.github.io/bbk/reference/bcb_fx_rates.md),
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
# next-12-months IPCA inflation expectations
bcb_inflation("12m", "IPCA", start_date = "2024-01-01", end_date = "2024-01-31")
#>           date indicator smoothed   mean median     sd    min    max
#>         <Date>    <char>   <lgcl>  <num>  <num>  <num>  <num>  <num>
#>  1: 2024-01-02      IPCA    FALSE 3.8175 3.8035 0.3490 2.9480 5.1452
#>  2: 2024-01-02      IPCA     TRUE 3.8551 3.8729 0.3347 3.0006 5.2294
#>  3: 2024-01-02      IPCA    FALSE 3.8446 3.8034 0.2980 3.2050 4.4570
#>  4: 2024-01-02      IPCA     TRUE 3.8607 3.8693 0.2622 3.1657 4.2920
#>  5: 2024-01-03      IPCA    FALSE 3.8213 3.8135 0.3481 2.9480 5.1452
#>  6: 2024-01-03      IPCA     TRUE 3.8583 3.8747 0.3348 3.0030 5.2332
#>  7: 2024-01-03      IPCA    FALSE 3.8211 3.8034 0.3228 3.2050 4.4570
#>  8: 2024-01-03      IPCA     TRUE 3.8259 3.8284 0.2930 3.1630 4.2930
#>  9: 2024-01-04      IPCA    FALSE 3.8147 3.8034 0.3505 2.9480 5.1452
#> 10: 2024-01-04      IPCA     TRUE 3.8533 3.8764 0.3383 3.0054 5.2371
#> 11: 2024-01-04      IPCA    FALSE 3.8116 3.7982 0.3140 3.2260 4.4570
#> 12: 2024-01-04      IPCA     TRUE 3.8109 3.8245 0.2841 3.1602 4.2940
#> 13: 2024-01-05      IPCA    FALSE 3.8228 3.8247 0.3528 2.9684 5.1767
#> 14: 2024-01-05      IPCA     TRUE 3.8580 3.8805 0.3401 2.9770 5.2628
#> 15: 2024-01-05      IPCA    FALSE 3.8376 3.8501 0.3889 2.9684 5.1767
#> 16: 2024-01-05      IPCA     TRUE 3.8301 3.8303 0.3715 2.9770 5.2628
#> 17: 2024-01-08      IPCA    FALSE 3.8126 3.8197 0.3442 2.9684 5.1767
#> 18: 2024-01-08      IPCA     TRUE 3.8465 3.8791 0.3333 2.9780 5.2731
#> 19: 2024-01-08      IPCA    FALSE 3.8182 3.8146 0.3766 2.9684 5.1767
#> 20: 2024-01-08      IPCA     TRUE 3.8113 3.8317 0.3646 2.9780 5.2731
#> 21: 2024-01-09      IPCA    FALSE 3.8166 3.8197 0.3442 2.9684 5.1767
#> 22: 2024-01-09      IPCA     TRUE 3.8489 3.8870 0.3336 2.9783 5.2766
#> 23: 2024-01-09      IPCA    FALSE 3.8365 3.8728 0.3823 2.9684 5.1767
#> 24: 2024-01-09      IPCA     TRUE 3.8284 3.8867 0.3816 2.9783 5.2766
#> 25: 2024-01-10      IPCA    FALSE 3.8164 3.8141 0.3425 2.9684 5.1767
#> 26: 2024-01-10      IPCA     TRUE 3.8515 3.8911 0.3325 2.9787 5.2800
#> 27: 2024-01-10      IPCA    FALSE 3.8421 3.8895 0.3755 2.9684 5.1767
#> 28: 2024-01-10      IPCA     TRUE 3.8379 3.9000 0.3716 2.9787 5.2800
#> 29: 2024-01-11      IPCA    FALSE 3.8501 3.8829 0.3288 2.9787 5.2800
#> 30: 2024-01-11      IPCA     TRUE 3.8528 3.8848 0.2962 2.9805 4.6458
#> 31: 2024-01-11      IPCA    FALSE 3.8340 3.8445 0.3553 2.9787 5.2800
#> 32: 2024-01-11      IPCA     TRUE 3.8011 3.8397 0.3004 2.9805 4.2233
#> 33: 2024-01-12      IPCA    FALSE 3.8582 3.8505 0.3388 3.0094 5.0700
#> 34: 2024-01-12      IPCA     TRUE 3.8646 3.8690 0.3173 3.0109 4.9714
#> 35: 2024-01-12      IPCA    FALSE 3.8764 3.8500 0.3713 3.0094 5.0700
#> 36: 2024-01-12      IPCA     TRUE 3.8567 3.8474 0.3545 3.0109 4.9714
#> 37: 2024-01-15      IPCA    FALSE 3.8511 3.8500 0.3413 3.0094 5.0700
#> 38: 2024-01-15      IPCA     TRUE 3.8624 3.8634 0.3200 3.0131 4.9602
#> 39: 2024-01-15      IPCA    FALSE 3.8784 3.8500 0.3820 3.0094 5.0700
#> 40: 2024-01-15      IPCA     TRUE 3.8484 3.8397 0.3778 3.0131 4.9602
#> 41: 2024-01-16      IPCA    FALSE 3.8543 3.8510 0.3426 3.0094 5.0700
#> 42: 2024-01-16      IPCA     TRUE 3.8658 3.8754 0.3215 3.0138 4.9565
#> 43: 2024-01-16      IPCA    FALSE 3.8875 3.8500 0.3811 3.0094 5.0700
#> 44: 2024-01-16      IPCA     TRUE 3.8591 3.8416 0.3762 3.0138 4.9565
#> 45: 2024-01-17      IPCA    FALSE 3.8594 3.8675 0.3388 3.0094 5.0700
#> 46: 2024-01-17      IPCA     TRUE 3.8674 3.8828 0.3203 3.0146 4.9528
#> 47: 2024-01-17      IPCA    FALSE 3.8925 3.8510 0.3751 3.0094 5.0700
#> 48: 2024-01-17      IPCA     TRUE 3.8703 3.8526 0.3703 3.0146 4.9528
#> 49: 2024-01-18      IPCA    FALSE 3.8597 3.8800 0.3345 3.0094 5.0700
#> 50: 2024-01-18      IPCA     TRUE 3.8670 3.8780 0.3154 3.0153 4.9490
#> 51: 2024-01-18      IPCA    FALSE 3.8861 3.8549 0.3746 3.0094 5.0700
#> 52: 2024-01-18      IPCA     TRUE 3.8500 3.8451 0.3576 3.0153 4.9490
#> 53: 2024-01-19      IPCA    FALSE 3.8520 3.8600 0.3294 3.0299 5.0700
#> 54: 2024-01-19      IPCA     TRUE 3.8410 3.8600 0.3070 3.0233 4.9453
#> 55: 2024-01-19      IPCA    FALSE 3.8487 3.8694 0.3109 3.0299 4.9789
#> 56: 2024-01-19      IPCA     TRUE 3.8185 3.8492 0.3111 3.0233 4.9453
#> 57: 2024-01-22      IPCA    FALSE 3.8648 3.8756 0.3227 3.0299 5.0700
#> 58: 2024-01-22      IPCA     TRUE 3.8386 3.8600 0.3077 3.0211 4.9341
#> 59: 2024-01-22      IPCA    FALSE 3.8619 3.8778 0.3090 3.0299 4.9789
#> 60: 2024-01-22      IPCA     TRUE 3.8236 3.8512 0.3085 3.0211 4.9341
#> 61: 2024-01-23      IPCA    FALSE 3.8705 3.8778 0.3254 3.0299 5.0700
#> 62: 2024-01-23      IPCA     TRUE 3.8442 3.8598 0.3116 3.0204 4.9304
#> 63: 2024-01-23      IPCA    FALSE 3.8668 3.8800 0.3144 3.0299 4.9789
#> 64: 2024-01-23      IPCA     TRUE 3.8271 3.8482 0.3145 3.0204 4.9304
#> 65: 2024-01-24      IPCA    FALSE 3.8695 3.8800 0.3244 3.0299 5.0700
#> 66: 2024-01-24      IPCA     TRUE 3.8399 3.8558 0.3110 3.0196 4.9266
#> 67: 2024-01-24      IPCA    FALSE 3.8726 3.8829 0.3114 3.0299 4.9789
#> 68: 2024-01-24      IPCA     TRUE 3.8340 3.8551 0.3112 3.0196 4.9266
#> 69: 2024-01-25      IPCA    FALSE 3.8724 3.8829 0.3229 3.0299 5.0700
#> 70: 2024-01-25      IPCA     TRUE 3.8414 3.8561 0.3076 3.0189 4.9229
#> 71: 2024-01-25      IPCA    FALSE 3.8723 3.8864 0.3203 3.0299 4.9789
#> 72: 2024-01-25      IPCA     TRUE 3.8322 3.8600 0.3186 3.0189 4.9229
#> 73: 2024-01-26      IPCA    FALSE 3.7964 3.8083 0.3265 2.9679 4.9475
#> 74: 2024-01-26      IPCA     TRUE 3.7989 3.8195 0.3047 3.0089 4.9057
#> 75: 2024-01-26      IPCA    FALSE 3.7817 3.8028 0.3299 2.9679 4.9475
#> 76: 2024-01-26      IPCA     TRUE 3.7882 3.8159 0.2972 3.0089 4.9057
#> 77: 2024-01-29      IPCA    FALSE 3.8008 3.8188 0.3284 2.9679 4.9475
#> 78: 2024-01-29      IPCA     TRUE 3.7970 3.8128 0.3068 3.0166 4.8979
#> 79: 2024-01-29      IPCA    FALSE 3.7718 3.7852 0.3286 2.9679 4.9475
#> 80: 2024-01-29      IPCA     TRUE 3.7776 3.7947 0.2942 3.0166 4.8979
#> 81: 2024-01-30      IPCA    FALSE 3.8000 3.8128 0.3221 2.9679 4.9475
#> 82: 2024-01-30      IPCA     TRUE 3.7981 3.8154 0.3009 3.0192 4.8953
#> 83: 2024-01-30      IPCA    FALSE 3.7803 3.8028 0.3313 2.9679 4.9475
#> 84: 2024-01-30      IPCA     TRUE 3.7870 3.8261 0.3012 3.0192 4.8953
#> 85: 2024-01-31      IPCA    FALSE 3.8001 3.8137 0.3219 2.9679 4.9475
#> 86: 2024-01-31      IPCA     TRUE 3.7983 3.8128 0.3009 3.0217 4.8927
#> 87: 2024-01-31      IPCA    FALSE 3.7746 3.8028 0.3273 2.9679 4.9475
#> 88: 2024-01-31      IPCA     TRUE 3.7820 3.7904 0.2962 3.0217 4.8927
#>           date indicator smoothed   mean median     sd    min    max
#>         <Date>    <char>   <lgcl>  <num>  <num>  <num>  <num>  <num>
#>     respondents  base
#>           <int> <int>
#>  1:         140     0
#>  2:         140     0
#>  3:          37     1
#>  4:          37     1
#>  5:         141     0
#>  6:         141     0
#>  7:          31     1
#>  8:          31     1
#>  9:         139     0
#> 10:         139     0
#> 11:          34     1
#> 12:          34     1
#> 13:         141     0
#> 14:         141     0
#> 15:          44     1
#> 16:          44     1
#> 17:         140     0
#> 18:         140     0
#> 19:          51     1
#> 20:          51     1
#> 21:         140     0
#> 22:         140     0
#> 23:          52     1
#> 24:          52     1
#> 25:         140     0
#> 26:         140     0
#> 27:          51     1
#> 28:          51     1
#> 29:         142     0
#> 30:         111     0
#> 31:          57     1
#> 32:          42     1
#> 33:         144     0
#> 34:         114     0
#> 35:          66     1
#> 36:          52     1
#> 37:         139     0
#> 38:         112     0
#> 39:          61     1
#> 40:          48     1
#> 41:         139     0
#> 42:         112     0
#> 43:          60     1
#> 44:          47     1
#> 45:         142     0
#> 46:         114     0
#> 47:          65     1
#> 48:          50     1
#> 49:         141     0
#> 50:         113     0
#> 51:          63     1
#> 52:          52     1
#> 53:         145     0
#> 54:         117     0
#> 55:          98     1
#> 56:          81     1
#> 57:         143     0
#> 58:         115     0
#> 59:         104     1
#> 60:          87     1
#> 61:         144     0
#> 62:         116     0
#> 63:         103     1
#> 64:          86     1
#> 65:         145     0
#> 66:         117     0
#> 67:         104     1
#> 68:          87     1
#> 69:         146     0
#> 70:         118     0
#> 71:         101     1
#> 72:          85     1
#> 73:         148     0
#> 74:         119     0
#> 75:         103     1
#> 76:          84     1
#> 77:         148     0
#> 78:         119     0
#> 79:         106     1
#> 80:          87     1
#> 81:         149     0
#> 82:         120     0
#> 83:         107     1
#> 84:          87     1
#> 85:         149     0
#> 86:         120     0
#> 87:         105     1
#> 88:          85     1
#>     respondents  base
#>           <int> <int>
# }
```
