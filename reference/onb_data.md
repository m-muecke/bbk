# Fetch Österreichische Nationalbank (OeNB) data

Retrieve time series data from the OeNB Web Service.

## Usage

``` r
onb_data(
  hier_id,
  key,
  ...,
  start_period = NULL,
  end_period = NULL,
  freq = NULL,
  lang = "en"
)
```

## Source

<https://www.oenb.at/en/Statistics/User-Defined-Tables/webservice.html>

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

- start_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  Start date of the data.

- end_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  End date of the data.

- freq:

  (`NULL` \| `character(1)`)  
  Frequency of the data.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## Details

A `key` can cover several series, such as one per partner country, which
share the same `key` and differ only in their `attr` columns. Group by
`key` and the `attr` columns to separate them.

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
[`boi_data()`](https://m-muecke.github.io/bbk/reference/boi_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_czeonia()`](https://m-muecke.github.io/bbk/reference/cnb_czeonia.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nbb_data()`](https://m-muecke.github.io/bbk/reference/nbb_data.md),
[`nbp_fx_rates()`](https://m-muecke.github.io/bbk/reference/nbp_fx_rates.md),
[`nbp_gold()`](https://m-muecke.github.io/bbk/reference/nbp_gold.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
onb_data(hier_id = 11, key = "VDBFKBSC217000")
#>            date            key value    freq
#>          <Date>         <char> <num>  <char>
#>   1: 1998-01-01 VDBFKBSC217000  2558  annual
#>   2: 1999-01-01 VDBFKBSC217000 15780  annual
#>   3: 2000-01-01 VDBFKBSC217000  9552  annual
#>   4: 2001-01-01 VDBFKBSC217000  5538  annual
#>   5: 2002-01-01 VDBFKBSC217000  7815  annual
#>  ---                                        
#> 369: 2026-05-01 VDBFKBSC217000  2180 monthly
#> 370: 2026-06-01 VDBFKBSC217000  2444 monthly
#> 371: 2026-07-01 VDBFKBSC217000  2853 monthly
#> 372: 2026-08-01 VDBFKBSC217000  2666 monthly
#> 373: 2026-09-01 VDBFKBSC217000  2156 monthly
#>                                     title  attr1   attr2  attr3  attr4
#>                                    <char> <char>  <char> <char> <char>
#>   1: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>   2: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>   3: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>   4: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>   5: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>  ---                                                                  
#> 369: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#> 370: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#> 371: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#> 372: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#> 373: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>      attr1_dim    attr2_dim attr3_dim attr4_dim unit_mult        unit_text
#>         <char>       <char>    <char>    <char>    <char>           <char>
#>   1: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>   2: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>   3: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>   4: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>   5: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>  ---                                                                      
#> 369: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#> 370: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#> 371: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#> 372: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#> 373: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro

# Loans to euro area residents, since 2000:
onb_data(hier_id = 11, key = "VDBFKBSC217000", start_period = "2000-01-01")
#>            date            key value    freq
#>          <Date>         <char> <num>  <char>
#>   1: 2000-01-01 VDBFKBSC217000  9552  annual
#>   2: 2001-01-01 VDBFKBSC217000  5538  annual
#>   3: 2002-01-01 VDBFKBSC217000  7815  annual
#>   4: 2003-01-01 VDBFKBSC217000  6933  annual
#>   5: 2004-01-01 VDBFKBSC217000 10963  annual
#>  ---                                        
#> 343: 2026-05-01 VDBFKBSC217000  2180 monthly
#> 344: 2026-06-01 VDBFKBSC217000  2444 monthly
#> 345: 2026-07-01 VDBFKBSC217000  2853 monthly
#> 346: 2026-08-01 VDBFKBSC217000  2666 monthly
#> 347: 2026-09-01 VDBFKBSC217000  2156 monthly
#>                                     title  attr1   attr2  attr3  attr4
#>                                    <char> <char>  <char> <char> <char>
#>   1: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>   2: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>   3: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>   4: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>   5: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>  ---                                                                  
#> 343: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#> 344: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#> 345: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#> 346: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#> 347: Loans to euro area residents - total     AT 00100KI     AT    Z0Z
#>      attr1_dim    attr2_dim attr3_dim attr4_dim unit_mult        unit_text
#>         <char>       <char>    <char>    <char>    <char>           <char>
#>   1: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>   2: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>   3: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>   4: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>   5: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#>  ---                                                                      
#> 343: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#> 344: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#> 345: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#> 346: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro
#> 347: PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         6 in millions Euro

# Austrian imports and exports of goods from/to Germany, 2002–2012, annual frequency:
onb_data(hier_id = 901, key = "VDBQZA1000", start_period = 2002, end_period = 2012, freq = "A")
#>             date        key  value   freq  title  attr1  attr2  attr3  attr4
#>           <Date>     <char>  <num> <char> <char> <char> <char> <char> <char>
#>    1: 2002-01-01 VDBQZA1000    596 annual  Goods     AT      D     TR    000
#>    2: 2003-01-01 VDBQZA1000    679 annual  Goods     AT      D     TR    000
#>    3: 2004-01-01 VDBQZA1000    722 annual  Goods     AT      D     TR    000
#>    4: 2005-01-01 VDBQZA1000    786 annual  Goods     AT      D     TR    000
#>    5: 2006-01-01 VDBQZA1000    782 annual  Goods     AT      D     TR    000
#>   ---                                                                       
#> 2603: 2008-01-01 VDBQZA1000  96077 annual  Goods     AT      D ZALCA8    000
#> 2604: 2009-01-01 VDBQZA1000  79696 annual  Goods     AT      D ZALCA8    000
#> 2605: 2010-01-01 VDBQZA1000  93865 annual  Goods     AT      D ZALCA8    000
#> 2606: 2011-01-01 VDBQZA1000 105492 annual  Goods     AT      D ZALCA8    000
#> 2607: 2012-01-01 VDBQZA1000 105634 annual  Goods     AT      D ZALCA8    000
#>        attr5  attr6  attr7 attr1_dim     attr2_dim     attr3_dim  attr4_dim
#>       <char> <char> <char>    <char>        <char>        <char>     <char>
#>    1:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#>    2:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#>    3:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#>    4:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#>    5:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#>   ---                                                                      
#> 2603:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#> 2604:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#> 2605:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#> 2606:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#> 2607:    000    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG
#>       attr5_dim    attr6_dim     attr7_dim unit_mult        unit_text
#>          <char>       <char>        <char>    <char>           <char>
#>    1: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>    2: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>    3: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>    4: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>    5: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>   ---                                                                
#> 2603: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#> 2604: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#> 2605: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#> 2606: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#> 2607: Z_BRANCHE Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro

# Number of Austrian banks' subsidiaries abroad and in the EU, from 2005, semiannual:
onb_data(
  hier_id = 321,
  key = c("VDBKISDANZTAU", "VDBKISDANZTEU"),
  start_period = 200501,
  freq = "H"
)
#>           date           key value        freq
#>         <Date>        <char> <num>      <char>
#>  1: 2005-01-01 VDBKISDANZTAU    90 semi-annual
#>  2: 2005-07-01 VDBKISDANZTAU    90 semi-annual
#>  3: 2006-01-01 VDBKISDANZTAU    96 semi-annual
#>  4: 2006-07-01 VDBKISDANZTAU    96 semi-annual
#>  5: 2007-01-01 VDBKISDANZTAU    96 semi-annual
#>  6: 2007-07-01 VDBKISDANZTAU   102 semi-annual
#>  7: 2008-01-01 VDBKISDANZTAU   107 semi-annual
#>  8: 2008-07-01 VDBKISDANZTAU   103 semi-annual
#>  9: 2009-01-01 VDBKISDANZTAU   105 semi-annual
#> 10: 2009-07-01 VDBKISDANZTAU   103 semi-annual
#> 11: 2010-01-01 VDBKISDANZTAU   103 semi-annual
#> 12: 2010-07-01 VDBKISDANZTAU   107 semi-annual
#> 13: 2011-01-01 VDBKISDANZTAU   105 semi-annual
#> 14: 2011-07-01 VDBKISDANZTAU   105 semi-annual
#> 15: 2012-01-01 VDBKISDANZTAU   103 semi-annual
#> 16: 2012-07-01 VDBKISDANZTAU   101 semi-annual
#> 17: 2013-01-01 VDBKISDANZTAU    96 semi-annual
#> 18: 2013-07-01 VDBKISDANZTAU    93 semi-annual
#> 19: 2014-01-01 VDBKISDANZTAU    89 semi-annual
#> 20: 2014-07-01 VDBKISDANZTAU    85 semi-annual
#> 21: 2015-01-01 VDBKISDANZTAU    83 semi-annual
#> 22: 2015-07-01 VDBKISDANZTAU    83 semi-annual
#> 23: 2016-01-01 VDBKISDANZTAU    80 semi-annual
#> 24: 2016-07-01 VDBKISDANZTAU    60 semi-annual
#> 25: 2017-01-01 VDBKISDANZTAU    60 semi-annual
#> 26: 2017-07-01 VDBKISDANZTAU    58 semi-annual
#> 27: 2018-01-01 VDBKISDANZTAU    57 semi-annual
#> 28: 2018-07-01 VDBKISDANZTAU    55 semi-annual
#> 29: 2019-01-01 VDBKISDANZTAU    42 semi-annual
#> 30: 2019-07-01 VDBKISDANZTAU    53 semi-annual
#> 31: 2020-01-01 VDBKISDANZTAU    53 semi-annual
#> 32: 2020-07-01 VDBKISDANZTAU    53 semi-annual
#> 33: 2021-01-01 VDBKISDANZTAU    53 semi-annual
#> 34: 2021-07-01 VDBKISDANZTAU    55 semi-annual
#> 35: 2022-01-01 VDBKISDANZTAU    47 semi-annual
#> 36: 2022-07-01 VDBKISDANZTAU    41 semi-annual
#> 37: 2023-01-01 VDBKISDANZTAU    40 semi-annual
#> 38: 2023-07-01 VDBKISDANZTAU    40 semi-annual
#> 39: 2024-01-01 VDBKISDANZTAU    39 semi-annual
#> 40: 2024-07-01 VDBKISDANZTAU    37 semi-annual
#> 41: 2025-01-01 VDBKISDANZTAU    36 semi-annual
#> 42: 2025-07-01 VDBKISDANZTAU    35 semi-annual
#> 43: 2026-01-01 VDBKISDANZTAU    35 semi-annual
#> 44: 2005-01-01 VDBKISDANZTEU    45 semi-annual
#> 45: 2005-07-01 VDBKISDANZTEU    45 semi-annual
#> 46: 2006-01-01 VDBKISDANZTEU    45 semi-annual
#> 47: 2006-07-01 VDBKISDANZTEU    45 semi-annual
#> 48: 2007-01-01 VDBKISDANZTEU    54 semi-annual
#> 49: 2007-07-01 VDBKISDANZTEU    55 semi-annual
#> 50: 2008-01-01 VDBKISDANZTEU    54 semi-annual
#> 51: 2008-07-01 VDBKISDANZTEU    52 semi-annual
#> 52: 2009-01-01 VDBKISDANZTEU    53 semi-annual
#> 53: 2009-07-01 VDBKISDANZTEU    51 semi-annual
#> 54: 2010-01-01 VDBKISDANZTEU    51 semi-annual
#> 55: 2010-07-01 VDBKISDANZTEU    55 semi-annual
#> 56: 2011-01-01 VDBKISDANZTEU    54 semi-annual
#> 57: 2011-07-01 VDBKISDANZTEU    54 semi-annual
#> 58: 2012-01-01 VDBKISDANZTEU    54 semi-annual
#> 59: 2012-07-01 VDBKISDANZTEU    53 semi-annual
#> 60: 2013-01-01 VDBKISDANZTEU    51 semi-annual
#> 61: 2013-07-01 VDBKISDANZTEU    57 semi-annual
#> 62: 2014-01-01 VDBKISDANZTEU    53 semi-annual
#> 63: 2014-07-01 VDBKISDANZTEU    51 semi-annual
#> 64: 2015-01-01 VDBKISDANZTEU    49 semi-annual
#> 65: 2015-07-01 VDBKISDANZTEU    49 semi-annual
#> 66: 2016-01-01 VDBKISDANZTEU    46 semi-annual
#> 67: 2016-07-01 VDBKISDANZTEU    35 semi-annual
#> 68: 2017-01-01 VDBKISDANZTEU    35 semi-annual
#> 69: 2017-07-01 VDBKISDANZTEU    34 semi-annual
#> 70: 2018-01-01 VDBKISDANZTEU    35 semi-annual
#> 71: 2018-07-01 VDBKISDANZTEU    33 semi-annual
#> 72: 2019-01-01 VDBKISDANZTEU    26 semi-annual
#> 73: 2019-07-01 VDBKISDANZTEU    32 semi-annual
#> 74: 2020-01-01 VDBKISDANZTEU    32 semi-annual
#> 75: 2020-07-01 VDBKISDANZTEU    32 semi-annual
#> 76: 2021-01-01 VDBKISDANZTEU    32 semi-annual
#> 77: 2021-07-01 VDBKISDANZTEU    35 semi-annual
#> 78: 2022-01-01 VDBKISDANZTEU    27 semi-annual
#> 79: 2022-07-01 VDBKISDANZTEU    24 semi-annual
#> 80: 2023-01-01 VDBKISDANZTEU    24 semi-annual
#> 81: 2023-07-01 VDBKISDANZTEU    24 semi-annual
#> 82: 2024-01-01 VDBKISDANZTEU    24 semi-annual
#> 83: 2024-07-01 VDBKISDANZTEU    23 semi-annual
#> 84: 2025-01-01 VDBKISDANZTEU    22 semi-annual
#> 85: 2025-07-01 VDBKISDANZTEU    21 semi-annual
#> 86: 2026-01-01 VDBKISDANZTEU    21 semi-annual
#>           date           key value        freq
#>         <Date>        <char> <num>      <char>
#>                                               title  attr1     attr2  attr3
#>                                              <char> <char>    <char> <char>
#>  1:                  number of foreign subsidiaries     AT BS0100510     Z5
#>  2:                  number of foreign subsidiaries     AT BS0100510     Z5
#>  3:                  number of foreign subsidiaries     AT BS0100510     Z5
#>  4:                  number of foreign subsidiaries     AT BS0100510     Z5
#>  5:                  number of foreign subsidiaries     AT BS0100510     Z5
#>  6:                  number of foreign subsidiaries     AT BS0100510     Z5
#>  7:                  number of foreign subsidiaries     AT BS0100510     Z5
#>  8:                  number of foreign subsidiaries     AT BS0100510     Z5
#>  9:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 10:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 11:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 12:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 13:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 14:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 15:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 16:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 17:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 18:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 19:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 20:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 21:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 22:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 23:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 24:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 25:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 26:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 27:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 28:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 29:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 30:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 31:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 32:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 33:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 34:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 35:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 36:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 37:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 38:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 39:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 40:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 41:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 42:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 43:                  number of foreign subsidiaries     AT BS0100510     Z5
#> 44: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 45: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 46: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 47: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 48: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 49: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 50: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 51: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 52: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 53: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 54: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 55: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 56: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 57: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 58: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 59: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 60: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 61: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 62: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 63: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 64: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 65: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 66: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 67: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 68: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 69: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 70: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 71: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 72: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 73: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 74: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 75: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 76: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 77: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 78: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 79: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 80: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 81: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 82: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 83: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 84: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 85: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 86: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#>                                               title  attr1     attr2  attr3
#>                                              <char> <char>    <char> <char>
#>      attr4 attr1_dim    attr2_dim attr3_dim attr4_dim unit_mult unit_text
#>     <char>    <char>       <char>    <char>    <char>    <char>    <char>
#>  1:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#>  2:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#>  3:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#>  4:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#>  5:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#>  6:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#>  7:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#>  8:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#>  9:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 10:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 11:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 12:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 13:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 14:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 15:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 16:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 17:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 18:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 19:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 20:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 21:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 22:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 23:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 24:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 25:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 26:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 27:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 28:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 29:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 30:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 31:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 32:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 33:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 34:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 35:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 36:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 37:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 38:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 39:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 40:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 41:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 42:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 43:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 44:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 45:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 46:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 47:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 48:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 49:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 50:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 51:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 52:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 53:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 54:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 55:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 56:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 57:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 58:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 59:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 60:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 61:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 62:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 63:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 64:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 65:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 66:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 67:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 68:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 69:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 70:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 71:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 72:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 73:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 74:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 75:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 76:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 77:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 78:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 79:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 80:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 81:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 82:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 83:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 84:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 85:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#> 86:    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG         0   in ones
#>      attr4 attr1_dim    attr2_dim attr3_dim attr4_dim unit_mult unit_text
#>     <char>    <char>       <char>    <char>    <char>    <char>    <char>
# }
```
