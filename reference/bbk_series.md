# Fetch the Deutsche Bundesbank (BBk) series

Retrieve a single series by its key via the Bundesbank SDMX Web Service.

## Usage

``` r
bbk_series(key)
```

## Source

<https://api.statistiken.bundesbank.de/>

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
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
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
#> 327: 2026-03-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4730 monthly
#> 328: 2026-04-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4716 monthly
#> 329: 2026-05-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4731 monthly
#> 330: 2026-06-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4744 monthly
#> 331: 2026-07-01 BBEX3.M.DKK.EUR.BB.AC.A01 7.4752 monthly
#>                                                                                           title
#>                                                                                          <char>
#>   1: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#>   2: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#>   3: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#>   4: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#>   5: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#>  ---                                                                                           
#> 327: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#> 328: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#> 329: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#> 330: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#> 331: Euro foreign exchange reference rate of the ECB / EUR 1 = DKK ... / Denmark / End of month
#>      category   unit unit_mult         last_update
#>        <char> <char>    <char>              <char>
#>   1:     WEDE   <NA>       One 2026-08-25 15:23:37
#>   2:     WEDE   <NA>       One 2026-08-25 15:23:37
#>   3:     WEDE   <NA>       One 2026-08-25 15:23:37
#>   4:     WEDE   <NA>       One 2026-08-25 15:23:37
#>   5:     WEDE   <NA>       One 2026-08-25 15:23:37
#>  ---                                              
#> 327:     WEDE   <NA>       One 2026-08-25 15:23:37
#> 328:     WEDE   <NA>       One 2026-08-25 15:23:37
#> 329:     WEDE   <NA>       One 2026-08-25 15:23:37
#> 330:     WEDE   <NA>       One 2026-08-25 15:23:37
#> 331:     WEDE   <NA>       One 2026-08-25 15:23:37
#>                                                                                                                                                   comment
#>                                                                                                                                                    <char>
#>   1: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#>   2: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#>   3: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#>   4: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#>   5: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#>  ---                                                                                                                                                     
#> 327: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#> 328: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#> 329: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#> 330: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#> 331: The ECB publishes daily euro foreign exchange reference rates, which are calculated on the basis of the concertation between central banks at 14.15.
#>                            source
#>                            <char>
#>   1: European Central Bank (ECB).
#>   2: European Central Bank (ECB).
#>   3: European Central Bank (ECB).
#>   4: European Central Bank (ECB).
#>   5: European Central Bank (ECB).
#>  ---                             
#> 327: European Central Bank (ECB).
#> 328: European Central Bank (ECB).
#> 329: European Central Bank (ECB).
#> 330: European Central Bank (ECB).
#> 331: European Central Bank (ECB).
bbk_series("BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B")
#>            date                                 key value      freq
#>          <Date>                              <char> <num>    <char>
#>   1: 1999-01-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   2: 1999-04-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   3: 1999-07-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   4: 1999-10-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>   5: 2000-01-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.4 quarterly
#>  ---                                                               
#> 105: 2025-01-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.2 quarterly
#> 106: 2025-04-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.3 quarterly
#> 107: 2025-07-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   4.3 quarterly
#> 108: 2025-10-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   3.9 quarterly
#> 109: 2026-01-01 BBAF3.Q.F41.S121.DE.S1.W0.LE.N._X.B   3.7 quarterly
#>                                                                                       title
#>                                                                                      <char>
#>   1: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   2: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   3: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   4: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>   5: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>  ---                                                                                       
#> 105: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 106: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 107: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 108: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#> 109: Short-term loans Creditor: Central bank (Germany) / Debtor: All sectors (World) Stocks
#>      category   unit unit_mult         last_update comment source
#>        <char> <char>    <char>              <char>  <char> <char>
#>   1:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
#>   2:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
#>   3:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
#>   4:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
#>   5:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
#>  ---                                                             
#> 105:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
#> 106:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
#> 107:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
#> 108:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
#> 109:     FIF2   <NA>  Billions 2026-07-15 11:11:23    <NA>   <NA>
bbk_series("BBBK11.D.TTA000")
#>             date             key  value   freq
#>           <Date>          <char>  <num> <char>
#>    1: 1998-12-22 BBBK11.D.TTA000 -13688  daily
#>    2: 1999-01-01 BBBK11.D.TTA000  29312  daily
#>    3: 1999-01-08 BBBK11.D.TTA000  27475  daily
#>    4: 1999-01-15 BBBK11.D.TTA000  27475  daily
#>    5: 1999-01-22 BBBK11.D.TTA000  27475  daily
#>   ---                                         
#> 1439: 2026-07-17 BBBK11.D.TTA000 380732  daily
#> 1440: 2026-07-24 BBBK11.D.TTA000 380732  daily
#> 1441: 2026-07-31 BBBK11.D.TTA000 380732  daily
#> 1442: 2026-08-07 BBBK11.D.TTA000 380732  daily
#> 1443: 2026-08-14 BBBK11.D.TTA000 380732  daily
#>                                                              title category
#>                                                             <char>   <char>
#>    1: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    2: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    3: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    4: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>    5: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>   ---                                                                      
#> 1439: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1440: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1441: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1442: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#> 1443: Gold and gold receivables / unadjusted / Deutsche Bundesbank   BABA11
#>         unit unit_mult         last_update comment source
#>       <char>    <char>              <char>  <char> <char>
#>    1:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
#>    2:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
#>    3:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
#>    4:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
#>    5:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
#>   ---                                                    
#> 1439:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
#> 1440:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
#> 1441:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
#> 1442:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
#> 1443:   <NA>  Millions 2026-08-19 10:43:07    <NA>   <NA>
# }
```
