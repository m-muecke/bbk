# Fetch Bank of Japan (BoJ) metadata

Retrieve series metadata from the Bank of Japan Statistics API.

## Usage

``` r
boj_metadata(db, lang = "en")
```

## Source

<https://www.stat-search.boj.or.jp/ssi/html/nme_a_en.html>

## Arguments

- db:

  (`character(1)`)  
  The database code to query (e.g., `"FM08"` for foreign exchange
  rates).

- lang:

  (`character(1)`)  
  Language for names, either `"en"` or `"jp"`. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested metadata.

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`ecb_dimension()`](https://m-muecke.github.io/bbk/reference/ecb_dimension.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`nob_dimension()`](https://m-muecke.github.io/bbk/reference/nob_dimension.md),
[`nob_metadata()`](https://m-muecke.github.io/bbk/reference/nob_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md),
[`snb_dimension()`](https://m-muecke.github.io/bbk/reference/snb_dimension.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
boj_metadata("FM08")
#>         code
#>       <char>
#>  1:  FXERD01
#>  2:  FXERD02
#>  3:  FXERD03
#>  4:  FXERD04
#>  5:  FXERD05
#>  6:  FXERD06
#>  7:  FXERD07
#>  8:  FXERD31
#>  9:  FXERD32
#> 10:  FXERD33
#> 11:  FXERD34
#> 12:  FXERD35
#> 13:  FXERD36
#> 14:  FXERD39
#> 15:  FXERD37
#> 16:  FXERD38
#> 17:  FXERD11
#> 18:  FXERD12
#> 19:  FXERD13
#> 20:  FXERD14
#> 21:  FXERD21
#> 22:  FXERD22
#> 23:  FXERM06
#> 24:  FXERM07
#> 25:  FXERM08
#> 26:  FXERM09
#> 27:  FXERM05
#> 28:  FXERM03
#> 29:  FXERM11
#> 30:  FXERM15
#> 31:  FXERM23
#> 32:  FXERM27
#> 33:  FXERM31
#> 34:  FXERM32
#> 35:  FXERM33
#> 36:  FXERM34
#> 37:  FXAR@01
#> 38:  FXAR@02
#> 39: FXARUSGB
#> 40:   FXAREC
#> 41:   FXARDE
#> 42:   FXARFR
#> 43:   FXARNL
#> 44:   FXARBE
#> 45:   FXARAT
#> 46:   FXARIT
#> 47:   FXARPT
#> 48:   FXARES
#> 49:   FXARGB
#> 50:   FXARCA
#> 51:   FXARCH
#> 52:   FXARSE
#> 53:   FXARDK
#> 54:   FXARNO
#> 55:   FXARCN
#> 56:   FXARKR
#> 57:   FXARSG
#> 58:   FXARAU
#>         code
#>       <char>
#>                                                                                                                           name
#>                                                                                                                         <char>
#>  1:                                                                       US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market
#>  2:                                                                                        US.Dollar/Yen Highest, Tokyo Market
#>  3:                                                                                         US.Dollar/Yen Lowest, Tokyo Market
#>  4:                                                                      US.Dollar/Yen Spot Rate at 17:00 in JST, Tokyo Market
#>  5:                                                                                   US.Dollar/Yen Central Rate, Tokyo Market
#>  6:                                                                              US.Dollar/Yen, Turnover of Spot, Tokyo Market
#>  7:                                                                              US.Dollar/Yen, Turnover of Swap, Tokyo Market
#>  8:                                                                           Euro/US.Dollar as of 9:00am in JST, Tokyo Market
#>  9:                                                                                       Euro/US.Dollar Highest, Tokyo Market
#> 10:                                                                                        Euro/US.Dollar Lowest, Tokyo Market
#> 11:                                                                            Euro/US.Dollar as of 17:00 in JST, Tokyo Market
#> 12:                                                                              Euro/US.Dollar Turnover of Spot, Tokyo Market
#> 13:                                                                              Euro/US.Dollar Turnover of Swap, Tokyo Market
#> 14:                                                                                                                  Yen Index
#> 15:                                        (Discontinued)US.Dollar/Yen Turnover of  Option, Tokyo Market (through Jan.31.2012)
#> 16:                                       (Discontinued)Euro/US.Dollar Turnover of  Option, Tokyo Market (through Jan.31.2012)
#> 17:                              (Discontinued)US.Dollar/Yen Spot-forward Spread (1 Month), Tokyo Market (through Feb.26.2010)
#> 18:                             (Discontinued)US.Dollar/Yen Spot-forward Spread (3 Months), Tokyo Market (through Feb.26.2010)
#> 19:                   (Discontinued)US.Dollar/Yen Spot-forward Spread (1 Month)Annual Rate, Tokyo Market (through Feb.26.2010)
#> 20:                 (Discontinued)US.Dollar/Yen Spot-forward Spread (3 Months) Annual Rate, Tokyo Market (through Feb.26.2010)
#> 21:                                (Discontinued)US.Dollar/Yen Option Volatility (1 Month), Tokyo Market (through Feb.26.2010)
#> 22:                               (Discontinued)US.Dollar/Yen Option Volatility (3 Months), Tokyo Market (through Feb.26.2010)
#> 23:                                                        US.Dollar/Yen Spot Rate at 17:00 in JST, End of Month, Tokyo Market
#> 24:                                                US.Dollar/Yen Spot Rate at 17:00 in JST, Average in the Month, Tokyo Market
#> 25:                                                                     US.Dollar/Yen Central Rate, End of Month, Tokyo Market
#> 26:                                                             US.Dollar/Yen Central Rate, Average in the Month, Tokyo Market
#> 27:                                                                            US.Dollar/Yen Lowest in the Month, Tokyo Market
#> 28:                                                                           US.Dollar/Yen Highest in the Month, Tokyo Market
#> 29:                                                        US.Dollar/Yen, Turnover of Spot, Average in the Month, Tokyo Market
#> 30:                                                        US.Dollar/Yen, Turnover of Swap, Average in the Month, Tokyo Market
#> 31:             (Discontinued)US.Dollar/Yen Spot-forward Spread (3 Months), End of Month, Tokyo Market (through February 2010)
#> 32: (Discontinued)US.Dollar/Yen Spot-forward Spread (3 Months) Annual Rate, End of Month, Tokyo Market (through February 2010)
#> 33:                (Discontinued)US.Dollar/Yen Option Volatility (1 Month), End of Month, Tokyo Market (through February 2010)
#> 34:        (Discontinued)US.Dollar/Yen Option Volatility (1 Month), Average in the Month, Tokyo Market (through February 2010)
#> 35:               (Discontinued)US.Dollar/Yen Option Volatility (3 Months), End of Month, Tokyo Market (through February 2010)
#> 36:       (Discontinued)US.Dollar/Yen Option Volatility (3 Months), Average in the Month, Tokyo Market (through February 2010)
#> 37:                                        (Discontinued)Mark/U.S. Dollar Rate, End of Month, NY Market(through December 1998)
#> 38:                                           (Discontinued)Euro/U.S. Dollar Rate, End of Month, NY Market(through March 2008)
#> 39:                                (Discontinued)Pound Sterling/U.S. Dollar Rate, End of Month, NY Market (through March 2008)
#> 40:                                                                      (Discontinued)Euro, End of Month (through March 2008)
#> 41:                                         (Discontinued)Euro participate/Deutsche Mark, End of Month (through December 1998)
#> 42:                                          (Discontinued)Euro participate/French Franc, End of Month (through December 1998)
#> 43:                                   (Discontinued)Euro participate/Netherlands Guilder, End of Month (through December 1998)
#> 44:             (Discontinued)Euro participate/Belgian Franc, End of Month (Yen per 100 Belgian Franc) (through December 1998)
#> 45:                                    (Discontinued)Euro participate/Austrian Schilling, End of Month (through December 1998)
#> 46:               (Discontinued)Euro participate/Italian Lira, End of Month (Yen per 100 Italian Lira) (through December 1998)
#> 47:                                     (Discontinued)Euro participate/Portuguese Escudo, End of Month (through December 1998)
#> 48:                                        (Discontinued)Euro participate/Spanish Peseta, End of Month (through December 1998)
#> 49:                                                            (Discontinued)Pound Sterling, End of Month (through March 2008)
#> 50:                                                           (Discontinued)Canadian Dollar, End of Month (through March 2008)
#> 51:                                                               (Discontinued)Swiss Franc, End of Month (through March 2008)
#> 52:                                                             (Discontinued)Swedish Krona, End of Month (through March 2008)
#> 53:                                                              (Discontinued)Danish Krone, End of Month (through March 2008)
#> 54:                                                           (Discontinued)Norwegian Krone, End of Month (through March 2008)
#> 55:                                                           (Discontinued)Ren Min Bi Yuan, End of Month (through March 2008)
#> 56:                                              (Discontinued)Korean Won, End of Month (Yen per 100 Won) (through March 2008)
#> 57:                                                        (Discontinued)Singaporean Dollar, End of Month (through March 2008)
#> 58:                                                         (Discontinued)Australian Dollar, End of Month (through March 2008)
#>                                                                                                                           name
#>                                                                                                                         <char>
#>                               unit frequency               category
#>                             <char>    <char>                 <char>
#>  1:            Yen per U.S. Dollar     DAILY Foreign Exchange Rates
#>  2:            Yen per U.S. Dollar     DAILY Foreign Exchange Rates
#>  3:            Yen per U.S. Dollar     DAILY Foreign Exchange Rates
#>  4:            Yen per U.S. Dollar     DAILY Foreign Exchange Rates
#>  5:            Yen per U.S. Dollar     DAILY Foreign Exchange Rates
#>  6:           Million U.S. Dollars     DAILY Foreign Exchange Rates
#>  7:           Million U.S. Dollars     DAILY Foreign Exchange Rates
#>  8:           U.S. Dollar per Euro     DAILY Foreign Exchange Rates
#>  9:           U.S. Dollar per Euro     DAILY Foreign Exchange Rates
#> 10:           U.S. Dollar per Euro     DAILY Foreign Exchange Rates
#> 11:           U.S. Dollar per Euro     DAILY Foreign Exchange Rates
#> 12:           Million U.S. Dollars     DAILY Foreign Exchange Rates
#> 13:           Million U.S. Dollars     DAILY Foreign Exchange Rates
#> 14:                 Jan.4.1999=100     DAILY Foreign Exchange Rates
#> 15:           Million U.S. Dollars     DAILY Foreign Exchange Rates
#> 16:           Million U.S. Dollars     DAILY Foreign Exchange Rates
#> 17:                            Yen     DAILY Foreign Exchange Rates
#> 18:                            Yen     DAILY Foreign Exchange Rates
#> 19:              percent per annum     DAILY Foreign Exchange Rates
#> 20:              percent per annum     DAILY Foreign Exchange Rates
#> 21:                              %     DAILY Foreign Exchange Rates
#> 22:                              %     DAILY Foreign Exchange Rates
#> 23:            Yen per U.S. Dollar   MONTHLY Foreign Exchange Rates
#> 24:            Yen per U.S. Dollar   MONTHLY Foreign Exchange Rates
#> 25:            Yen per U.S. Dollar   MONTHLY Foreign Exchange Rates
#> 26:            Yen per U.S. Dollar   MONTHLY Foreign Exchange Rates
#> 27:            Yen per U.S. Dollar   MONTHLY Foreign Exchange Rates
#> 28:            Yen per U.S. Dollar   MONTHLY Foreign Exchange Rates
#> 29:           Million U.S. Dollars   MONTHLY Foreign Exchange Rates
#> 30:           Million U.S. Dollars   MONTHLY Foreign Exchange Rates
#> 31:                            Yen   MONTHLY Foreign Exchange Rates
#> 32:              Percent per annum   MONTHLY Foreign Exchange Rates
#> 33:                              %   MONTHLY Foreign Exchange Rates
#> 34:                              %   MONTHLY Foreign Exchange Rates
#> 35:                              %   MONTHLY Foreign Exchange Rates
#> 36:                              %   MONTHLY Foreign Exchange Rates
#> 37:  Deutsche Mark per U.S. Dollar   MONTHLY Foreign Exchange Rates
#> 38:           Euro per U.S. Dollar   MONTHLY Foreign Exchange Rates
#> 39: U.S. Dollar per Pound Sterling   MONTHLY Foreign Exchange Rates
#> 40:                   Yen per Euro   MONTHLY Foreign Exchange Rates
#> 41:          Yen per Deutsche Mark   MONTHLY Foreign Exchange Rates
#> 42:           Yen per French Franc   MONTHLY Foreign Exchange Rates
#> 43:    Yen per Netherlands Guilder   MONTHLY Foreign Exchange Rates
#> 44:      Yen per 100 Belgian Franc   MONTHLY Foreign Exchange Rates
#> 45:     Yen per Austrian Schilling   MONTHLY Foreign Exchange Rates
#> 46:       Yen per 100 Italian Lira   MONTHLY Foreign Exchange Rates
#> 47:      Yen per Portuguese Escudo   MONTHLY Foreign Exchange Rates
#> 48:         Yen per Spanish Peseta   MONTHLY Foreign Exchange Rates
#> 49:                  Yen per pound   MONTHLY Foreign Exchange Rates
#> 50:        Yen per Canadian Dollar   MONTHLY Foreign Exchange Rates
#> 51:            Yen per Swiss Franc   MONTHLY Foreign Exchange Rates
#> 52:          Yen per Swedish Krona   MONTHLY Foreign Exchange Rates
#> 53:           Yen per Danish Krone   MONTHLY Foreign Exchange Rates
#> 54:        Yen per Norwegian Krone   MONTHLY Foreign Exchange Rates
#> 55:        Yen per Ren Min Bi Yuan   MONTHLY Foreign Exchange Rates
#> 56:                Yen per 100 Won   MONTHLY Foreign Exchange Rates
#> 57:     Yen per Singaporean Dollar   MONTHLY Foreign Exchange Rates
#> 58:      Yen per Australian Dollar   MONTHLY Foreign Exchange Rates
#>                               unit frequency               category
#>                             <char>    <char>                 <char>
# }
```
