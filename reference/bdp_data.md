# Fetch Banco de Portugal (BdP) data

Retrieve time series data from the BPstat API.

## Usage

``` r
bdp_data(
  domain_id,
  dataset_id,
  series_ids = NULL,
  start_date = NULL,
  end_date = NULL,
  last_n = NULL,
  updated_after = NULL,
  lang = "en"
)
```

## Source

<https://bpstat.bportugal.pt/data/docs>

## Arguments

- domain_id:

  (`integer(1)`)  
  The domain ID. Use
  [`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md)
  to list available domains.

- dataset_id:

  (`character(1)`)  
  The dataset ID within the domain.

- series_ids:

  (`NULL` \| [`integer()`](https://rdrr.io/r/base/integer.html))  
  Optional series IDs to filter the dataset. If `NULL`, every series in
  the dataset is returned.

- start_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  Start date of the data.

- end_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  End date of the data.

- last_n:

  (`NULL` \| `integer(1)`)  
  Return only the last `n` observations per series.

- updated_after:

  (`NULL` \| `character(1)` \| `Date(1)` \| `POSIXct(1)`)  
  Retrieve only observations published after the given timestamp (e.g.,
  `"2024-06-01T00:00:00"`). Useful for incremental retrieval. If `NULL`,
  no restriction is applied. Default `NULL`.

- lang:

  (`character(1)`)  
  Language for labels, either `"en"` or `"pt"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## Details

The BPstat API uses a two-step workflow: first look up the series
metadata with
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md)
to find the `domain_id` and `dataset_id`, then use those to fetch the
actual observations.

You can browse available series at the [BPstat
portal](https://bpstat.bportugal.pt).

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
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
# Portuguese GDP (annual, current prices)
bdp_data(54L, "ce3e4e50cda325537eff729ef64037cd", series_ids = 12518356L)
#>           date      key      value   freq
#>         <Date>    <int>      <num> <char>
#>  1: 1953-12-31 12518356    328.036 annual
#>  2: 1954-12-31 12518356    347.818 annual
#>  3: 1955-12-31 12518356    363.537 annual
#>  4: 1956-12-31 12518356    388.512 annual
#>  5: 1957-12-31 12518356    412.789 annual
#>  6: 1958-12-31 12518356    439.733 annual
#>  7: 1959-12-31 12518356    466.725 annual
#>  8: 1960-12-31 12518356    493.923 annual
#>  9: 1961-12-31 12518356    516.075 annual
#> 10: 1962-12-31 12518356    577.390 annual
#> 11: 1963-12-31 12518356    597.435 annual
#> 12: 1964-12-31 12518356    649.418 annual
#> 13: 1965-12-31 12518356    756.280 annual
#> 14: 1966-12-31 12518356    810.459 annual
#> 15: 1967-12-31 12518356    907.105 annual
#> 16: 1968-12-31 12518356    979.622 annual
#> 17: 1969-12-31 12518356   1048.462 annual
#> 18: 1970-12-31 12518356   1186.648 annual
#> 19: 1971-12-31 12518356   1377.045 annual
#> 20: 1972-12-31 12518356   1624.357 annual
#> 21: 1973-12-31 12518356   1919.137 annual
#> 22: 1974-12-31 12518356   2279.085 annual
#> 23: 1975-12-31 12518356   2632.302 annual
#> 24: 1976-12-31 12518356   3160.122 annual
#> 25: 1977-12-31 12518356   4074.282 annual
#> 26: 1978-12-31 12518356   5039.270 annual
#> 27: 1979-12-31 12518356   6404.329 annual
#> 28: 1980-12-31 12518356   8356.818 annual
#> 29: 1981-12-31 12518356  10058.168 annual
#> 30: 1982-12-31 12518356  12146.983 annual
#> 31: 1983-12-31 12518356  15440.028 annual
#> 32: 1984-12-31 12518356  18948.920 annual
#> 33: 1985-12-31 12518356  23226.595 annual
#> 34: 1986-12-31 12518356  28332.521 annual
#> 35: 1987-12-31 12518356  33508.410 annual
#> 36: 1988-12-31 12518356  40045.842 annual
#> 37: 1989-12-31 12518356  47221.230 annual
#> 38: 1990-12-31 12518356  56691.911 annual
#> 39: 1991-12-31 12518356  65005.229 annual
#> 40: 1992-12-31 12518356  72957.492 annual
#> 41: 1993-12-31 12518356  76065.072 annual
#> 42: 1994-12-31 12518356  82468.675 annual
#> 43: 1995-12-31 12518356  89028.557 annual
#> 44: 1996-12-31 12518356  94351.591 annual
#> 45: 1997-12-31 12518356 102330.960 annual
#> 46: 1998-12-31 12518356 111353.381 annual
#> 47: 1999-12-31 12518356 119603.305 annual
#> 48: 2000-12-31 12518356 128414.445 annual
#> 49: 2001-12-31 12518356 135775.009 annual
#> 50: 2002-12-31 12518356 142554.263 annual
#> 51: 2003-12-31 12518356 146067.858 annual
#> 52: 2004-12-31 12518356 152248.388 annual
#> 53: 2005-12-31 12518356 158552.704 annual
#> 54: 2006-12-31 12518356 166260.469 annual
#> 55: 2007-12-31 12518356 175483.401 annual
#> 56: 2008-12-31 12518356 179102.781 annual
#> 57: 2009-12-31 12518356 175416.437 annual
#> 58: 2010-12-31 12518356 179860.351 annual
#> 59: 2011-12-31 12518356 176318.001 annual
#> 60: 2012-12-31 12518356 168538.750 annual
#> 61: 2013-12-31 12518356 170675.649 annual
#> 62: 2014-12-31 12518356 173186.662 annual
#> 63: 2015-12-31 12518356 179392.709 annual
#> 64: 2016-12-31 12518356 186380.749 annual
#> 65: 2017-12-31 12518356 195509.136 annual
#> 66: 2018-12-31 12518356 204997.646 annual
#> 67: 2019-12-31 12518356 214489.895 annual
#> 68: 2020-12-31 12518356 201032.705 annual
#> 69: 2021-12-31 12518356 216493.745 annual
#> 70: 2022-12-31 12518356 243957.086 annual
#> 71: 2023-12-31 12518356 270352.615 annual
#> 72: 2024-12-31 12518356 289784.317 annual
#> 73: 2025-12-31 12518356 306765.485 annual
#>           date      key      value   freq
#>         <Date>    <int>      <num> <char>
#>                                              title status
#>                                             <char> <char>
#>  1: GDP at market prices (current prices) - annual      F
#>  2: GDP at market prices (current prices) - annual      F
#>  3: GDP at market prices (current prices) - annual      F
#>  4: GDP at market prices (current prices) - annual      F
#>  5: GDP at market prices (current prices) - annual      F
#>  6: GDP at market prices (current prices) - annual      F
#>  7: GDP at market prices (current prices) - annual      F
#>  8: GDP at market prices (current prices) - annual      F
#>  9: GDP at market prices (current prices) - annual      F
#> 10: GDP at market prices (current prices) - annual      F
#> 11: GDP at market prices (current prices) - annual      F
#> 12: GDP at market prices (current prices) - annual      F
#> 13: GDP at market prices (current prices) - annual      F
#> 14: GDP at market prices (current prices) - annual      F
#> 15: GDP at market prices (current prices) - annual      F
#> 16: GDP at market prices (current prices) - annual      F
#> 17: GDP at market prices (current prices) - annual      F
#> 18: GDP at market prices (current prices) - annual      F
#> 19: GDP at market prices (current prices) - annual      F
#> 20: GDP at market prices (current prices) - annual      F
#> 21: GDP at market prices (current prices) - annual      F
#> 22: GDP at market prices (current prices) - annual      F
#> 23: GDP at market prices (current prices) - annual      F
#> 24: GDP at market prices (current prices) - annual      F
#> 25: GDP at market prices (current prices) - annual      F
#> 26: GDP at market prices (current prices) - annual      F
#> 27: GDP at market prices (current prices) - annual      F
#> 28: GDP at market prices (current prices) - annual      F
#> 29: GDP at market prices (current prices) - annual      F
#> 30: GDP at market prices (current prices) - annual      F
#> 31: GDP at market prices (current prices) - annual      F
#> 32: GDP at market prices (current prices) - annual      F
#> 33: GDP at market prices (current prices) - annual      F
#> 34: GDP at market prices (current prices) - annual      F
#> 35: GDP at market prices (current prices) - annual      F
#> 36: GDP at market prices (current prices) - annual      F
#> 37: GDP at market prices (current prices) - annual      F
#> 38: GDP at market prices (current prices) - annual      F
#> 39: GDP at market prices (current prices) - annual      F
#> 40: GDP at market prices (current prices) - annual      F
#> 41: GDP at market prices (current prices) - annual      F
#> 42: GDP at market prices (current prices) - annual      F
#> 43: GDP at market prices (current prices) - annual      F
#> 44: GDP at market prices (current prices) - annual      F
#> 45: GDP at market prices (current prices) - annual      F
#> 46: GDP at market prices (current prices) - annual      F
#> 47: GDP at market prices (current prices) - annual      F
#> 48: GDP at market prices (current prices) - annual      F
#> 49: GDP at market prices (current prices) - annual      F
#> 50: GDP at market prices (current prices) - annual      F
#> 51: GDP at market prices (current prices) - annual      F
#> 52: GDP at market prices (current prices) - annual      F
#> 53: GDP at market prices (current prices) - annual      F
#> 54: GDP at market prices (current prices) - annual      F
#> 55: GDP at market prices (current prices) - annual      F
#> 56: GDP at market prices (current prices) - annual      F
#> 57: GDP at market prices (current prices) - annual      F
#> 58: GDP at market prices (current prices) - annual      F
#> 59: GDP at market prices (current prices) - annual      F
#> 60: GDP at market prices (current prices) - annual      F
#> 61: GDP at market prices (current prices) - annual      F
#> 62: GDP at market prices (current prices) - annual      F
#> 63: GDP at market prices (current prices) - annual      F
#> 64: GDP at market prices (current prices) - annual      F
#> 65: GDP at market prices (current prices) - annual      F
#> 66: GDP at market prices (current prices) - annual      F
#> 67: GDP at market prices (current prices) - annual      F
#> 68: GDP at market prices (current prices) - annual      F
#> 69: GDP at market prices (current prices) - annual      F
#> 70: GDP at market prices (current prices) - annual      F
#> 71: GDP at market prices (current prices) - annual      F
#> 72: GDP at market prices (current prices) - annual      F
#> 73: GDP at market prices (current prices) - annual      F
#>                                              title status
#>                                             <char> <char>

# several series at once
bdp_data(19L, "0da378eb4c39011fb7fb371c6623af8f", series_ids = c(12558817L, 12558819L))
#>            date      key    value    freq
#>          <Date>    <int>    <num>  <char>
#>   1: 1997-09-30 12558817    -68.0 monthly
#>   2: 1997-10-31 12558817    -54.0 monthly
#>   3: 1997-11-30 12558817    -96.0 monthly
#>   4: 1997-12-31 12558817    -94.0 monthly
#>   5: 1998-01-31 12558817    -64.0 monthly
#>  ---                                     
#> 694: 2026-05-31 12558819 155703.3 monthly
#> 695: 2026-06-30 12558819 155528.1 monthly
#> 696: 2026-07-31 12558819 156417.3 monthly
#> 697: 2026-08-31 12558819 156051.6 monthly
#> 698: 2026-09-30 12558819 156726.4 monthly
#>                                                                         title
#>                                                                        <char>
#>   1: PRT contribution for M3-Debt securities-Up to 2 years-Euro area-M€ (MFI)
#>   2: PRT contribution for M3-Debt securities-Up to 2 years-Euro area-M€ (MFI)
#>   3: PRT contribution for M3-Debt securities-Up to 2 years-Euro area-M€ (MFI)
#>   4: PRT contribution for M3-Debt securities-Up to 2 years-Euro area-M€ (MFI)
#>   5: PRT contribution for M3-Debt securities-Up to 2 years-Euro area-M€ (MFI)
#>  ---                                                                         
#> 694:         PRT contribution for M2-Oth dep-Up to 2 years-Euro area-M€ (MFI)
#> 695:         PRT contribution for M2-Oth dep-Up to 2 years-Euro area-M€ (MFI)
#> 696:         PRT contribution for M2-Oth dep-Up to 2 years-Euro area-M€ (MFI)
#> 697:         PRT contribution for M2-Oth dep-Up to 2 years-Euro area-M€ (MFI)
#> 698:         PRT contribution for M2-Oth dep-Up to 2 years-Euro area-M€ (MFI)
#>      status
#>      <char>
#>   1:      F
#>   2:      F
#>   3:      F
#>   4:      F
#>   5:      F
#>  ---       
#> 694:      F
#> 695:      F
#> 696:      F
#> 697:      F
#> 698:      F
# }
```
