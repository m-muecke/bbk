# Fetch Deutsche Bundesbank (BBk) data

Retrieve time series data from the Bundesbank SDMX Web Service.

## Usage

``` r
bbk_data(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL
)
```

## Source

<https://www.bundesbank.de/en/statistics/time-series-databases/help-for-sdmx-web-service/web-service-interface-data>

## Arguments

- flow:

  (`character(1)`)  
  The flow to query, 5-8 characters. See
  [`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md)
  for available dataflows.

- key:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  The series keys to query.

- start_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  The start date of the data. Supported formats:

  - YYYY for annual data (e.g., \`2019“)

  - YYYY-S\[1-2\] for semi-annual data (e.g., `"2019-S1"`)

  - YYYY-Q\[1-4\] for quarterly data (e.g., `"2019-Q1"`)

  - YYYY-MM for monthly data (e.g., `"2019-01"`)

  - YYYY-W\[01-53\] for weekly data (e.g., `"2019-W01"`)

  - YYYY-MM-DD for daily and business data (e.g., `"2019-01-01"`)

  If `NULL`, no start date restriction is applied (data retrieved from
  the earliest available date). Default `NULL`.

- end_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  The end date of the data, in the same format as start_period. If
  `NULL`, no end date restriction is applied (data retrieved up to the
  most recent available date). Default `NULL`.

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
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
with the requested data.

## See also

Other data:
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
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
# fetch all data for a given flow and key
data <- bbk_data("BBSIS", "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A")
head(data)
#>          date                                                   key value
#>        <Date>                                                <char> <num>
#> 1: 1997-08-07 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  5.76
#> 2: 1997-08-08 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  5.76
#> 3: 1997-08-11 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  5.75
#> 4: 1997-08-12 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  5.72
#> 5: 1997-08-13 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  5.77
#> 6: 1997-08-14 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  5.74
#>      freq
#>    <char>
#> 1:  daily
#> 2:  daily
#> 3:  daily
#> 4:  daily
#> 5:  daily
#> 6:  daily
#>                                                                                                                     title
#>                                                                                                                    <char>
#> 1: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 2: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 3: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 4: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 5: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 6: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#>    bearer_reg   item valuation currency issuer_class listed_sub security_class
#>        <char> <char>    <char>   <char>       <char>     <char>         <char>
#> 1:          I    ZAR        ZI      EUR        S1311          B           A604
#> 2:          I    ZAR        ZI      EUR        S1311          B           A604
#> 3:          I    ZAR        ZI      EUR        S1311          B           A604
#> 4:          I    ZAR        ZI      EUR        S1311          B           A604
#> 5:          I    ZAR        ZI      EUR        S1311          B           A604
#> 6:          I    ZAR        ZI      EUR        S1311          B           A604
#>    maturity interest_type interest_rate redemption certificate coverage rating
#>      <char>        <char>        <char>     <char>      <char>   <char> <char>
#> 1:    R10XX             R             A          A          _Z       _Z      A
#> 2:    R10XX             R             A          A          _Z       _Z      A
#> 3:    R10XX             R             A          A          _Z       _Z      A
#> 4:    R10XX             R             A          A          _Z       _Z      A
#> 5:    R10XX             R             A          A          _Z       _Z      A
#> 6:    R10XX             R             A          A          _Z       _Z      A
#>    time_format decimals    unit unit_mult category
#>         <char>    <int>  <char>    <char>   <char>
#> 1:         P1D        2 PROZENT         0     ZRZS
#> 2:         P1D        2 PROZENT         0     ZRZS
#> 3:         P1D        2 PROZENT         0     ZRZS
#> 4:         P1D        2 PROZENT         0     ZRZS
#> 5:         P1D        2 PROZENT         0     ZRZS
#> 6:         P1D        2 PROZENT         0     ZRZS

# fetch data for multiple keys
data <- bbk_data("BBEX3", c("M.ISK.EUR", "USD.CA.AC.A01"))
head(data)
#>          date                       key value    freq
#>        <Date>                    <char> <num>  <char>
#> 1: 1999-01-01 BBEX3.M.ISK.EUR.CA.AC.A01 79.74 monthly
#> 2: 1999-02-01 BBEX3.M.ISK.EUR.CA.AC.A01 79.61 monthly
#> 3: 1999-03-01 BBEX3.M.ISK.EUR.CA.AC.A01 78.07 monthly
#> 4: 1999-04-01 BBEX3.M.ISK.EUR.CA.AC.A01 77.92 monthly
#> 5: 1999-05-01 BBEX3.M.ISK.EUR.CA.AC.A01 77.88 monthly
#> 6: 1999-06-01 BBEX3.M.ISK.EUR.CA.AC.A01 76.95 monthly
#>                                                                title currency
#>                                                               <char>   <char>
#> 1: Exchange rates for the euro in Iceland / EUR 1 = ISK ... (middle)      ISK
#> 2: Exchange rates for the euro in Iceland / EUR 1 = ISK ... (middle)      ISK
#> 3: Exchange rates for the euro in Iceland / EUR 1 = ISK ... (middle)      ISK
#> 4: Exchange rates for the euro in Iceland / EUR 1 = ISK ... (middle)      ISK
#> 5: Exchange rates for the euro in Iceland / EUR 1 = ISK ... (middle)      ISK
#> 6: Exchange rates for the euro in Iceland / EUR 1 = ISK ... (middle)      ISK
#>    erx_partner_currency erx_series_type erx_rate_type erx_suffix time_format
#>                  <char>          <char>        <char>     <char>      <char>
#> 1:                  EUR              CA            AC        A01         P1M
#> 2:                  EUR              CA            AC        A01         P1M
#> 3:                  EUR              CA            AC        A01         P1M
#> 4:                  EUR              CA            AC        A01         P1M
#> 5:                  EUR              CA            AC        A01         P1M
#> 6:                  EUR              CA            AC        A01         P1M
#>    decimals   unit unit_mult category
#>       <int> <char>    <char>   <char>
#> 1:        2    ISK         0     WEDE
#> 2:        2    ISK         0     WEDE
#> 3:        2    ISK         0     WEDE
#> 4:        2    ISK         0     WEDE
#> 5:        2    ISK         0     WEDE
#> 6:        2    ISK         0     WEDE
#>                                                                                                                                      comm_gen_eng
#>                                                                                                                                            <char>
#> 1: Collapse of banking system and introduction of capital controls in October 2008, see Deutsche Bundesbank, Monthly Report, July 2010, pp 52-53.
#> 2: Collapse of banking system and introduction of capital controls in October 2008, see Deutsche Bundesbank, Monthly Report, July 2010, pp 52-53.
#> 3: Collapse of banking system and introduction of capital controls in October 2008, see Deutsche Bundesbank, Monthly Report, July 2010, pp 52-53.
#> 4: Collapse of banking system and introduction of capital controls in October 2008, see Deutsche Bundesbank, Monthly Report, July 2010, pp 52-53.
#> 5: Collapse of banking system and introduction of capital controls in October 2008, see Deutsche Bundesbank, Monthly Report, July 2010, pp 52-53.
#> 6: Collapse of banking system and introduction of capital controls in October 2008, see Deutsche Bundesbank, Monthly Report, July 2010, pp 52-53.
#>                                                             comm_meth_eng
#>                                                                    <char>
#> 1: Until March 2020, calculated on the basis of buying and selling rates.
#> 2: Until March 2020, calculated on the basis of buying and selling rates.
#> 3: Until March 2020, calculated on the basis of buying and selling rates.
#> 4: Until March 2020, calculated on the basis of buying and selling rates.
#> 5: Until March 2020, calculated on the basis of buying and selling rates.
#> 6: Until March 2020, calculated on the basis of buying and selling rates.
#>                      comm_src_eng
#>                            <char>
#> 1: Sedlabanki Islands, Reykjavik.
#> 2: Sedlabanki Islands, Reykjavik.
#> 3: Sedlabanki Islands, Reykjavik.
#> 4: Sedlabanki Islands, Reykjavik.
#> 5: Sedlabanki Islands, Reykjavik.
#> 6: Sedlabanki Islands, Reykjavik.

# specified period (start date-end date) for daily data
data <- bbk_data(
  "BBSIS", "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
  start_period = "2020-01-01",
  end_period = "2020-08-01"
)
head(data)
#>          date                                                   key value
#>        <Date>                                                <char> <num>
#> 1: 2020-01-02 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A -0.16
#> 2: 2020-01-03 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A -0.27
#> 3: 2020-01-06 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A -0.27
#> 4: 2020-01-07 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A -0.27
#> 5: 2020-01-08 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A -0.27
#> 6: 2020-01-09 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A -0.22
#>      freq
#>    <char>
#> 1:  daily
#> 2:  daily
#> 3:  daily
#> 4:  daily
#> 5:  daily
#> 6:  daily
#>                                                                                                                     title
#>                                                                                                                    <char>
#> 1: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 2: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 3: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 4: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 5: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 6: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#>    bearer_reg   item valuation currency issuer_class listed_sub security_class
#>        <char> <char>    <char>   <char>       <char>     <char>         <char>
#> 1:          I    ZAR        ZI      EUR        S1311          B           A604
#> 2:          I    ZAR        ZI      EUR        S1311          B           A604
#> 3:          I    ZAR        ZI      EUR        S1311          B           A604
#> 4:          I    ZAR        ZI      EUR        S1311          B           A604
#> 5:          I    ZAR        ZI      EUR        S1311          B           A604
#> 6:          I    ZAR        ZI      EUR        S1311          B           A604
#>    maturity interest_type interest_rate redemption certificate coverage rating
#>      <char>        <char>        <char>     <char>      <char>   <char> <char>
#> 1:    R10XX             R             A          A          _Z       _Z      A
#> 2:    R10XX             R             A          A          _Z       _Z      A
#> 3:    R10XX             R             A          A          _Z       _Z      A
#> 4:    R10XX             R             A          A          _Z       _Z      A
#> 5:    R10XX             R             A          A          _Z       _Z      A
#> 6:    R10XX             R             A          A          _Z       _Z      A
#>    time_format decimals    unit unit_mult category
#>         <char>    <int>  <char>    <char>   <char>
#> 1:         P1D        2 PROZENT         0     ZRZS
#> 2:         P1D        2 PROZENT         0     ZRZS
#> 3:         P1D        2 PROZENT         0     ZRZS
#> 4:         P1D        2 PROZENT         0     ZRZS
#> 5:         P1D        2 PROZENT         0     ZRZS
#> 6:         P1D        2 PROZENT         0     ZRZS

# or only specify the start date
data <- bbk_data(
  "BBSIS", "D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A",
  start_period = "2024-04-01"
)
head(data)
#>          date                                                   key value
#>        <Date>                                                <char> <num>
#> 1: 2024-04-02 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  2.37
#> 2: 2024-04-03 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  2.41
#> 3: 2024-04-04 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  2.39
#> 4: 2024-04-05 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  2.37
#> 5: 2024-04-08 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  2.46
#> 6: 2024-04-09 BBSIS.D.I.ZAR.ZI.EUR.S1311.B.A604.R10XX.R.A.A._Z._Z.A  2.42
#>      freq
#>    <char>
#> 1:  daily
#> 2:  daily
#> 3:  daily
#> 4:  daily
#> 5:  daily
#> 6:  daily
#>                                                                                                                     title
#>                                                                                                                    <char>
#> 1: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 2: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 3: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 4: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 5: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#> 6: Aus der Zinsstruktur abgeleitete Renditen für Bundeswertpapiere  mit jährl. Kuponzahlungen / RLZ 10 Jahre / Tageswerte
#>    bearer_reg   item valuation currency issuer_class listed_sub security_class
#>        <char> <char>    <char>   <char>       <char>     <char>         <char>
#> 1:          I    ZAR        ZI      EUR        S1311          B           A604
#> 2:          I    ZAR        ZI      EUR        S1311          B           A604
#> 3:          I    ZAR        ZI      EUR        S1311          B           A604
#> 4:          I    ZAR        ZI      EUR        S1311          B           A604
#> 5:          I    ZAR        ZI      EUR        S1311          B           A604
#> 6:          I    ZAR        ZI      EUR        S1311          B           A604
#>    maturity interest_type interest_rate redemption certificate coverage rating
#>      <char>        <char>        <char>     <char>      <char>   <char> <char>
#> 1:    R10XX             R             A          A          _Z       _Z      A
#> 2:    R10XX             R             A          A          _Z       _Z      A
#> 3:    R10XX             R             A          A          _Z       _Z      A
#> 4:    R10XX             R             A          A          _Z       _Z      A
#> 5:    R10XX             R             A          A          _Z       _Z      A
#> 6:    R10XX             R             A          A          _Z       _Z      A
#>    time_format decimals    unit unit_mult category
#>         <char>    <int>  <char>    <char>   <char>
#> 1:         P1D        2 PROZENT         0     ZRZS
#> 2:         P1D        2 PROZENT         0     ZRZS
#> 3:         P1D        2 PROZENT         0     ZRZS
#> 4:         P1D        2 PROZENT         0     ZRZS
#> 5:         P1D        2 PROZENT         0     ZRZS
#> 6:         P1D        2 PROZENT         0     ZRZS
# }
```
