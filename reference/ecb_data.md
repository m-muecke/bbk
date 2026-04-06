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
#> 7036: 2026-03-27 D.USD.EUR.SP00.A 1.1517  daily
#> 7037: 2026-03-30 D.USD.EUR.SP00.A 1.1484  daily
#> 7038: 2026-03-31 D.USD.EUR.SP00.A 1.1498  daily
#> 7039: 2026-04-01 D.USD.EUR.SP00.A 1.1605  daily
#> 7040: 2026-04-02 D.USD.EUR.SP00.A 1.1525  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7036: US dollar/Euro ECB reference exchange rate
#> 7037: US dollar/Euro ECB reference exchange rate
#> 7038: US dollar/Euro ECB reference exchange rate
#> 7039: US dollar/Euro ECB reference exchange rate
#> 7040: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7036: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7037: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7038: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7039: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7040: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix unit_index_base   unit unit_mult
#>               <char>   <char>     <char>          <char> <char>    <char>
#>    1:            EUR     SP00          A        99Q1=100    USD         0
#>    2:            EUR     SP00          A        99Q1=100    USD         0
#>    3:            EUR     SP00          A        99Q1=100    USD         0
#>    4:            EUR     SP00          A        99Q1=100    USD         0
#>    5:            EUR     SP00          A        99Q1=100    USD         0
#>   ---                                                                    
#> 7036:            EUR     SP00          A        99Q1=100    USD         0
#> 7037:            EUR     SP00          A        99Q1=100    USD         0
#> 7038:            EUR     SP00          A        99Q1=100    USD         0
#> 7039:            EUR     SP00          A        99Q1=100    USD         0
#> 7040:            EUR     SP00          A        99Q1=100    USD         0
#>       time_format collection source_agency decimals
#>            <char>     <char>        <char>   <char>
#>    1:         P1D          A           4F0        4
#>    2:         P1D          A           4F0        4
#>    3:         P1D          A           4F0        4
#>    4:         P1D          A           4F0        4
#>    5:         P1D          A           4F0        4
#>   ---                                              
#> 7036:         P1D          A           4F0        4
#> 7037:         P1D          A           4F0        4
#> 7038:         P1D          A           4F0        4
#> 7039:         P1D          A           4F0        4
#> 7040:         P1D          A           4F0        4

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
#> 14076: 2026-03-27 D.USD.EUR.SP00.A   1.1517  daily
#> 14077: 2026-03-30 D.USD.EUR.SP00.A   1.1484  daily
#> 14078: 2026-03-31 D.USD.EUR.SP00.A   1.1498  daily
#> 14079: 2026-04-01 D.USD.EUR.SP00.A   1.1605  daily
#> 14080: 2026-04-02 D.USD.EUR.SP00.A   1.1525  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14076:    US dollar/Euro ECB reference exchange rate
#> 14077:    US dollar/Euro ECB reference exchange rate
#> 14078:    US dollar/Euro ECB reference exchange rate
#> 14079:    US dollar/Euro ECB reference exchange rate
#> 14080:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14076:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14077:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14078:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14079:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14080:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix collection time_format
#>          <char>         <char>   <char>     <char>     <char>      <char>
#>     1:      JPY            EUR     SP00          A          A         P1D
#>     2:      JPY            EUR     SP00          A          A         P1D
#>     3:      JPY            EUR     SP00          A          A         P1D
#>     4:      JPY            EUR     SP00          A          A         P1D
#>     5:      JPY            EUR     SP00          A          A         P1D
#>    ---                                                                   
#> 14076:      USD            EUR     SP00          A          A         P1D
#> 14077:      USD            EUR     SP00          A          A         P1D
#> 14078:      USD            EUR     SP00          A          A         P1D
#> 14079:      USD            EUR     SP00          A          A         P1D
#> 14080:      USD            EUR     SP00          A          A         P1D
#>        unit_index_base decimals   unit source_agency unit_mult
#>                 <char>   <char> <char>        <char>    <char>
#>     1:        99Q1=100        2    JPY           4F0         0
#>     2:        99Q1=100        2    JPY           4F0         0
#>     3:        99Q1=100        2    JPY           4F0         0
#>     4:        99Q1=100        2    JPY           4F0         0
#>     5:        99Q1=100        2    JPY           4F0         0
#>    ---                                                        
#> 14076:        99Q1=100        4    USD           4F0         0
#> 14077:        99Q1=100        4    USD           4F0         0
#> 14078:        99Q1=100        4    USD           4F0         0
#> 14079:        99Q1=100        4    USD           4F0         0
#> 14080:        99Q1=100        4    USD           4F0         0
# }
```
