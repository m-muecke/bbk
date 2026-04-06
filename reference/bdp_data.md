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
  Optional series IDs to filter the dataset.

- start_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  Start date of the data.

- end_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  End date of the data.

- last_n:

  (`NULL` \| `integer(1)`)  
  Return only the last `n` observations per series.

- lang:

  (`character(1)`)  
  Language for labels, either `"EN"` or `"PT"`.

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
#>           date      key      value   freq                     title status
#>         <Date>    <int>      <num> <char>                    <char> <char>
#>  1: 1953-12-31 12518356    328.036 annual GDP at market prices-CP-A      F
#>  2: 1954-12-31 12518356    347.818 annual GDP at market prices-CP-A      F
#>  3: 1955-12-31 12518356    363.537 annual GDP at market prices-CP-A      F
#>  4: 1956-12-31 12518356    388.512 annual GDP at market prices-CP-A      F
#>  5: 1957-12-31 12518356    412.789 annual GDP at market prices-CP-A      F
#>  6: 1958-12-31 12518356    439.733 annual GDP at market prices-CP-A      F
#>  7: 1959-12-31 12518356    466.725 annual GDP at market prices-CP-A      F
#>  8: 1960-12-31 12518356    493.923 annual GDP at market prices-CP-A      F
#>  9: 1961-12-31 12518356    516.075 annual GDP at market prices-CP-A      F
#> 10: 1962-12-31 12518356    577.390 annual GDP at market prices-CP-A      F
#> 11: 1963-12-31 12518356    597.435 annual GDP at market prices-CP-A      F
#> 12: 1964-12-31 12518356    649.418 annual GDP at market prices-CP-A      F
#> 13: 1965-12-31 12518356    756.280 annual GDP at market prices-CP-A      F
#> 14: 1966-12-31 12518356    810.459 annual GDP at market prices-CP-A      F
#> 15: 1967-12-31 12518356    907.105 annual GDP at market prices-CP-A      F
#> 16: 1968-12-31 12518356    979.622 annual GDP at market prices-CP-A      F
#> 17: 1969-12-31 12518356   1048.462 annual GDP at market prices-CP-A      F
#> 18: 1970-12-31 12518356   1186.648 annual GDP at market prices-CP-A      F
#> 19: 1971-12-31 12518356   1377.045 annual GDP at market prices-CP-A      F
#> 20: 1972-12-31 12518356   1624.357 annual GDP at market prices-CP-A      F
#> 21: 1973-12-31 12518356   1919.137 annual GDP at market prices-CP-A      F
#> 22: 1974-12-31 12518356   2279.085 annual GDP at market prices-CP-A      F
#> 23: 1975-12-31 12518356   2632.302 annual GDP at market prices-CP-A      F
#> 24: 1976-12-31 12518356   3160.122 annual GDP at market prices-CP-A      F
#> 25: 1977-12-31 12518356   4074.282 annual GDP at market prices-CP-A      F
#> 26: 1978-12-31 12518356   5039.270 annual GDP at market prices-CP-A      F
#> 27: 1979-12-31 12518356   6404.329 annual GDP at market prices-CP-A      F
#> 28: 1980-12-31 12518356   8356.818 annual GDP at market prices-CP-A      F
#> 29: 1981-12-31 12518356  10058.168 annual GDP at market prices-CP-A      F
#> 30: 1982-12-31 12518356  12146.983 annual GDP at market prices-CP-A      F
#> 31: 1983-12-31 12518356  15440.028 annual GDP at market prices-CP-A      F
#> 32: 1984-12-31 12518356  18948.920 annual GDP at market prices-CP-A      F
#> 33: 1985-12-31 12518356  23226.595 annual GDP at market prices-CP-A      F
#> 34: 1986-12-31 12518356  28332.521 annual GDP at market prices-CP-A      F
#> 35: 1987-12-31 12518356  33508.410 annual GDP at market prices-CP-A      F
#> 36: 1988-12-31 12518356  40045.842 annual GDP at market prices-CP-A      F
#> 37: 1989-12-31 12518356  47221.230 annual GDP at market prices-CP-A      F
#> 38: 1990-12-31 12518356  56691.911 annual GDP at market prices-CP-A      F
#> 39: 1991-12-31 12518356  65005.229 annual GDP at market prices-CP-A      F
#> 40: 1992-12-31 12518356  72957.492 annual GDP at market prices-CP-A      F
#> 41: 1993-12-31 12518356  76065.072 annual GDP at market prices-CP-A      F
#> 42: 1994-12-31 12518356  82468.675 annual GDP at market prices-CP-A      F
#> 43: 1995-12-31 12518356  89028.557 annual GDP at market prices-CP-A      F
#> 44: 1996-12-31 12518356  94351.591 annual GDP at market prices-CP-A      F
#> 45: 1997-12-31 12518356 102330.960 annual GDP at market prices-CP-A      F
#> 46: 1998-12-31 12518356 111353.381 annual GDP at market prices-CP-A      F
#> 47: 1999-12-31 12518356 119603.305 annual GDP at market prices-CP-A      F
#> 48: 2000-12-31 12518356 128414.445 annual GDP at market prices-CP-A      F
#> 49: 2001-12-31 12518356 135775.009 annual GDP at market prices-CP-A      F
#> 50: 2002-12-31 12518356 142554.263 annual GDP at market prices-CP-A      F
#> 51: 2003-12-31 12518356 146067.858 annual GDP at market prices-CP-A      F
#> 52: 2004-12-31 12518356 152248.388 annual GDP at market prices-CP-A      F
#> 53: 2005-12-31 12518356 158552.704 annual GDP at market prices-CP-A      F
#> 54: 2006-12-31 12518356 166260.469 annual GDP at market prices-CP-A      F
#> 55: 2007-12-31 12518356 175483.401 annual GDP at market prices-CP-A      F
#> 56: 2008-12-31 12518356 179102.781 annual GDP at market prices-CP-A      F
#> 57: 2009-12-31 12518356 175416.437 annual GDP at market prices-CP-A      F
#> 58: 2010-12-31 12518356 179860.351 annual GDP at market prices-CP-A      F
#> 59: 2011-12-31 12518356 176318.001 annual GDP at market prices-CP-A      F
#> 60: 2012-12-31 12518356 168538.750 annual GDP at market prices-CP-A      F
#> 61: 2013-12-31 12518356 170675.649 annual GDP at market prices-CP-A      F
#> 62: 2014-12-31 12518356 173186.662 annual GDP at market prices-CP-A      F
#> 63: 2015-12-31 12518356 179392.709 annual GDP at market prices-CP-A      F
#> 64: 2016-12-31 12518356 186380.749 annual GDP at market prices-CP-A      F
#> 65: 2017-12-31 12518356 195509.136 annual GDP at market prices-CP-A      F
#> 66: 2018-12-31 12518356 204997.646 annual GDP at market prices-CP-A      F
#> 67: 2019-12-31 12518356 214489.895 annual GDP at market prices-CP-A      F
#> 68: 2020-12-31 12518356 201032.705 annual GDP at market prices-CP-A      F
#> 69: 2021-12-31 12518356 216493.745 annual GDP at market prices-CP-A      F
#> 70: 2022-12-31 12518356 243957.086 annual GDP at market prices-CP-A      F
#> 71: 2023-12-31 12518356 270352.615 annual GDP at market prices-CP-A      F
#> 72: 2024-12-31 12518356 289427.973 annual GDP at market prices-CP-A      F
#>           date      key      value   freq                     title status
#>         <Date>    <int>      <num> <char>                    <char> <char>
# }
```
