# Fetch Banco de España (BdE) data

Retrieve time series data from the BdE statistics API.

## Usage

``` r
bde_data(key, time_range = NULL, lang = "en")
```

## Source

<https://www.bde.es/webbe/en/estadisticas/recursos/api-estadisticas-bde.html>

## Arguments

- key:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  The series keys to query.

- time_range:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  The time range for the data. Can be an annual range (e.g., `2024`) or
  a frequency-based code:

  - Daily frequency (D): `"3M"` (last 3 months), `"12M"`, `"36M"`

  - Monthly frequency (M): `"30M"`, `"60M"`, `"MAX"` (entire series)

  - Quarterly frequency (Q): `"30M"`, `"60M"`, `"MAX"`

  - Annual frequency (A): `"60M"`, `"MAX"`

  If `NULL` (default), returns the smallest range for the series
  frequency (e.g., `"30M"` for monthly series).

- lang:

  (`character(1)`)  
  Language to query, either `"en"` or `"es"`.

## Value

A
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
with the requested data.

## Details

You can search for the series codes in the
[BIEST](https://app.bde.es/bie_www/bie_wwwias/xml/Arranque.html)
application or in the tables published by the Banco de España.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
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
bde_data("D_1NBAF472", time_range = "30M")
#>                    date        key value   freq            title
#>                  <POSc>     <char> <num> <char>           <char>
#>  1: 2025-10-01 08:15:00 D_1NBAF472 2.187      M One-year Euribor
#>  2: 2025-09-01 08:15:00 D_1NBAF472 2.172      M One-year Euribor
#>  3: 2025-08-01 08:15:00 D_1NBAF472 2.114      M One-year Euribor
#>  4: 2025-07-01 08:15:00 D_1NBAF472 2.079      M One-year Euribor
#>  5: 2025-06-01 08:15:00 D_1NBAF472 2.081      M One-year Euribor
#>  6: 2025-05-01 08:15:00 D_1NBAF472 2.081      M One-year Euribor
#>  7: 2025-04-01 08:15:00 D_1NBAF472 2.143      M One-year Euribor
#>  8: 2025-03-01 09:15:00 D_1NBAF472 2.398      M One-year Euribor
#>  9: 2025-02-01 09:15:00 D_1NBAF472 2.407      M One-year Euribor
#> 10: 2025-01-01 09:15:00 D_1NBAF472 2.525      M One-year Euribor
#> 11: 2024-12-01 09:15:00 D_1NBAF472 2.436      M One-year Euribor
#> 12: 2024-11-01 09:15:00 D_1NBAF472 2.506      M One-year Euribor
#> 13: 2024-10-01 08:15:00 D_1NBAF472 2.691      M One-year Euribor
#> 14: 2024-09-01 08:15:00 D_1NBAF472 2.936      M One-year Euribor
#> 15: 2024-08-01 08:15:00 D_1NBAF472 3.166      M One-year Euribor
#> 16: 2024-07-01 08:15:00 D_1NBAF472 3.526      M One-year Euribor
#> 17: 2024-06-01 08:15:00 D_1NBAF472 3.650      M One-year Euribor
#> 18: 2024-05-01 08:15:00 D_1NBAF472 3.680      M One-year Euribor
#> 19: 2024-04-01 08:15:00 D_1NBAF472 3.703      M One-year Euribor
#> 20: 2024-03-01 09:15:00 D_1NBAF472 3.718      M One-year Euribor
#> 21: 2024-02-01 09:15:00 D_1NBAF472 3.671      M One-year Euribor
#> 22: 2024-01-01 09:15:00 D_1NBAF472 3.609      M One-year Euribor
#> 23: 2023-12-01 09:15:00 D_1NBAF472 3.679      M One-year Euribor
#> 24: 2023-11-01 09:15:00 D_1NBAF472 4.022      M One-year Euribor
#> 25: 2023-10-01 08:15:00 D_1NBAF472 4.160      M One-year Euribor
#> 26: 2023-09-01 08:15:00 D_1NBAF472 4.149      M One-year Euribor
#> 27: 2023-08-01 08:15:00 D_1NBAF472 4.073      M One-year Euribor
#> 28: 2023-07-01 08:15:00 D_1NBAF472 4.149      M One-year Euribor
#> 29: 2023-06-01 08:15:00 D_1NBAF472 4.007      M One-year Euribor
#> 30: 2023-05-01 08:15:00 D_1NBAF472 3.862      M One-year Euribor
#> 31: 2023-04-01 08:15:00 D_1NBAF472 3.757      M One-year Euribor
#>                    date        key value   freq            title
#>          description decimals symbol          start_date            end_date
#>               <char>    <int> <char>              <POSc>              <POSc>
#>  1: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#>  2: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#>  3: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#>  4: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#>  5: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#>  6: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#>  7: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#>  8: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#>  9: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 10: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 11: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 12: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 13: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 14: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 15: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 16: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 17: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 18: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 19: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 20: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 21: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 22: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 23: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 24: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 25: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 26: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 27: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 28: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 29: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 30: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#> 31: One-year Euribor        3      % 1999-01-01 09:15:00 2025-10-01 08:15:00
#>          description decimals symbol          start_date            end_date
#>                                                       long_description   unit
#>                                                                 <char> <char>
#>  1: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#>  2: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#>  3: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#>  4: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#>  5: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#>  6: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#>  7: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#>  8: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#>  9: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 10: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 11: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 12: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 13: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 14: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 15: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 16: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 17: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 18: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 19: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 20: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 21: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 22: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 23: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 24: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 25: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 26: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 27: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 28: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 29: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 30: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#> 31: Interest rates. Mortgage market reference rates. One-year Euribor.   Rate
#>                                                       long_description   unit
#>                                                                                                 source
#>                                                                                                 <char>
#>  1: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#>  2: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#>  3: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#>  4: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#>  5: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#>  6: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#>  7: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#>  8: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#>  9: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 10: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 11: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 12: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 13: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 14: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 15: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 16: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 17: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 18: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 19: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 20: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 21: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 22: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 23: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 24: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 25: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 26: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 27: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 28: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 29: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 30: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#> 31: EURIBOR European Banking Federation\nACI Asociación de Mercados Financieros\nBanco Central Europeo
#>                                                                                                 source
#>                                                                                                                                                                                                                 notes
#>                                                                                                                                                                                                                <char>
#>  1: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#>  2: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#>  3: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#>  4: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#>  5: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#>  6: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#>  7: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#>  8: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#>  9: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 10: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 11: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 12: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 13: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 14: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 15: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 16: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 17: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 18: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 19: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 20: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 21: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 22: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 23: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 24: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 25: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 26: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 27: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 28: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 29: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 30: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#> 31: Interbank deposit bid rates in the euro area, corresponding to 57 of the most active euro area banks.\nUntil December 1998, synthetic interest rates were calculated on the basis of GDP-weighted national rates.
#>                                                                                                                                                                                                                 notes
#>                                                                                                              related_series_pdf_table
#>                                                                                                                                <char>
#>  1: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#>  2: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#>  3: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#>  4: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#>  5: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#>  6: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#>  7: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#>  8: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#>  9: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 10: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 11: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 12: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 13: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 14: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 15: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 16: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 17: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 18: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 19: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 20: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 21: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 22: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 23: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 24: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 25: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 26: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 27: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 28: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 29: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 30: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#> 31: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1901e.pdf'>Download the pdf table with related series</a>
#>                                                                                                              related_series_pdf_table
#>                                                                                                                related_series_excel_file
#>                                                                                                                                   <char>
#>  1: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#>  2: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#>  3: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#>  4: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#>  5: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#>  6: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#>  7: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#>  8: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#>  9: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 10: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 11: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 12: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 13: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 14: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 15: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 16: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 17: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 18: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 19: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 20: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 21: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 22: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 23: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 24: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 25: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 26: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 27: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 28: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 29: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 30: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#> 31: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be1901.xlsx'>Download the Excel file with related series</a>
#>                                                                                                                related_series_excel_file
bde_data(c("DTNPDE2010_P0000P_PS_APU", "DTNSEC2010_S0000P_APU_SUMAMOVIL"), time_range = "MAX")
#>                     date                             key value   freq
#>                   <POSc>                          <char> <num> <char>
#>   1: 2025-04-01 08:15:00        DTNPDE2010_P0000P_PS_APU 103.4      Q
#>   2: 2025-01-01 09:15:00        DTNPDE2010_P0000P_PS_APU 103.4      Q
#>   3: 2024-10-01 08:15:00        DTNPDE2010_P0000P_PS_APU 101.6      Q
#>   4: 2024-07-01 08:15:00        DTNPDE2010_P0000P_PS_APU 104.2      Q
#>   5: 2024-04-01 08:15:00        DTNPDE2010_P0000P_PS_APU 105.2      Q
#>  ---                                                                 
#> 237: 1996-10-01 08:15:00 DTNSEC2010_S0000P_APU_SUMAMOVIL  -5.9      Q
#> 238: 1996-07-01 08:15:00 DTNSEC2010_S0000P_APU_SUMAMOVIL  -6.5      Q
#> 239: 1996-04-01 08:15:00 DTNSEC2010_S0000P_APU_SUMAMOVIL  -5.8      Q
#> 240: 1996-01-01 09:15:00 DTNSEC2010_S0000P_APU_SUMAMOVIL  -3.7      Q
#> 241: 1995-10-01 09:15:00 DTNSEC2010_S0000P_APU_SUMAMOVIL  -2.1      Q
#>                                          title
#>                                         <char>
#>   1: EDP debt. General government. % of GDP mp
#>   2: EDP debt. General government. % of GDP mp
#>   3: EDP debt. General government. % of GDP mp
#>   4: EDP debt. General government. % of GDP mp
#>   5: EDP debt. General government. % of GDP mp
#>  ---                                          
#> 237:            Deficit. Gen. Gov. % of GDP mp
#> 238:            Deficit. Gen. Gov. % of GDP mp
#> 239:            Deficit. Gen. Gov. % of GDP mp
#> 240:            Deficit. Gen. Gov. % of GDP mp
#> 241:            Deficit. Gen. Gov. % of GDP mp
#>                                                                                   description
#>                                                                                        <char>
#>   1:                           General government debt according to the EDP. Ratio over GDPmp
#>   2:                           General government debt according to the EDP. Ratio over GDPmp
#>   3:                           General government debt according to the EDP. Ratio over GDPmp
#>   4:                           General government debt according to the EDP. Ratio over GDPmp
#>   5:                           General government debt according to the EDP. Ratio over GDPmp
#>  ---                                                                                         
#> 237: General government deficit. Ratio over GDPmp. Cumulative figures for the last 4 quarters
#> 238: General government deficit. Ratio over GDPmp. Cumulative figures for the last 4 quarters
#> 239: General government deficit. Ratio over GDPmp. Cumulative figures for the last 4 quarters
#> 240: General government deficit. Ratio over GDPmp. Cumulative figures for the last 4 quarters
#> 241: General government deficit. Ratio over GDPmp. Cumulative figures for the last 4 quarters
#>      decimals symbol          start_date            end_date
#>         <int> <char>              <POSc>              <POSc>
#>   1:        1      % 1995-01-01 09:15:00 2025-04-01 08:15:00
#>   2:        1      % 1995-01-01 09:15:00 2025-04-01 08:15:00
#>   3:        1      % 1995-01-01 09:15:00 2025-04-01 08:15:00
#>   4:        1      % 1995-01-01 09:15:00 2025-04-01 08:15:00
#>   5:        1      % 1995-01-01 09:15:00 2025-04-01 08:15:00
#>  ---                                                        
#> 237:        1      % 1995-10-01 09:15:00 2025-04-01 08:15:00
#> 238:        1      % 1995-10-01 09:15:00 2025-04-01 08:15:00
#> 239:        1      % 1995-10-01 09:15:00 2025-04-01 08:15:00
#> 240:        1      % 1995-10-01 09:15:00 2025-04-01 08:15:00
#> 241:        1      % 1995-10-01 09:15:00 2025-04-01 08:15:00
#>                                                                                           long_description
#>                                                                                                     <char>
#>   1: General Government. Debt according to EDP. EDP debt. General Government. Ratio over cumulated GDP mp.
#>   2: General Government. Debt according to EDP. EDP debt. General Government. Ratio over cumulated GDP mp.
#>   3: General Government. Debt according to EDP. EDP debt. General Government. Ratio over cumulated GDP mp.
#>   4: General Government. Debt according to EDP. EDP debt. General Government. Ratio over cumulated GDP mp.
#>   5: General Government. Debt according to EDP. EDP debt. General Government. Ratio over cumulated GDP mp.
#>  ---                                                                                                      
#> 237:                    General Government. Deficit. Deficit. National total. Ratio over cumulated GDP mp.
#> 238:                    General Government. Deficit. Deficit. National total. Ratio over cumulated GDP mp.
#> 239:                    General Government. Deficit. Deficit. National total. Ratio over cumulated GDP mp.
#> 240:                    General Government. Deficit. Deficit. National total. Ratio over cumulated GDP mp.
#> 241:                    General Government. Deficit. Deficit. National total. Ratio over cumulated GDP mp.
#>        unit
#>      <char>
#>   1:   Rate
#>   2:   Rate
#>   3:   Rate
#>   4:   Rate
#>   5:   Rate
#>  ---       
#> 237:   Rate
#> 238:   Rate
#> 239:   Rate
#> 240:   Rate
#> 241:   Rate
#>                                                                              source
#>                                                                              <char>
#>   1:                                                                           <NA>
#>   2:                                                                           <NA>
#>   3:                                                                           <NA>
#>   4:                                                                           <NA>
#>   5:                                                                           <NA>
#>  ---                                                                               
#> 237: General Comptroller of the State Administration. National Statistics Institute
#> 238: General Comptroller of the State Administration. National Statistics Institute
#> 239: General Comptroller of the State Administration. National Statistics Institute
#> 240: General Comptroller of the State Administration. National Statistics Institute
#> 241: General Comptroller of the State Administration. National Statistics Institute
#>                                                                                                               related_series_pdf_table
#>                                                                                                                                 <char>
#>   1:                                                                                                                              <NA>
#>   2:                                                                                                                              <NA>
#>   3:                                                                                                                              <NA>
#>   4:                                                                                                                              <NA>
#>   5:                                                                                                                              <NA>
#>  ---                                                                                                                                  
#> 237: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1103e.pdf'>Download the pdf table with related series</a>
#> 238: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1103e.pdf'>Download the pdf table with related series</a>
#> 239: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1103e.pdf'>Download the pdf table with related series</a>
#> 240: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1103e.pdf'>Download the pdf table with related series</a>
#> 241: <a href='https://www.bde.es/webbe/en/estadisticas/compartido/datos/pdf/a1103e.pdf'>Download the pdf table with related series</a>
#>                                                                                                                related_series_excel_file
#>                                                                                                                                   <char>
#>   1:                                                                                                                                <NA>
#>   2:                                                                                                                                <NA>
#>   3:                                                                                                                                <NA>
#>   4:                                                                                                                                <NA>
#>   5:                                                                                                                                <NA>
#>  ---                                                                                                                                    
#> 237: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/a1103.xlsx'>Download the Excel file with related series</a>
#> 238: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/a1103.xlsx'>Download the Excel file with related series</a>
#> 239: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/a1103.xlsx'>Download the Excel file with related series</a>
#> 240: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/a1103.xlsx'>Download the Excel file with related series</a>
#> 241: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/a1103.xlsx'>Download the Excel file with related series</a>
bde_data("DEEQ.N.ES.W1.S1.S1.T.B.G._Z._Z._Z.EUR._T._X.N.ALL", time_range = 2024)
#>                   date                                               key  value
#>                 <POSc>                                            <char>  <int>
#> 1: 2024-10-01 08:15:00 DEEQ.N.ES.W1.S1.S1.T.B.G._Z._Z._Z.EUR._T._X.N.ALL -10713
#> 2: 2024-07-01 08:15:00 DEEQ.N.ES.W1.S1.S1.T.B.G._Z._Z._Z.EUR._T._X.N.ALL -10362
#> 3: 2024-04-01 08:15:00 DEEQ.N.ES.W1.S1.S1.T.B.G._Z._Z._Z.EUR._T._X.N.ALL  -6423
#> 4: 2024-01-01 09:15:00 DEEQ.N.ES.W1.S1.S1.T.B.G._Z._Z._Z.EUR._T._X.N.ALL  -6359
#>      freq     title        description decimals  symbol          start_date
#>    <char>    <char>             <char>    <int>  <char>              <POSc>
#> 1:      Q BP. Goods BP. Goods. Balance        0 M&euro; 1993-01-01 09:15:00
#> 2:      Q BP. Goods BP. Goods. Balance        0 M&euro; 1993-01-01 09:15:00
#> 3:      Q BP. Goods BP. Goods. Balance        0 M&euro; 1993-01-01 09:15:00
#> 4:      Q BP. Goods BP. Goods. Balance        0 M&euro; 1993-01-01 09:15:00
#>               end_date
#>                 <POSc>
#> 1: 2025-04-01 08:15:00
#> 2: 2025-04-01 08:15:00
#> 3: 2025-04-01 08:15:00
#> 4: 2025-04-01 08:15:00
#>                                                 long_description
#>                                                           <char>
#> 1: External statistics. Balance of payments. BP. Goods. Balance.
#> 2: External statistics. Balance of payments. BP. Goods. Balance.
#> 3: External statistics. Balance of payments. BP. Goods. Balance.
#> 4: External statistics. Balance of payments. BP. Goods. Balance.
#>                 unit        source
#>               <char>        <char>
#> 1: Millions of euros Bank of Spain
#> 2: Millions of euros Bank of Spain
#> 3: Millions of euros Bank of Spain
#> 4: Millions of euros Bank of Spain
#>                                                                                                             related_series_pdf_table
#>                                                                                                                               <char>
#> 1: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/pdf/a0206b.pdf'>Download the pdf table with related series</a>
#> 2: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/pdf/a0206b.pdf'>Download the pdf table with related series</a>
#> 3: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/pdf/a0206b.pdf'>Download the pdf table with related series</a>
#> 4: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/pdf/a0206b.pdf'>Download the pdf table with related series</a>
#>                                                                                                               related_series_excel_file
#>                                                                                                                                  <char>
#> 1: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be0206.xlsx'>Download the Excel file with related series</a>
#> 2: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be0206.xlsx'>Download the Excel file with related series</a>
#> 3: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be0206.xlsx'>Download the Excel file with related series</a>
#> 4: <a href='https://www.bde.es/webbe/es/estadisticas/compartido/datos/xlsx/be0206.xlsx'>Download the Excel file with related series</a>
# }
```
