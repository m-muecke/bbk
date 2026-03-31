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
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
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
#> 7033: 2026-03-24 D.USD.EUR.SP00.A 1.1572  daily
#> 7034: 2026-03-25 D.USD.EUR.SP00.A 1.1592  daily
#> 7035: 2026-03-26 D.USD.EUR.SP00.A 1.1539  daily
#> 7036: 2026-03-27 D.USD.EUR.SP00.A 1.1517  daily
#> 7037: 2026-03-30 D.USD.EUR.SP00.A 1.1484  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7033: US dollar/Euro ECB reference exchange rate
#> 7034: US dollar/Euro ECB reference exchange rate
#> 7035: US dollar/Euro ECB reference exchange rate
#> 7036: US dollar/Euro ECB reference exchange rate
#> 7037: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7033: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7034: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7035: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7036: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7037: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix time_format collection source_agency
#>               <char>   <char>     <char>      <char>     <char>        <char>
#>    1:            EUR     SP00          A         P1D          A           4F0
#>    2:            EUR     SP00          A         P1D          A           4F0
#>    3:            EUR     SP00          A         P1D          A           4F0
#>    4:            EUR     SP00          A         P1D          A           4F0
#>    5:            EUR     SP00          A         P1D          A           4F0
#>   ---                                                                        
#> 7033:            EUR     SP00          A         P1D          A           4F0
#> 7034:            EUR     SP00          A         P1D          A           4F0
#> 7035:            EUR     SP00          A         P1D          A           4F0
#> 7036:            EUR     SP00          A         P1D          A           4F0
#> 7037:            EUR     SP00          A         P1D          A           4F0
#>       unit_mult   unit unit_index_base decimals
#>          <char> <char>          <char>   <char>
#>    1:         0    USD        99Q1=100        4
#>    2:         0    USD        99Q1=100        4
#>    3:         0    USD        99Q1=100        4
#>    4:         0    USD        99Q1=100        4
#>    5:         0    USD        99Q1=100        4
#>   ---                                          
#> 7033:         0    USD        99Q1=100        4
#> 7034:         0    USD        99Q1=100        4
#> 7035:         0    USD        99Q1=100        4
#> 7036:         0    USD        99Q1=100        4
#> 7037:         0    USD        99Q1=100        4

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
#> 14070: 2026-03-24 D.USD.EUR.SP00.A   1.1572  daily
#> 14071: 2026-03-25 D.USD.EUR.SP00.A   1.1592  daily
#> 14072: 2026-03-26 D.USD.EUR.SP00.A   1.1539  daily
#> 14073: 2026-03-27 D.USD.EUR.SP00.A   1.1517  daily
#> 14074: 2026-03-30 D.USD.EUR.SP00.A   1.1484  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14070:    US dollar/Euro ECB reference exchange rate
#> 14071:    US dollar/Euro ECB reference exchange rate
#> 14072:    US dollar/Euro ECB reference exchange rate
#> 14073:    US dollar/Euro ECB reference exchange rate
#> 14074:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14070:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14071:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14072:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14073:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14074:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix time_format source_agency
#>          <char>         <char>   <char>     <char>      <char>        <char>
#>     1:      JPY            EUR     SP00          A         P1D           4F0
#>     2:      JPY            EUR     SP00          A         P1D           4F0
#>     3:      JPY            EUR     SP00          A         P1D           4F0
#>     4:      JPY            EUR     SP00          A         P1D           4F0
#>     5:      JPY            EUR     SP00          A         P1D           4F0
#>    ---                                                                      
#> 14070:      USD            EUR     SP00          A         P1D           4F0
#> 14071:      USD            EUR     SP00          A         P1D           4F0
#> 14072:      USD            EUR     SP00          A         P1D           4F0
#> 14073:      USD            EUR     SP00          A         P1D           4F0
#> 14074:      USD            EUR     SP00          A         P1D           4F0
#>          unit collection decimals unit_index_base unit_mult
#>        <char>     <char>   <char>          <char>    <char>
#>     1:    JPY          A        2        99Q1=100         0
#>     2:    JPY          A        2        99Q1=100         0
#>     3:    JPY          A        2        99Q1=100         0
#>     4:    JPY          A        2        99Q1=100         0
#>     5:    JPY          A        2        99Q1=100         0
#>    ---                                                     
#> 14070:    USD          A        4        99Q1=100         0
#> 14071:    USD          A        4        99Q1=100         0
#> 14072:    USD          A        4        99Q1=100         0
#> 14073:    USD          A        4        99Q1=100         0
#> 14074:    USD          A        4        99Q1=100         0
# }
```
