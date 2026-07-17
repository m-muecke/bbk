# Fetch European Central Bank (ECB) data

Retrieve time series data from the ECB SDMX Web Service.

## Usage

``` r
ecb_data(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL,
  updated_after = NULL
)
```

## Source

<https://data.ecb.europa.eu/help/api/data>

## Arguments

- flow:

  (`character(1)`)  
  Flow to query.

- key:

  (`NULL` \| [`character()`](https://rdrr.io/r/base/character.html))  
  The series keys to query.

- start_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  Start date of the data. Supported formats:

  - YYYY for annual data (e.g., `2019`)

  - YYYY-S\[1-2\] for semi-annual data (e.g., `"2019-S1"`)

  - YYYY-Q\[1-4\] for quarterly data (e.g., `"2019-Q1"`)

  - YYYY-MM for monthly data (e.g., `"2019-01"`)

  - YYYY-W\[01-53\] for weekly data (e.g., `"2019-W01"`)

  - YYYY-MM-DD for daily and business data (e.g., `"2019-01-01"`)

  If `NULL`, no start date restriction is applied (data retrieved from
  the earliest available date). Default `NULL`.

- end_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  End date of the data, in the same format as start_period. If `NULL`,
  no end date restriction is applied (data retrieved up to the most
  recent available date). Default `NULL`.

- first_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the start of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

- last_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the end of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

- updated_after:

  (`NULL` \| `character(1)` \| `Date(1)` \| `POSIXct(1)`)  
  Retrieve only observations updated after the given timestamp (e.g.,
  `"2024-06-01T00:00:00"`). Useful for incremental retrieval. If `NULL`,
  no restriction is applied. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

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
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_czeonia()`](https://m-muecke.github.io/bbk/reference/cnb_czeonia.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
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
# fetch US dollar/Euro exchange rate
ecb_data("EXR", "D.USD.EUR.SP00.A")
#>             date              key  value   freq
#>           <Date>           <char>  <num> <char>
#>    1: 1999-01-04 D.USD.EUR.SP00.A 1.1789  daily
#>    2: 1999-01-05 D.USD.EUR.SP00.A 1.1790  daily
#>    3: 1999-01-06 D.USD.EUR.SP00.A 1.1743  daily
#>    4: 1999-01-07 D.USD.EUR.SP00.A 1.1632  daily
#>    5: 1999-01-08 D.USD.EUR.SP00.A 1.1659  daily
#>   ---                                          
#> 7109: 2026-07-13 D.USD.EUR.SP00.A 1.1424  daily
#> 7110: 2026-07-14 D.USD.EUR.SP00.A 1.1405  daily
#> 7111: 2026-07-15 D.USD.EUR.SP00.A 1.1406  daily
#> 7112: 2026-07-16 D.USD.EUR.SP00.A 1.1467  daily
#> 7113: 2026-07-17 D.USD.EUR.SP00.A 1.1435  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7109: US dollar/Euro ECB reference exchange rate
#> 7110: US dollar/Euro ECB reference exchange rate
#> 7111: US dollar/Euro ECB reference exchange rate
#> 7112: US dollar/Euro ECB reference exchange rate
#> 7113: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7109: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7110: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7111: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7112: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7113: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix   unit collection decimals unit_mult
#>               <char>   <char>     <char> <char>     <char>   <char>    <char>
#>    1:            EUR     SP00          A    USD          A        4         0
#>    2:            EUR     SP00          A    USD          A        4         0
#>    3:            EUR     SP00          A    USD          A        4         0
#>    4:            EUR     SP00          A    USD          A        4         0
#>    5:            EUR     SP00          A    USD          A        4         0
#>   ---                                                                        
#> 7109:            EUR     SP00          A    USD          A        4         0
#> 7110:            EUR     SP00          A    USD          A        4         0
#> 7111:            EUR     SP00          A    USD          A        4         0
#> 7112:            EUR     SP00          A    USD          A        4         0
#> 7113:            EUR     SP00          A    USD          A        4         0
#>       time_format unit_index_base source_agency
#>            <char>          <char>        <char>
#>    1:         P1D        99Q1=100           4F0
#>    2:         P1D        99Q1=100           4F0
#>    3:         P1D        99Q1=100           4F0
#>    4:         P1D        99Q1=100           4F0
#>    5:         P1D        99Q1=100           4F0
#>   ---                                          
#> 7109:         P1D        99Q1=100           4F0
#> 7110:         P1D        99Q1=100           4F0
#> 7111:         P1D        99Q1=100           4F0
#> 7112:         P1D        99Q1=100           4F0
#> 7113:         P1D        99Q1=100           4F0

# fetch data for multiple keys
ecb_data("EXR", c("D.USD", "JPY.EUR.SP00.A"))
#>              date              key    value   freq
#>            <Date>           <char>    <num> <char>
#>     1: 1999-01-04 D.JPY.EUR.SP00.A 133.7300  daily
#>     2: 1999-01-05 D.JPY.EUR.SP00.A 130.9600  daily
#>     3: 1999-01-06 D.JPY.EUR.SP00.A 131.4200  daily
#>     4: 1999-01-07 D.JPY.EUR.SP00.A 129.4300  daily
#>     5: 1999-01-08 D.JPY.EUR.SP00.A 130.0900  daily
#>    ---                                            
#> 14222: 2026-07-13 D.USD.EUR.SP00.A   1.1424  daily
#> 14223: 2026-07-14 D.USD.EUR.SP00.A   1.1405  daily
#> 14224: 2026-07-15 D.USD.EUR.SP00.A   1.1406  daily
#> 14225: 2026-07-16 D.USD.EUR.SP00.A   1.1467  daily
#> 14226: 2026-07-17 D.USD.EUR.SP00.A   1.1435  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14222:    US dollar/Euro ECB reference exchange rate
#> 14223:    US dollar/Euro ECB reference exchange rate
#> 14224:    US dollar/Euro ECB reference exchange rate
#> 14225:    US dollar/Euro ECB reference exchange rate
#> 14226:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14222:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14223:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14224:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14225:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14226:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix collection unit_mult   unit
#>          <char>         <char>   <char>     <char>     <char>    <char> <char>
#>     1:      JPY            EUR     SP00          A          A         0    JPY
#>     2:      JPY            EUR     SP00          A          A         0    JPY
#>     3:      JPY            EUR     SP00          A          A         0    JPY
#>     4:      JPY            EUR     SP00          A          A         0    JPY
#>     5:      JPY            EUR     SP00          A          A         0    JPY
#>    ---                                                                        
#> 14222:      USD            EUR     SP00          A          A         0    USD
#> 14223:      USD            EUR     SP00          A          A         0    USD
#> 14224:      USD            EUR     SP00          A          A         0    USD
#> 14225:      USD            EUR     SP00          A          A         0    USD
#> 14226:      USD            EUR     SP00          A          A         0    USD
#>        decimals time_format unit_index_base source_agency
#>          <char>      <char>          <char>        <char>
#>     1:        2         P1D        99Q1=100           4F0
#>     2:        2         P1D        99Q1=100           4F0
#>     3:        2         P1D        99Q1=100           4F0
#>     4:        2         P1D        99Q1=100           4F0
#>     5:        2         P1D        99Q1=100           4F0
#>    ---                                                   
#> 14222:        4         P1D        99Q1=100           4F0
#> 14223:        4         P1D        99Q1=100           4F0
#> 14224:        4         P1D        99Q1=100           4F0
#> 14225:        4         P1D        99Q1=100           4F0
#> 14226:        4         P1D        99Q1=100           4F0
# }
```
