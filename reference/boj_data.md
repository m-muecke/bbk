# Fetch Bank of Japan (BoJ) data

Retrieve time series data from the Bank of Japan Statistics API.

## Usage

``` r
boj_data(db, code, start_date = NULL, end_date = NULL, lang = "en")
```

## Source

<https://www.stat-search.boj.or.jp/ssi/html/nme_a_en.html>

## Arguments

- db:

  (`character(1)`)  
  The database code to query (e.g., `"FM08"` for foreign exchange
  rates). See the [API
  manual](https://www.stat-search.boj.or.jp/info/api_manual_en.pdf) for
  available databases.

- code:

  ([`character()`](https://rdrr.io/r/base/character.html))  
  One or more series codes to query (e.g., `"FXERD01"` for USD/JPY spot
  rate). Maximum 250 codes per request. All codes must have the same
  frequency. Use
  [`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md)
  to find available codes.

- start_date:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  Start date of the data. Format depends on frequency: `"YYYYMMDD"` or
  `YYYY` for daily, `"YYYYMM"` for monthly, `"YYYYQQ"` for quarterly
  (where QQ is 01-04), `"YYYY"` for annual. If `NULL`, all available
  data is returned. Default `NULL`.

- end_date:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  End date of the data, in the same format as start_date. If `NULL`,
  data up to the latest available date is returned. Default `NULL`.

- lang:

  (`character(1)`)  
  Language for series names, either `"en"` or `"jp"`. Default `"en"`.

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
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
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
# fetch USD/JPY exchange rate
boj_data("FM08", "FXERD01", start_date = "202401")
#>            date     key  value   freq
#>          <Date>  <char>  <num> <char>
#>   1: 2024-01-04 FXERD01 142.98  daily
#>   2: 2024-01-05 FXERD01 144.77  daily
#>   3: 2024-01-09 FXERD01 144.22  daily
#>   4: 2024-01-10 FXERD01 144.43  daily
#>   5: 2024-01-11 FXERD01 145.73  daily
#>  ---                                 
#> 562: 2026-04-22 FXERD01 159.37  daily
#> 563: 2026-04-23 FXERD01 159.49  daily
#> 564: 2026-04-24 FXERD01 159.76  daily
#> 565: 2026-04-27 FXERD01 159.58  daily
#> 566: 2026-04-28 FXERD01 159.36  daily
#>                                                      name                unit
#>                                                    <char>              <char>
#>   1: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>   2: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>   3: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>   4: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>   5: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>  ---                                                                         
#> 562: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#> 563: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#> 564: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#> 565: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#> 566: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar

# fetch multiple exchange rates
boj_data("FM08", c("FXERD01", "FXERD02"), start_date = "202401")
#>             date     key  value   freq
#>           <Date>  <char>  <num> <char>
#>    1: 2024-01-04 FXERD01 142.98  daily
#>    2: 2024-01-05 FXERD01 144.77  daily
#>    3: 2024-01-09 FXERD01 144.22  daily
#>    4: 2024-01-10 FXERD01 144.43  daily
#>    5: 2024-01-11 FXERD01 145.73  daily
#>   ---                                 
#> 1128: 2026-04-22 FXERD02 159.45  daily
#> 1129: 2026-04-23 FXERD02 159.70  daily
#> 1130: 2026-04-24 FXERD02 159.84  daily
#> 1131: 2026-04-27 FXERD02 159.60  daily
#> 1132: 2026-04-28 FXERD02 159.60  daily
#>                                                       name                unit
#>                                                     <char>              <char>
#>    1: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>    2: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>    3: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>    4: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>    5: US.Dollar/Yen Spot Rate at 9:00 in JST, Tokyo Market Yen per U.S. Dollar
#>   ---                                                                         
#> 1128:                  US.Dollar/Yen Highest, Tokyo Market Yen per U.S. Dollar
#> 1129:                  US.Dollar/Yen Highest, Tokyo Market Yen per U.S. Dollar
#> 1130:                  US.Dollar/Yen Highest, Tokyo Market Yen per U.S. Dollar
#> 1131:                  US.Dollar/Yen Highest, Tokyo Market Yen per U.S. Dollar
#> 1132:                  US.Dollar/Yen Highest, Tokyo Market Yen per U.S. Dollar
# }
```
