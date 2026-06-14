# Fetch Swiss National Bank (SNB) table of contents

Retrieve the publication topic tree from the SNB data portal, listing
the cubes and charts available under each topic.

## Usage

``` r
snb_toc(lang = "en")
```

## Source

<https://data.snb.ch/en>

## Arguments

- lang:

  (`character(1)`)  
  Language to query, either `"en"` or `"de"`. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with one row per topic node and columns:

- topic_id:

  The top-level topic id

- topic:

  The top-level topic title

- sub_topic:

  The sub-topic title

- cube_id:

  The associated cube id (if any)

- chart_id:

  The associated chart id (if any)

- doc_id:

  The associated documentation id (if any)

## See also

Other metadata:
[`banxico_metadata()`](https://m-muecke.github.io/bbk/reference/banxico_metadata.md),
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bcb_currencies()`](https://m-muecke.github.io/bbk/reference/bcb_currencies.md),
[`bdf_dimension()`](https://m-muecke.github.io/bbk/reference/bdf_dimension.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
[`cnb_dimension()`](https://m-muecke.github.io/bbk/reference/cnb_dimension.md),
[`cnb_indicators()`](https://m-muecke.github.io/bbk/reference/cnb_indicators.md),
[`cnb_snapshots()`](https://m-muecke.github.io/bbk/reference/cnb_snapshots.md),
[`cnb_tree()`](https://m-muecke.github.io/bbk/reference/cnb_tree.md),
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
[`snb_metadata()`](https://m-muecke.github.io/bbk/reference/snb_metadata.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
snb_toc()
#>     topic_id                                              topic
#>       <char>                                             <char>
#>  1:      snb                                Swiss National Bank
#>  2:      snb                                Swiss National Bank
#>  3:      snb                                Swiss National Bank
#>  4:      snb                                Swiss National Bank
#>  5:      snb                                Swiss National Bank
#>  6:   banken                                              Banks
#>  7:   banken                                              Banks
#>  8:   banken                                              Banks
#>  9:   banken                                              Banks
#> 10:   banken                                              Banks
#> 11:   banken                                              Banks
#> 12:   banken                                              Banks
#> 13:   banken                                              Banks
#> 14:   banken                                              Banks
#> 15:   banken                                              Banks
#> 16:   banken                                              Banks
#> 17:   banken                                              Banks
#> 18:   banken                                              Banks
#> 19:  ziredev Interest rates, yields and foreign exchange market
#> 20:  ziredev Interest rates, yields and foreign exchange market
#> 21:  ziredev Interest rates, yields and foreign exchange market
#> 22:  ziredev Interest rates, yields and foreign exchange market
#> 23:  ziredev Interest rates, yields and foreign exchange market
#> 24:  ziredev Interest rates, yields and foreign exchange market
#> 25:  ziredev Interest rates, yields and foreign exchange market
#> 26:    finma            Capital market and payment transactions
#> 27:    finma            Capital market and payment transactions
#> 28:    finma            Capital market and payment transactions
#> 29:    finma            Capital market and payment transactions
#> 30:    finma            Capital market and payment transactions
#> 31:      uvo                             Swiss economic affairs
#> 32:      uvo                             Swiss economic affairs
#> 33:      uvo                             Swiss economic affairs
#> 34:      uvo                             Swiss economic affairs
#> 35:      uvo                             Swiss economic affairs
#> 36:      uvo                             Swiss economic affairs
#> 37:      uvo                             Swiss economic affairs
#> 38:      uvo                             Swiss economic affairs
#> 39:      uvo                             Swiss economic affairs
#> 40:      uvo                             Swiss economic affairs
#> 41:      uvo                             Swiss economic affairs
#> 42:      uvo                             Swiss economic affairs
#> 43:      uvo                             Swiss economic affairs
#> 44:      uvo                             Swiss economic affairs
#> 45:     aube                     International economic affairs
#> 46:     aube                     International economic affairs
#> 47:     aube                     International economic affairs
#> 48:     aube                     International economic affairs
#> 49:     aube                     International economic affairs
#> 50:     aube                     International economic affairs
#> 51:     aube                     International economic affairs
#> 52:     aube                     International economic affairs
#> 53:     aube                     International economic affairs
#> 54:     aube                     International economic affairs
#> 55:     aube                     International economic affairs
#> 56:     aube                     International economic affairs
#> 57:     aube                     International economic affairs
#> 58:    cross                        Cross-thematic publications
#>     topic_id                                              topic
#>       <char>                                             <char>
#>                                                     sub_topic         cube_id
#>                                                        <char>          <char>
#>  1:                                                     Notes            <NA>
#>  2:                                     Changes and revisions            <NA>
#>  3:                                   Key figures for the SNB         snbbipo
#>  4:                               Monetary base and liquidity            <NA>
#>  5:                                              Publications            <NA>
#>  6:                                                     Notes            <NA>
#>  7:                                     Changes and revisions            <NA>
#>  8:                                             Balance sheet            <NA>
#>  9:                                             Credit volume   bakredinausbm
#> 10:                                             New mortgages            <NA>
#> 11:              Outstanding derivative financial instruments            <NA>
#> 12:                                    Fiduciary transactions            <NA>
#> 13:                                          Income statement            <NA>
#> 14:                                           Structural data            <NA>
#> 15:              Securities holdings in bank custody accounts            <NA>
#> 16:                                           Regulatory data          bamire
#> 17:                      BIS International banking statistics bafovekreeinaus
#> 18:                                              Publications            <NA>
#> 19:                                                     Notes            <NA>
#> 20:                                     Changes and revisions            <NA>
#> 21:                                            Interest rates            <NA>
#> 22:                                     Yields on bond issues            <NA>
#> 23:                                   Foreign exchange market          devkum
#> 24:                  Foreign exchange and derivatives trading            <NA>
#> 25:                  Foreign exchange and derivatives trading            <NA>
#> 26:                                                     Notes            <NA>
#> 27:                                     Changes and revisions            <NA>
#> 28:                                            Capital market       capcollch
#> 29:                                      Payment transactions         zavesic
#> 30:                                              Publications            <NA>
#> 31:                                        Financial Accounts            <NA>
#> 32:                               Balance sheet of households            <NA>
#> 33:                Gross domestic product and national income            <NA>
#> 34:                                 Prices and salaries/wages            <NA>
#> 35:                                     Changes and revisions            <NA>
#> 36:                                        Financial Accounts            <NA>
#> 37:                               Balance sheet of households            <NA>
#> 38:                Gross domestic product and national income           gdpap
#> 39:                                               Consumption       conretail
#> 40:                            Order situation and production         indumem
#> 41:                                             Labour market      ambeschkla
#> 42:                                 Prices and salaries/wages          plkopr
#> 43:                                           Public finances          pubfin
#> 44:                                            Focus articles            <NA>
#> 45:                                             Foreign trade            <NA>
#> 46: Balance of payments and international investment position            <NA>
#> 47:                                         Direct investment            <NA>
#> 48: Operational data on multinational enterprises (AMNE/FATS)            <NA>
#> 49:                  Country, industry and sector definitions            <NA>
#> 50:                                     Changes and revisions            <NA>
#> 51:                                             Foreign trade      ausshawarm
#> 52:                                 Swiss balance of payments        bopoverq
#> 53:           Switzerland’s international investment position        auvekomq
#> 54:                                         Direct investment     fdiaustabsa
#> 55:             Operational data on multinational enterprises    opanmuauspbs
#> 56:                                  International indicators         iukpaus
#> 57:                                            Focus articles            <NA>
#> 58:                                             IMF SDDS Plus   sddssbs14710q
#>                                                     sub_topic         cube_id
#>                                                        <char>          <char>
#>           chart_id                      doc_id
#>             <char>                      <char>
#>  1:           <NA>            explanations_snb
#>  2:           <NA>               changerev_snb
#>  3:           <NA>                        <NA>
#>  4:    snbmobalech                        <NA>
#>  5:           <NA>                        <NA>
#>  6:           <NA>         explanations_banken
#>  7:           <NA>            changerev_banken
#>  8: babilentbgbach                        <NA>
#>  9:           <NA>                        <NA>
#> 10: bahypoakredqch                        <NA>
#> 11:    badefikvach                        <NA>
#> 12:   batreuhwbmch                        <NA>
#> 13: baerfentkouach                        <NA>
#> 14:   bastrazbbach                        <NA>
#> 15:   bawebekatmch                        <NA>
#> 16:           <NA>                        <NA>
#> 17:           <NA>                        <NA>
#> 18:           <NA>                        <NA>
#> 19:           <NA>        explanations_ziredev
#> 20:           <NA>           changerev_ziredev
#> 21:       zimomach                        <NA>
#> 22:  rendeidglfzch                        <NA>
#> 23:           <NA>                        <NA>
#> 24:     ddumfxirch                        <NA>
#> 25:           <NA>                   ddum_2025
#> 26:           <NA>          explanations_finma
#> 27:           <NA>             changerev_finma
#> 28:           <NA>                        <NA>
#> 29:           <NA>                        <NA>
#> 30:           <NA>                        <NA>
#> 31:           <NA>            explanations_fin
#> 32:           <NA>        explanations_fin_vph
#> 33:           <NA>        explanations_uvo_bip
#> 34:           <NA>         explanations_uvo_pl
#> 35:           <NA>               changerev_fin
#> 36:    frfidodgech                        <NA>
#> 37:  frsekgevehuch                        <NA>
#> 38:           <NA>                        <NA>
#> 39:           <NA>                        <NA>
#> 40:           <NA>                        <NA>
#> 41:           <NA>                        <NA>
#> 42:           <NA>                        <NA>
#> 43:           <NA>                        <NA>
#> 44:           <NA>              focus_20210429
#> 45:           <NA>      explanations_aube_auha
#> 46:           <NA> explanations_aube_bopauverm
#> 47:           <NA>       explanations_aube_fdi
#> 48:           <NA>      explanations_aube_amne
#> 49:           <NA>     explanations_aube_laend
#> 50:           <NA>              changerev_aube
#> 51:           <NA>                        <NA>
#> 52:           <NA>                        <NA>
#> 53:           <NA>                        <NA>
#> 54:           <NA>                        <NA>
#> 55:           <NA>                        <NA>
#> 56:           <NA>                        <NA>
#> 57:           <NA>              focus_20210531
#> 58:           <NA>                        <NA>
#>           chart_id                      doc_id
#>             <char>                      <char>
# }
```
