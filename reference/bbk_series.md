# Fetch the Deutsche Bundesbank (BBk) series

Retrieve a single series by its key via the Bundesbank SDMX Web Service.

## Usage

``` r
bbk_series(key)
```

## Source

<https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-data>

## Arguments

- key:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  The series keys to query.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## See also

[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md) for
an endpoint with more options.

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md)

## Examples

``` r
# \donttest{
bbk_series("BBEX3.M.DKK.EUR.BB.AC.A01")
#>            date                       key  value    freq
#>          <Date>                    <char>  <num>  <char>
#>   1: 1999-01-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4359 monthly
#>   2: 1999-02-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4344 monthly
#>   3: 1999-03-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4317 monthly
#>   4: 1999-04-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4323 monthly
#>   5: 1999-05-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4318 monthly
#>  ---                                                    
#> 321: 2025-09-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4649 monthly
#> 322: 2025-10-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4677 monthly
#> 323: 2025-11-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4688 monthly
#> 324: 2025-12-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4689 monthly
#> 325: 2026-01-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4674 monthly
#>                                                                            title
#>                                                                           <char>
#>   1: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>   2: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>   3: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>   4: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>   5: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>  ---                                                                            
#> 321: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#> 322: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#> 323: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#> 324: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#> 325: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>      category   unit unit_mult         last_update
#>        <char> <char>    <char>              <char>
#>   1:     WEDE    DKK       One 2026-01-30 16:01:31
#>   2:     WEDE    DKK       One 2026-01-30 16:01:31
#>   3:     WEDE    DKK       One 2026-01-30 16:01:31
#>   4:     WEDE    DKK       One 2026-01-30 16:01:31
#>   5:     WEDE    DKK       One 2026-01-30 16:01:31
#>  ---                                              
#> 321:     WEDE    DKK       One 2026-01-30 16:01:31
#> 322:     WEDE    DKK       One 2026-01-30 16:01:31
#> 323:     WEDE    DKK       One 2026-01-30 16:01:31
#> 324:     WEDE    DKK       One 2026-01-30 16:01:31
#> 325:     WEDE    DKK       One 2026-01-30 16:01:31
#>                                                            comment
#>                                                             <char>
#>   1: The ECB publishes daily euro foreign exchange reference rates
#>   2: The ECB publishes daily euro foreign exchange reference rates
#>   3: The ECB publishes daily euro foreign exchange reference rates
#>   4: The ECB publishes daily euro foreign exchange reference rates
#>   5: The ECB publishes daily euro foreign exchange reference rates
#>  ---                                                              
#> 321: The ECB publishes daily euro foreign exchange reference rates
#> 322: The ECB publishes daily euro foreign exchange reference rates
#> 323: The ECB publishes daily euro foreign exchange reference rates
#> 324: The ECB publishes daily euro foreign exchange reference rates
#> 325: The ECB publishes daily euro foreign exchange reference rates
#>                            source
#>                            <char>
#>   1: European Central Bank (ECB).
#>   2: European Central Bank (ECB).
#>   3: European Central Bank (ECB).
#>   4: European Central Bank (ECB).
#>   5: European Central Bank (ECB).
#>  ---                             
#> 321: European Central Bank (ECB).
#> 322: European Central Bank (ECB).
#> 323: European Central Bank (ECB).
#> 324: European Central Bank (ECB).
#> 325: European Central Bank (ECB).
bbk_series("BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B")
#>         date                                 key value      freq
#>       <char>                              <char> <num>    <char>
#>   1: 1999-Q3 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   2: 1999-Q4 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   3: 2000-Q1 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   4: 2000-Q2 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   5: 2000-Q3 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>  ---                                                            
#> 101: 2024-Q3 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   5.0 quarterly
#> 102: 2024-Q4 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.3 quarterly
#> 103: 2025-Q1 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.2 quarterly
#> 104: 2025-Q2 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.3 quarterly
#> 105: 2025-Q3 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.3 quarterly
#>                                                                                       title
#>                                                                                      <char>
#>   1: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   2: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   3: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   4: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   5: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>  ---                                                                                       
#> 101: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 102: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 103: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 104: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 105: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>      category   unit unit_mult         last_update comment source
#>        <char> <char>    <char>              <char>  <char> <char>
#>   1:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
#>   2:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
#>   3:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
#>   4:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
#>   5:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
#>  ---                                                             
#> 101:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
#> 102:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
#> 103:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
#> 104:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
#> 105:     GRF2   Euro  Billions 2026-01-13 14:12:50    <NA>   <NA>
bbk_series("BBBK11.D.TTA000")
#>             date             key  value   freq
#>           <Date>          <char> <char> <char>
#>    1: 1999-01-01 BBBK11.D.TTA000  29312  daily
#>    2: 1999-01-08 BBBK11.D.TTA000  27475  daily
#>    3: 1999-01-15 BBBK11.D.TTA000  27475  daily
#>    4: 1999-01-22 BBBK11.D.TTA000  27475  daily
#>    5: 1999-01-29 BBBK11.D.TTA000  27475  daily
#>   ---                                         
#> 1410: 2025-12-26 BBBK11.D.TTA000 349991  daily
#> 1411: 2026-01-02 BBBK11.D.TTA000 395215  daily
#> 1412: 2026-01-09 BBBK11.D.TTA000 395215  daily
#> 1413: 2026-01-16 BBBK11.D.TTA000 395215  daily
#> 1414: 2026-01-23 BBBK11.D.TTA000 395215  daily
#>                                                              title category
#>                                                             <char>   <char>
#>    1: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    2: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    3: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    4: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    5: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>   ---                                                                      
#> 1410: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1411: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1412: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1413: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1414: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>         unit unit_mult         last_update comment source
#>       <char>    <char>              <char>  <char> <char>
#>    1:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
#>    2:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
#>    3:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
#>    4:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
#>    5:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
#>   ---                                                    
#> 1410:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
#> 1411:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
#> 1412:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
#> 1413:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
#> 1414:   EURO  Millions 2026-01-30 13:39:27    <NA>   <NA>
# }
```
