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

  (`NULL` \| `character(1)`)  
  ISO 8601 timestamp to retrieve only observations updated after the
  given time (e.g., `"2024-06-01T00:00:00"`). If `NULL`, no restriction
  is applied. Default `NULL`.

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
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
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
#> 7052: 2026-04-22 D.USD.EUR.SP00.A 1.1733  daily
#> 7053: 2026-04-23 D.USD.EUR.SP00.A 1.1694  daily
#> 7054: 2026-04-24 D.USD.EUR.SP00.A 1.1712  daily
#> 7055: 2026-04-27 D.USD.EUR.SP00.A 1.1749  daily
#> 7056: 2026-04-28 D.USD.EUR.SP00.A 1.1680  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7052: US dollar/Euro ECB reference exchange rate
#> 7053: US dollar/Euro ECB reference exchange rate
#> 7054: US dollar/Euro ECB reference exchange rate
#> 7055: US dollar/Euro ECB reference exchange rate
#> 7056: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7052: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7053: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7054: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7055: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7056: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix unit_index_base   unit decimals
#>               <char>   <char>     <char>          <char> <char>   <char>
#>    1:            EUR     SP00          A        99Q1=100    USD        4
#>    2:            EUR     SP00          A        99Q1=100    USD        4
#>    3:            EUR     SP00          A        99Q1=100    USD        4
#>    4:            EUR     SP00          A        99Q1=100    USD        4
#>    5:            EUR     SP00          A        99Q1=100    USD        4
#>   ---                                                                   
#> 7052:            EUR     SP00          A        99Q1=100    USD        4
#> 7053:            EUR     SP00          A        99Q1=100    USD        4
#> 7054:            EUR     SP00          A        99Q1=100    USD        4
#> 7055:            EUR     SP00          A        99Q1=100    USD        4
#> 7056:            EUR     SP00          A        99Q1=100    USD        4
#>       source_agency collection time_format unit_mult
#>              <char>     <char>      <char>    <char>
#>    1:           4F0          A         P1D         0
#>    2:           4F0          A         P1D         0
#>    3:           4F0          A         P1D         0
#>    4:           4F0          A         P1D         0
#>    5:           4F0          A         P1D         0
#>   ---                                               
#> 7052:           4F0          A         P1D         0
#> 7053:           4F0          A         P1D         0
#> 7054:           4F0          A         P1D         0
#> 7055:           4F0          A         P1D         0
#> 7056:           4F0          A         P1D         0

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
#> 14108: 2026-04-22 D.USD.EUR.SP00.A   1.1733  daily
#> 14109: 2026-04-23 D.USD.EUR.SP00.A   1.1694  daily
#> 14110: 2026-04-24 D.USD.EUR.SP00.A   1.1712  daily
#> 14111: 2026-04-27 D.USD.EUR.SP00.A   1.1749  daily
#> 14112: 2026-04-28 D.USD.EUR.SP00.A   1.1680  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14108:    US dollar/Euro ECB reference exchange rate
#> 14109:    US dollar/Euro ECB reference exchange rate
#> 14110:    US dollar/Euro ECB reference exchange rate
#> 14111:    US dollar/Euro ECB reference exchange rate
#> 14112:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14108:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14109:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14110:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14111:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14112:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix unit_index_base
#>          <char>         <char>   <char>     <char>          <char>
#>     1:      JPY            EUR     SP00          A        99Q1=100
#>     2:      JPY            EUR     SP00          A        99Q1=100
#>     3:      JPY            EUR     SP00          A        99Q1=100
#>     4:      JPY            EUR     SP00          A        99Q1=100
#>     5:      JPY            EUR     SP00          A        99Q1=100
#>    ---                                                            
#> 14108:      USD            EUR     SP00          A        99Q1=100
#> 14109:      USD            EUR     SP00          A        99Q1=100
#> 14110:      USD            EUR     SP00          A        99Q1=100
#> 14111:      USD            EUR     SP00          A        99Q1=100
#> 14112:      USD            EUR     SP00          A        99Q1=100
#>        source_agency collection   unit time_format decimals unit_mult
#>               <char>     <char> <char>      <char>   <char>    <char>
#>     1:           4F0          A    JPY         P1D        2         0
#>     2:           4F0          A    JPY         P1D        2         0
#>     3:           4F0          A    JPY         P1D        2         0
#>     4:           4F0          A    JPY         P1D        2         0
#>     5:           4F0          A    JPY         P1D        2         0
#>    ---                                                               
#> 14108:           4F0          A    USD         P1D        4         0
#> 14109:           4F0          A    USD         P1D        4         0
#> 14110:           4F0          A    USD         P1D        4         0
#> 14111:           4F0          A    USD         P1D        4         0
#> 14112:           4F0          A    USD         P1D        4         0
# }
```
