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
#> 7045: 2026-04-13 D.USD.EUR.SP00.A 1.1684  daily
#> 7046: 2026-04-14 D.USD.EUR.SP00.A 1.1793  daily
#> 7047: 2026-04-15 D.USD.EUR.SP00.A 1.1780  daily
#> 7048: 2026-04-16 D.USD.EUR.SP00.A 1.1782  daily
#> 7049: 2026-04-17 D.USD.EUR.SP00.A 1.1797  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7045: US dollar/Euro ECB reference exchange rate
#> 7046: US dollar/Euro ECB reference exchange rate
#> 7047: US dollar/Euro ECB reference exchange rate
#> 7048: US dollar/Euro ECB reference exchange rate
#> 7049: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7045: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7046: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7047: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7048: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7049: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix unit_mult decimals collection
#>               <char>   <char>     <char>    <char>   <char>     <char>
#>    1:            EUR     SP00          A         0        4          A
#>    2:            EUR     SP00          A         0        4          A
#>    3:            EUR     SP00          A         0        4          A
#>    4:            EUR     SP00          A         0        4          A
#>    5:            EUR     SP00          A         0        4          A
#>   ---                                                                 
#> 7045:            EUR     SP00          A         0        4          A
#> 7046:            EUR     SP00          A         0        4          A
#> 7047:            EUR     SP00          A         0        4          A
#> 7048:            EUR     SP00          A         0        4          A
#> 7049:            EUR     SP00          A         0        4          A
#>       source_agency unit_index_base   unit time_format
#>              <char>          <char> <char>      <char>
#>    1:           4F0        99Q1=100    USD         P1D
#>    2:           4F0        99Q1=100    USD         P1D
#>    3:           4F0        99Q1=100    USD         P1D
#>    4:           4F0        99Q1=100    USD         P1D
#>    5:           4F0        99Q1=100    USD         P1D
#>   ---                                                 
#> 7045:           4F0        99Q1=100    USD         P1D
#> 7046:           4F0        99Q1=100    USD         P1D
#> 7047:           4F0        99Q1=100    USD         P1D
#> 7048:           4F0        99Q1=100    USD         P1D
#> 7049:           4F0        99Q1=100    USD         P1D

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
#> 14094: 2026-04-13 D.USD.EUR.SP00.A   1.1684  daily
#> 14095: 2026-04-14 D.USD.EUR.SP00.A   1.1793  daily
#> 14096: 2026-04-15 D.USD.EUR.SP00.A   1.1780  daily
#> 14097: 2026-04-16 D.USD.EUR.SP00.A   1.1782  daily
#> 14098: 2026-04-17 D.USD.EUR.SP00.A   1.1797  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14094:    US dollar/Euro ECB reference exchange rate
#> 14095:    US dollar/Euro ECB reference exchange rate
#> 14096:    US dollar/Euro ECB reference exchange rate
#> 14097:    US dollar/Euro ECB reference exchange rate
#> 14098:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14094:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14095:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14096:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14097:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14098:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix time_format decimals
#>          <char>         <char>   <char>     <char>      <char>   <char>
#>     1:      JPY            EUR     SP00          A         P1D        2
#>     2:      JPY            EUR     SP00          A         P1D        2
#>     3:      JPY            EUR     SP00          A         P1D        2
#>     4:      JPY            EUR     SP00          A         P1D        2
#>     5:      JPY            EUR     SP00          A         P1D        2
#>    ---                                                                 
#> 14094:      USD            EUR     SP00          A         P1D        4
#> 14095:      USD            EUR     SP00          A         P1D        4
#> 14096:      USD            EUR     SP00          A         P1D        4
#> 14097:      USD            EUR     SP00          A         P1D        4
#> 14098:      USD            EUR     SP00          A         P1D        4
#>        source_agency   unit collection unit_index_base unit_mult
#>               <char> <char>     <char>          <char>    <char>
#>     1:           4F0    JPY          A        99Q1=100         0
#>     2:           4F0    JPY          A        99Q1=100         0
#>     3:           4F0    JPY          A        99Q1=100         0
#>     4:           4F0    JPY          A        99Q1=100         0
#>     5:           4F0    JPY          A        99Q1=100         0
#>    ---                                                          
#> 14094:           4F0    USD          A        99Q1=100         0
#> 14095:           4F0    USD          A        99Q1=100         0
#> 14096:           4F0    USD          A        99Q1=100         0
#> 14097:           4F0    USD          A        99Q1=100         0
#> 14098:           4F0    USD          A        99Q1=100         0
# }
```
