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
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
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
bbk_series("BBEX3.M.DKK.EUR.BB.AC.A01")
#>            date                       key  value    freq
#>          <Date>                    <char>  <num>  <char>
#>   1: 1999-01-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4359 monthly
#>   2: 1999-02-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4344 monthly
#>   3: 1999-03-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4317 monthly
#>   4: 1999-04-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4323 monthly
#>   5: 1999-05-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4318 monthly
#>  ---                                                    
#> 325: 2026-01-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4674 monthly
#> 326: 2026-02-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4718 monthly
#> 327: 2026-03-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4730 monthly
#> 328: 2026-04-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4716 monthly
#> 329: 2026-05-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4731 monthly
#>                                                                            title
#>                                                                           <char>
#>   1: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>   2: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>   3: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>   4: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>   5: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>  ---                                                                            
#> 325: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#> 326: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#> 327: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#> 328: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#> 329: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark
#>      category   unit unit_mult         last_update
#>        <char> <char>    <char>              <char>
#>   1:     WEDE    DKK       One 2026-05-29 15:59:20
#>   2:     WEDE    DKK       One 2026-05-29 15:59:20
#>   3:     WEDE    DKK       One 2026-05-29 15:59:20
#>   4:     WEDE    DKK       One 2026-05-29 15:59:20
#>   5:     WEDE    DKK       One 2026-05-29 15:59:20
#>  ---                                              
#> 325:     WEDE    DKK       One 2026-05-29 15:59:20
#> 326:     WEDE    DKK       One 2026-05-29 15:59:20
#> 327:     WEDE    DKK       One 2026-05-29 15:59:20
#> 328:     WEDE    DKK       One 2026-05-29 15:59:20
#> 329:     WEDE    DKK       One 2026-05-29 15:59:20
#>                                                            comment
#>                                                             <char>
#>   1: The ECB publishes daily euro foreign exchange reference rates
#>   2: The ECB publishes daily euro foreign exchange reference rates
#>   3: The ECB publishes daily euro foreign exchange reference rates
#>   4: The ECB publishes daily euro foreign exchange reference rates
#>   5: The ECB publishes daily euro foreign exchange reference rates
#>  ---                                                              
#> 325: The ECB publishes daily euro foreign exchange reference rates
#> 326: The ECB publishes daily euro foreign exchange reference rates
#> 327: The ECB publishes daily euro foreign exchange reference rates
#> 328: The ECB publishes daily euro foreign exchange reference rates
#> 329: The ECB publishes daily euro foreign exchange reference rates
#>                            source
#>                            <char>
#>   1: European Central Bank (ECB).
#>   2: European Central Bank (ECB).
#>   3: European Central Bank (ECB).
#>   4: European Central Bank (ECB).
#>   5: European Central Bank (ECB).
#>  ---                             
#> 325: European Central Bank (ECB).
#> 326: European Central Bank (ECB).
#> 327: European Central Bank (ECB).
#> 328: European Central Bank (ECB).
#> 329: European Central Bank (ECB).
bbk_series("BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B")
#>         date                                 key value      freq
#>       <char>                              <char> <num>    <char>
#>   1: 1999-Q3 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   2: 1999-Q4 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   3: 2000-Q1 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   4: 2000-Q2 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   5: 2000-Q3 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>  ---                                                            
#> 102: 2024-Q4 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.3 quarterly
#> 103: 2025-Q1 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.2 quarterly
#> 104: 2025-Q2 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.3 quarterly
#> 105: 2025-Q3 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.3 quarterly
#> 106: 2025-Q4 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   3.9 quarterly
#>                                                                                       title
#>                                                                                      <char>
#>   1: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   2: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   3: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   4: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   5: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>  ---                                                                                       
#> 102: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 103: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 104: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 105: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 106: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>      category   unit unit_mult         last_update comment source
#>        <char> <char>    <char>              <char>  <char> <char>
#>   1:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
#>   2:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
#>   3:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
#>   4:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
#>   5:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
#>  ---                                                             
#> 102:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
#> 103:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
#> 104:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
#> 105:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
#> 106:     FIF2   Euro  Billions 2026-05-11 10:52:13    <NA>   <NA>
bbk_series("BBBK11.D.TTA000")
#>             date             key  value   freq
#>           <Date>          <char> <char> <char>
#>    1: 1999-01-01 BBBK11.D.TTA000  29312  daily
#>    2: 1999-01-08 BBBK11.D.TTA000  27475  daily
#>    3: 1999-01-15 BBBK11.D.TTA000  27475  daily
#>    4: 1999-01-22 BBBK11.D.TTA000  27475  daily
#>    5: 1999-01-29 BBBK11.D.TTA000  27475  daily
#>   ---                                         
#> 1427: 2026-04-24 BBBK11.D.TTA000 430173  daily
#> 1428: 2026-05-01 BBBK11.D.TTA000 430074  daily
#> 1429: 2026-05-08 BBBK11.D.TTA000 430074  daily
#> 1430: 2026-05-15 BBBK11.D.TTA000 430074  daily
#> 1431: 2026-05-22 BBBK11.D.TTA000 430074  daily
#>                                                              title category
#>                                                             <char>   <char>
#>    1: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    2: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    3: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    4: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    5: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>   ---                                                                      
#> 1427: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1428: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1429: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1430: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1431: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>         unit unit_mult         last_update comment source
#>       <char>    <char>              <char>  <char> <char>
#>    1:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
#>    2:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
#>    3:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
#>    4:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
#>    5:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
#>   ---                                                    
#> 1427:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
#> 1428:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
#> 1429:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
#> 1430:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
#> 1431:   EURO  Millions 2026-05-27 12:37:23    <NA>   <NA>
# }
```
