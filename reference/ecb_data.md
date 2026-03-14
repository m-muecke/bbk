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
#> 7022: 2026-03-09 D.USD.EUR.SP00.A 1.1555  daily
#> 7023: 2026-03-10 D.USD.EUR.SP00.A 1.1641  daily
#> 7024: 2026-03-11 D.USD.EUR.SP00.A 1.1581  daily
#> 7025: 2026-03-12 D.USD.EUR.SP00.A 1.1547  daily
#> 7026: 2026-03-13 D.USD.EUR.SP00.A 1.1476  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7022: US dollar/Euro ECB reference exchange rate
#> 7023: US dollar/Euro ECB reference exchange rate
#> 7024: US dollar/Euro ECB reference exchange rate
#> 7025: US dollar/Euro ECB reference exchange rate
#> 7026: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7022: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7023: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7024: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7025: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7026: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix collection decimals source_agency
#>               <char>   <char>     <char>     <char>   <char>        <char>
#>    1:            EUR     SP00          A          A        4           4F0
#>    2:            EUR     SP00          A          A        4           4F0
#>    3:            EUR     SP00          A          A        4           4F0
#>    4:            EUR     SP00          A          A        4           4F0
#>    5:            EUR     SP00          A          A        4           4F0
#>   ---                                                                     
#> 7022:            EUR     SP00          A          A        4           4F0
#> 7023:            EUR     SP00          A          A        4           4F0
#> 7024:            EUR     SP00          A          A        4           4F0
#> 7025:            EUR     SP00          A          A        4           4F0
#> 7026:            EUR     SP00          A          A        4           4F0
#>       time_format unit_mult unit_index_base   unit
#>            <char>    <char>          <char> <char>
#>    1:         P1D         0        99Q1=100    USD
#>    2:         P1D         0        99Q1=100    USD
#>    3:         P1D         0        99Q1=100    USD
#>    4:         P1D         0        99Q1=100    USD
#>    5:         P1D         0        99Q1=100    USD
#>   ---                                             
#> 7022:         P1D         0        99Q1=100    USD
#> 7023:         P1D         0        99Q1=100    USD
#> 7024:         P1D         0        99Q1=100    USD
#> 7025:         P1D         0        99Q1=100    USD
#> 7026:         P1D         0        99Q1=100    USD

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
#> 14048: 2026-03-09 D.USD.EUR.SP00.A   1.1555  daily
#> 14049: 2026-03-10 D.USD.EUR.SP00.A   1.1641  daily
#> 14050: 2026-03-11 D.USD.EUR.SP00.A   1.1581  daily
#> 14051: 2026-03-12 D.USD.EUR.SP00.A   1.1547  daily
#> 14052: 2026-03-13 D.USD.EUR.SP00.A   1.1476  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14048:    US dollar/Euro ECB reference exchange rate
#> 14049:    US dollar/Euro ECB reference exchange rate
#> 14050:    US dollar/Euro ECB reference exchange rate
#> 14051:    US dollar/Euro ECB reference exchange rate
#> 14052:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14048:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14049:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14050:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14051:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14052:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix decimals unit_mult   unit
#>          <char>         <char>   <char>     <char>   <char>    <char> <char>
#>     1:      JPY            EUR     SP00          A        2         0    JPY
#>     2:      JPY            EUR     SP00          A        2         0    JPY
#>     3:      JPY            EUR     SP00          A        2         0    JPY
#>     4:      JPY            EUR     SP00          A        2         0    JPY
#>     5:      JPY            EUR     SP00          A        2         0    JPY
#>    ---                                                                      
#> 14048:      USD            EUR     SP00          A        4         0    USD
#> 14049:      USD            EUR     SP00          A        4         0    USD
#> 14050:      USD            EUR     SP00          A        4         0    USD
#> 14051:      USD            EUR     SP00          A        4         0    USD
#> 14052:      USD            EUR     SP00          A        4         0    USD
#>        collection unit_index_base time_format source_agency
#>            <char>          <char>      <char>        <char>
#>     1:          A        99Q1=100         P1D           4F0
#>     2:          A        99Q1=100         P1D           4F0
#>     3:          A        99Q1=100         P1D           4F0
#>     4:          A        99Q1=100         P1D           4F0
#>     5:          A        99Q1=100         P1D           4F0
#>    ---                                                     
#> 14048:          A        99Q1=100         P1D           4F0
#> 14049:          A        99Q1=100         P1D           4F0
#> 14050:          A        99Q1=100         P1D           4F0
#> 14051:          A        99Q1=100         P1D           4F0
#> 14052:          A        99Q1=100         P1D           4F0
# }
```
