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
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
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
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md)

## Examples

``` r
# \donttest{
onb_data(hier_id = 11, key = "VDBFKBSC217000")
#>         date            key value   freq                                title
#>       <char>         <char> <num> <char>                               <char>
#>   1:    1998 VDBFKBSC217000  2558      A Loans to euro area residents - total
#>   2:    1999 VDBFKBSC217000 15780      A Loans to euro area residents - total
#>   3:    2000 VDBFKBSC217000  9552      A Loans to euro area residents - total
#>   4:    2001 VDBFKBSC217000  5538      A Loans to euro area residents - total
#>   5:    2002 VDBFKBSC217000  7815      A Loans to euro area residents - total
#>  ---                                                                         
#> 360: 2025-08 VDBFKBSC217000  1832      M Loans to euro area residents - total
#> 361: 2025-09 VDBFKBSC217000  1779      M Loans to euro area residents - total
#> 362: 2025-10 VDBFKBSC217000  1688      M Loans to euro area residents - total
#> 363: 2025-11 VDBFKBSC217000  1857      M Loans to euro area residents - total
#> 364: 2025-12 VDBFKBSC217000  1819      M Loans to euro area residents - total
#>       attr1   attr2  attr3  attr4 attr1_dim    attr2_dim attr3_dim attr4_dim
#>      <char>  <char> <char> <char>    <char>       <char>    <char>    <char>
#>   1:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>   2:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>   3:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>   4:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>   5:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>  ---                                                                        
#> 360:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#> 361:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#> 362:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#> 363:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#> 364:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>      unit_mult        unit_text
#>         <char>           <char>
#>   1:         6 in millions Euro
#>   2:         6 in millions Euro
#>   3:         6 in millions Euro
#>   4:         6 in millions Euro
#>   5:         6 in millions Euro
#>  ---                           
#> 360:         6 in millions Euro
#> 361:         6 in millions Euro
#> 362:         6 in millions Euro
#> 363:         6 in millions Euro
#> 364:         6 in millions Euro

# Loans to euro area residents, since 2000:
onb_data(hier_id = 11, key = "VDBFKBSC217000", start_period = "2000-01-01")
#>         date            key value   freq                                title
#>       <char>         <char> <num> <char>                               <char>
#>   1:    2000 VDBFKBSC217000  9552      A Loans to euro area residents - total
#>   2:    2001 VDBFKBSC217000  5538      A Loans to euro area residents - total
#>   3:    2002 VDBFKBSC217000  7815      A Loans to euro area residents - total
#>   4:    2003 VDBFKBSC217000  6933      A Loans to euro area residents - total
#>   5:    2004 VDBFKBSC217000 10963      A Loans to euro area residents - total
#>  ---                                                                         
#> 334: 2025-08 VDBFKBSC217000  1832      M Loans to euro area residents - total
#> 335: 2025-09 VDBFKBSC217000  1779      M Loans to euro area residents - total
#> 336: 2025-10 VDBFKBSC217000  1688      M Loans to euro area residents - total
#> 337: 2025-11 VDBFKBSC217000  1857      M Loans to euro area residents - total
#> 338: 2025-12 VDBFKBSC217000  1819      M Loans to euro area residents - total
#>       attr1   attr2  attr3  attr4 attr1_dim    attr2_dim attr3_dim attr4_dim
#>      <char>  <char> <char> <char>    <char>       <char>    <char>    <char>
#>   1:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>   2:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>   3:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>   4:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>   5:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>  ---                                                                        
#> 334:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#> 335:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#> 336:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#> 337:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#> 338:     AT 00100KI     AT    Z0Z PRODUZENT BANKENSEKTOR    REGION  WAEHRUNG
#>      unit_mult        unit_text
#>         <char>           <char>
#>   1:         6 in millions Euro
#>   2:         6 in millions Euro
#>   3:         6 in millions Euro
#>   4:         6 in millions Euro
#>   5:         6 in millions Euro
#>  ---                           
#> 334:         6 in millions Euro
#> 335:         6 in millions Euro
#> 336:         6 in millions Euro
#> 337:         6 in millions Euro
#> 338:         6 in millions Euro

# Austrian imports and exports of goods from/to Germany, 2002–2012, annual frequency:
onb_data(hier_id = 901, key = "VDBQZA1000", start_period = 2002, end_period = 2012, freq = "A")
#>         date        key  value   freq  title  attr1  attr2  attr3  attr4  attr5
#>       <char>     <char>  <num> <char> <char> <char> <char> <char> <char> <char>
#>    1:   2002 VDBQZA1000    596      A  Goods     AT      D     TR    000    000
#>    2:   2003 VDBQZA1000    679      A  Goods     AT      D     TR    000    000
#>    3:   2004 VDBQZA1000    722      A  Goods     AT      D     TR    000    000
#>    4:   2005 VDBQZA1000    786      A  Goods     AT      D     TR    000    000
#>    5:   2006 VDBQZA1000    782      A  Goods     AT      D     TR    000    000
#>   ---                                                                          
#> 2603:   2008 VDBQZA1000  96077      A  Goods     AT      D ZALCA8    000    000
#> 2604:   2009 VDBQZA1000  79696      A  Goods     AT      D ZALCA8    000    000
#> 2605:   2010 VDBQZA1000  93865      A  Goods     AT      D ZALCA8    000    000
#> 2606:   2011 VDBQZA1000 105492      A  Goods     AT      D ZALCA8    000    000
#> 2607:   2012 VDBQZA1000 105634      A  Goods     AT      D ZALCA8    000    000
#>        attr6  attr7 attr1_dim     attr2_dim     attr3_dim  attr4_dim attr5_dim
#>       <char> <char>    <char>        <char>        <char>     <char>    <char>
#>    1:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#>    2:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#>    3:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#>    4:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#>    5:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#>   ---                                                                         
#> 2603:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#> 2604:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#> 2605:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#> 2606:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#> 2607:    000      N PRODUZENT Z_AUSPRAEGUNG Z_PARTNERLAND Z_WAEHRUNG Z_BRANCHE
#>          attr6_dim     attr7_dim unit_mult        unit_text
#>             <char>        <char>    <char>           <char>
#>    1: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>    2: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>    3: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>    4: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>    5: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#>   ---                                                      
#> 2603: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#> 2604: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#> 2605: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#> 2606: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro
#> 2607: Z_VGR_SEKTOR Z_KUMULIERUNG         6 in millions Euro

# Number of Austrian banks' subsidiaries abroad an in the EU, from 2005, semiannual:
onb_data(
  hier_id = 321,
  key = c("VDBKISDANZTAU", "VDBKISDANZTEU"),
  start_period = 200501,
  freq = "H"
)
#>        date           key value   freq
#>      <char>        <char> <num> <char>
#>  1: 2005-B1 VDBKISDANZTAU    90      H
#>  2: 2005-B2 VDBKISDANZTAU    90      H
#>  3: 2006-B1 VDBKISDANZTAU    96      H
#>  4: 2006-B2 VDBKISDANZTAU    96      H
#>  5: 2007-B1 VDBKISDANZTAU    96      H
#>  6: 2007-B2 VDBKISDANZTAU   102      H
#>  7: 2008-B1 VDBKISDANZTAU   107      H
#>  8: 2008-B2 VDBKISDANZTAU   103      H
#>  9: 2009-B1 VDBKISDANZTAU   105      H
#> 10: 2009-B2 VDBKISDANZTAU   103      H
#> 11: 2010-B1 VDBKISDANZTAU   103      H
#> 12: 2010-B2 VDBKISDANZTAU   107      H
#> 13: 2011-B1 VDBKISDANZTAU   105      H
#> 14: 2011-B2 VDBKISDANZTAU   105      H
#> 15: 2012-B1 VDBKISDANZTAU   103      H
#> 16: 2012-B2 VDBKISDANZTAU   101      H
#> 17: 2013-B1 VDBKISDANZTAU    96      H
#> 18: 2013-B2 VDBKISDANZTAU    93      H
#> 19: 2014-B1 VDBKISDANZTAU    89      H
#> 20: 2014-B2 VDBKISDANZTAU    85      H
#> 21: 2015-B1 VDBKISDANZTAU    83      H
#> 22: 2015-B2 VDBKISDANZTAU    83      H
#> 23: 2016-B1 VDBKISDANZTAU    80      H
#> 24: 2016-B2 VDBKISDANZTAU    60      H
#> 25: 2017-B1 VDBKISDANZTAU    60      H
#> 26: 2017-B2 VDBKISDANZTAU    58      H
#> 27: 2018-B1 VDBKISDANZTAU    57      H
#> 28: 2018-B2 VDBKISDANZTAU    55      H
#> 29: 2019-B1 VDBKISDANZTAU    42      H
#> 30: 2019-B2 VDBKISDANZTAU    53      H
#> 31: 2020-B1 VDBKISDANZTAU    53      H
#> 32: 2020-B2 VDBKISDANZTAU    53      H
#> 33: 2021-B1 VDBKISDANZTAU    53      H
#> 34: 2021-B2 VDBKISDANZTAU    55      H
#> 35: 2022-B1 VDBKISDANZTAU    47      H
#> 36: 2022-B2 VDBKISDANZTAU    41      H
#> 37: 2023-B1 VDBKISDANZTAU    40      H
#> 38: 2023-B2 VDBKISDANZTAU    40      H
#> 39: 2024-B1 VDBKISDANZTAU    39      H
#> 40: 2024-B2 VDBKISDANZTAU    37      H
#> 41: 2025-B1 VDBKISDANZTAU    36      H
#> 42: 2005-B1 VDBKISDANZTEU    45      H
#> 43: 2005-B2 VDBKISDANZTEU    45      H
#> 44: 2006-B1 VDBKISDANZTEU    45      H
#> 45: 2006-B2 VDBKISDANZTEU    45      H
#> 46: 2007-B1 VDBKISDANZTEU    54      H
#> 47: 2007-B2 VDBKISDANZTEU    55      H
#> 48: 2008-B1 VDBKISDANZTEU    54      H
#> 49: 2008-B2 VDBKISDANZTEU    52      H
#> 50: 2009-B1 VDBKISDANZTEU    53      H
#> 51: 2009-B2 VDBKISDANZTEU    51      H
#> 52: 2010-B1 VDBKISDANZTEU    51      H
#> 53: 2010-B2 VDBKISDANZTEU    55      H
#> 54: 2011-B1 VDBKISDANZTEU    54      H
#> 55: 2011-B2 VDBKISDANZTEU    54      H
#> 56: 2012-B1 VDBKISDANZTEU    54      H
#> 57: 2012-B2 VDBKISDANZTEU    53      H
#> 58: 2013-B1 VDBKISDANZTEU    51      H
#> 59: 2013-B2 VDBKISDANZTEU    57      H
#> 60: 2014-B1 VDBKISDANZTEU    53      H
#> 61: 2014-B2 VDBKISDANZTEU    51      H
#> 62: 2015-B1 VDBKISDANZTEU    49      H
#> 63: 2015-B2 VDBKISDANZTEU    49      H
#> 64: 2016-B1 VDBKISDANZTEU    46      H
#> 65: 2016-B2 VDBKISDANZTEU    35      H
#> 66: 2017-B1 VDBKISDANZTEU    35      H
#> 67: 2017-B2 VDBKISDANZTEU    34      H
#> 68: 2018-B1 VDBKISDANZTEU    35      H
#> 69: 2018-B2 VDBKISDANZTEU    33      H
#> 70: 2019-B1 VDBKISDANZTEU    26      H
#> 71: 2019-B2 VDBKISDANZTEU    32      H
#> 72: 2020-B1 VDBKISDANZTEU    32      H
#> 73: 2020-B2 VDBKISDANZTEU    32      H
#> 74: 2021-B1 VDBKISDANZTEU    32      H
#> 75: 2021-B2 VDBKISDANZTEU    35      H
#> 76: 2022-B1 VDBKISDANZTEU    27      H
#> 77: 2022-B2 VDBKISDANZTEU    24      H
#> 78: 2023-B1 VDBKISDANZTEU    24      H
#> 79: 2023-B2 VDBKISDANZTEU    24      H
#> 80: 2024-B1 VDBKISDANZTEU    24      H
#> 81: 2024-B2 VDBKISDANZTEU    23      H
#> 82: 2025-B1 VDBKISDANZTEU    22      H
#>        date           key value   freq
#>      <char>        <char> <num> <char>
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
#> 42: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
#> 43: number of foreign subsidiaries hereof in the EU     AT BS0100510     Z5
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
#>      attr4 attr1_dim    attr2_dim attr3_dim attr4_dim unit_mult unit_text
#>     <char>    <char>       <char>    <char>    <char>    <char>    <char>
# }
```
