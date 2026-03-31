# Fetch Norges Bank (NoB) data

Retrieve time series data from the Norges Bank SDMX Web Service.

## Usage

``` r
nob_data(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL
)
```

## Source

<https://www.norges-bank.no/en/topics/Statistics/open-data/>

## Arguments

- flow:

  (`character(1)`)  
  The dataflow to query. See
  [`nob_metadata()`](https://m-muecke.github.io/bbk/reference/nob_metadata.md)
  for available dataflows.

- key:

  (`NULL` \| `character(1)`)  
  The series key to query using dot-separated dimension values (e.g.,
  `"B.USD.NOK.SP"`). Use `+` for multiple values in one dimension (e.g.,
  `"B.USD+EUR.NOK.SP"`). If `NULL`, all data for the flow is returned.
  Default `NULL`.

- start_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  Start date of the data (e.g., `"2024-01-01"` or `2024`). If `NULL`, no
  start date restriction is applied. Default `NULL`.

- end_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  End date of the data, in the same format as start_period. If `NULL`,
  no end date restriction is applied. Default `NULL`.

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
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
# fetch USD/NOK exchange rate
nob_data("EXR", "B.USD.NOK.SP", last_n = 5L)
#>          date          key  value   freq base_cur quote_cur  tenor
#>        <Date>       <char>  <num> <char>   <char>    <char> <char>
#> 1: 2026-03-24 B.USD.NOK.SP 9.7049  daily      USD       NOK     SP
#> 2: 2026-03-25 B.USD.NOK.SP 9.7356  daily      USD       NOK     SP
#> 3: 2026-03-26 B.USD.NOK.SP 9.6425  daily      USD       NOK     SP
#> 4: 2026-03-27 B.USD.NOK.SP 9.7148  daily      USD       NOK     SP
#> 5: 2026-03-30 B.USD.NOK.SP 9.7510  daily      USD       NOK     SP

# fetch multiple exchange rates
nob_data("EXR", "B.USD+EUR+GBP.NOK.SP", start_period = "2024-01-01")
#>             date          key   value   freq base_cur quote_cur  tenor
#>           <Date>       <char>   <num> <char>   <char>    <char> <char>
#>    1: 2024-01-02 B.USD.NOK.SP 10.2971  daily      USD       NOK     SP
#>    2: 2024-01-03 B.USD.NOK.SP 10.3672  daily      USD       NOK     SP
#>    3: 2024-01-04 B.USD.NOK.SP 10.3027  daily      USD       NOK     SP
#>    4: 2024-01-05 B.USD.NOK.SP 10.3553  daily      USD       NOK     SP
#>    5: 2024-01-08 B.USD.NOK.SP 10.3800  daily      USD       NOK     SP
#>   ---                                                                 
#> 1688: 2026-03-24 B.EUR.NOK.SP 11.2305  daily      EUR       NOK     SP
#> 1689: 2026-03-25 B.EUR.NOK.SP 11.2855  daily      EUR       NOK     SP
#> 1690: 2026-03-26 B.EUR.NOK.SP 11.1265  daily      EUR       NOK     SP
#> 1691: 2026-03-27 B.EUR.NOK.SP 11.1885  daily      EUR       NOK     SP
#> 1692: 2026-03-30 B.EUR.NOK.SP 11.1980  daily      EUR       NOK     SP

# fetch policy rate
nob_data("IR", last_n = 5L)
#>           date         key value    freq instrument_type  tenor unit_measure
#>         <Date>      <char> <num>  <char>          <char> <char>       <char>
#>  1: 1975-07-15 A.KPRA.SD.R  0.08  annual            KPRA     SD            R
#>  2: 1975-07-16 A.KPRA.SD.R  1.33  annual            KPRA     SD            R
#>  3: 1975-07-17 A.KPRA.SD.R  3.54  annual            KPRA     SD            R
#>  4: 1975-07-18 A.KPRA.SD.R  4.50  annual            KPRA     SD            R
#>  5: 1975-07-19 A.KPRA.SD.R  4.29  annual            KPRA     SD            R
#>  6: 2026-03-24 B.KPRA.OL.R  5.00   daily            KPRA     OL            R
#>  7: 2026-03-25 B.KPRA.OL.R  5.00   daily            KPRA     OL            R
#>  8: 2026-03-26 B.KPRA.OL.R  5.00   daily            KPRA     OL            R
#>  9: 2026-03-27 B.KPRA.OL.R  5.00   daily            KPRA     OL            R
#> 10: 2026-03-30 B.KPRA.OL.R  5.00   daily            KPRA     OL            R
#> 11: 2026-03-24 B.KPRA.SD.R  4.00   daily            KPRA     SD            R
#> 12: 2026-03-25 B.KPRA.SD.R  4.00   daily            KPRA     SD            R
#> 13: 2026-03-26 B.KPRA.SD.R  4.00   daily            KPRA     SD            R
#> 14: 2026-03-27 B.KPRA.SD.R  4.00   daily            KPRA     SD            R
#> 15: 2026-03-30 B.KPRA.SD.R  4.00   daily            KPRA     SD            R
#> 16: 2026-03-24 B.KPRA.RR.R  3.00   daily            KPRA     RR            R
#> 17: 2026-03-25 B.KPRA.RR.R  3.00   daily            KPRA     RR            R
#> 18: 2026-03-26 B.KPRA.RR.R  3.00   daily            KPRA     RR            R
#> 19: 2026-03-27 B.KPRA.RR.R  3.00   daily            KPRA     RR            R
#> 20: 2026-03-30 B.KPRA.RR.R  3.00   daily            KPRA     RR            R
#> 21: 2025-10-01 M.KPRA.OL.R  5.00 monthly            KPRA     OL            R
#> 22: 2025-11-01 M.KPRA.OL.R  5.00 monthly            KPRA     OL            R
#> 23: 2025-12-01 M.KPRA.OL.R  5.00 monthly            KPRA     OL            R
#> 24: 2026-01-01 M.KPRA.OL.R  5.00 monthly            KPRA     OL            R
#> 25: 2026-02-01 M.KPRA.OL.R  5.00 monthly            KPRA     OL            R
#> 26: 1975-07-15 A.KPRA.OL.R  1.08  annual            KPRA     OL            R
#> 27: 1975-07-16 A.KPRA.OL.R  2.33  annual            KPRA     OL            R
#> 28: 1975-07-17 A.KPRA.OL.R  4.54  annual            KPRA     OL            R
#> 29: 1975-07-18 A.KPRA.OL.R  5.50  annual            KPRA     OL            R
#> 30: 1975-07-19 A.KPRA.OL.R  5.29  annual            KPRA     OL            R
#> 31: 2025-10-01 M.KPRA.RR.R  3.00 monthly            KPRA     RR            R
#> 32: 2025-11-01 M.KPRA.RR.R  3.00 monthly            KPRA     RR            R
#> 33: 2025-12-01 M.KPRA.RR.R  3.00 monthly            KPRA     RR            R
#> 34: 2026-01-01 M.KPRA.RR.R  3.00 monthly            KPRA     RR            R
#> 35: 2026-02-01 M.KPRA.RR.R  3.00 monthly            KPRA     RR            R
#> 36: 1975-07-15 A.KPRA.RR.R -0.92  annual            KPRA     RR            R
#> 37: 1975-07-16 A.KPRA.RR.R  0.33  annual            KPRA     RR            R
#> 38: 1975-07-17 A.KPRA.RR.R  2.54  annual            KPRA     RR            R
#> 39: 1975-07-18 A.KPRA.RR.R  3.50  annual            KPRA     RR            R
#> 40: 1975-07-19 A.KPRA.RR.R  3.29  annual            KPRA     RR            R
#> 41: 2025-10-01 M.KPRA.SD.R  4.00 monthly            KPRA     SD            R
#> 42: 2025-11-01 M.KPRA.SD.R  4.00 monthly            KPRA     SD            R
#> 43: 2025-12-01 M.KPRA.SD.R  4.00 monthly            KPRA     SD            R
#> 44: 2026-01-01 M.KPRA.SD.R  4.00 monthly            KPRA     SD            R
#> 45: 2026-02-01 M.KPRA.SD.R  4.00 monthly            KPRA     SD            R
#>           date         key value    freq instrument_type  tenor unit_measure
#>         <Date>      <char> <num>  <char>          <char> <char>       <char>
# }
```
