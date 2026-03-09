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
  last_n = NULL
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

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md)

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
#> 7018: 2026-03-03 D.USD.EUR.SP00.A 1.1606  daily
#> 7019: 2026-03-04 D.USD.EUR.SP00.A 1.1649  daily
#> 7020: 2026-03-05 D.USD.EUR.SP00.A 1.1618  daily
#> 7021: 2026-03-06 D.USD.EUR.SP00.A 1.1561  daily
#> 7022: 2026-03-09 D.USD.EUR.SP00.A 1.1555  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7018: US dollar/Euro ECB reference exchange rate
#> 7019: US dollar/Euro ECB reference exchange rate
#> 7020: US dollar/Euro ECB reference exchange rate
#> 7021: US dollar/Euro ECB reference exchange rate
#> 7022: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7018: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7019: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7020: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7021: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7022: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix collection unit_index_base
#>               <char>   <char>     <char>     <char>          <char>
#>    1:            EUR     SP00          A          A        99Q1=100
#>    2:            EUR     SP00          A          A        99Q1=100
#>    3:            EUR     SP00          A          A        99Q1=100
#>    4:            EUR     SP00          A          A        99Q1=100
#>    5:            EUR     SP00          A          A        99Q1=100
#>   ---                                                              
#> 7018:            EUR     SP00          A          A        99Q1=100
#> 7019:            EUR     SP00          A          A        99Q1=100
#> 7020:            EUR     SP00          A          A        99Q1=100
#> 7021:            EUR     SP00          A          A        99Q1=100
#> 7022:            EUR     SP00          A          A        99Q1=100
#>       source_agency time_format unit_mult decimals   unit
#>              <char>      <char>    <char>   <char> <char>
#>    1:           4F0         P1D         0        4    USD
#>    2:           4F0         P1D         0        4    USD
#>    3:           4F0         P1D         0        4    USD
#>    4:           4F0         P1D         0        4    USD
#>    5:           4F0         P1D         0        4    USD
#>   ---                                                    
#> 7018:           4F0         P1D         0        4    USD
#> 7019:           4F0         P1D         0        4    USD
#> 7020:           4F0         P1D         0        4    USD
#> 7021:           4F0         P1D         0        4    USD
#> 7022:           4F0         P1D         0        4    USD

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
#> 14040: 2026-03-03 D.USD.EUR.SP00.A   1.1606  daily
#> 14041: 2026-03-04 D.USD.EUR.SP00.A   1.1649  daily
#> 14042: 2026-03-05 D.USD.EUR.SP00.A   1.1618  daily
#> 14043: 2026-03-06 D.USD.EUR.SP00.A   1.1561  daily
#> 14044: 2026-03-09 D.USD.EUR.SP00.A   1.1555  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14040:    US dollar/Euro ECB reference exchange rate
#> 14041:    US dollar/Euro ECB reference exchange rate
#> 14042:    US dollar/Euro ECB reference exchange rate
#> 14043:    US dollar/Euro ECB reference exchange rate
#> 14044:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14040:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14041:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14042:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14043:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14044:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix decimals unit_index_base
#>          <char>         <char>   <char>     <char>   <char>          <char>
#>     1:      JPY            EUR     SP00          A        2        99Q1=100
#>     2:      JPY            EUR     SP00          A        2        99Q1=100
#>     3:      JPY            EUR     SP00          A        2        99Q1=100
#>     4:      JPY            EUR     SP00          A        2        99Q1=100
#>     5:      JPY            EUR     SP00          A        2        99Q1=100
#>    ---                                                                     
#> 14040:      USD            EUR     SP00          A        4        99Q1=100
#> 14041:      USD            EUR     SP00          A        4        99Q1=100
#> 14042:      USD            EUR     SP00          A        4        99Q1=100
#> 14043:      USD            EUR     SP00          A        4        99Q1=100
#> 14044:      USD            EUR     SP00          A        4        99Q1=100
#>        time_format source_agency unit_mult   unit collection
#>             <char>        <char>    <char> <char>     <char>
#>     1:         P1D           4F0         0    JPY          A
#>     2:         P1D           4F0         0    JPY          A
#>     3:         P1D           4F0         0    JPY          A
#>     4:         P1D           4F0         0    JPY          A
#>     5:         P1D           4F0         0    JPY          A
#>    ---                                                      
#> 14040:         P1D           4F0         0    USD          A
#> 14041:         P1D           4F0         0    USD          A
#> 14042:         P1D           4F0         0    USD          A
#> 14043:         P1D           4F0         0    USD          A
#> 14044:         P1D           4F0         0    USD          A
# }
```
