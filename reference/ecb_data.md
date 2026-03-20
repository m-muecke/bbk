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
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
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
#> 7027: 2026-03-16 D.USD.EUR.SP00.A 1.1478  daily
#> 7028: 2026-03-17 D.USD.EUR.SP00.A 1.1531  daily
#> 7029: 2026-03-18 D.USD.EUR.SP00.A 1.1500  daily
#> 7030: 2026-03-19 D.USD.EUR.SP00.A 1.1489  daily
#> 7031: 2026-03-20 D.USD.EUR.SP00.A 1.1555  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7027: US dollar/Euro ECB reference exchange rate
#> 7028: US dollar/Euro ECB reference exchange rate
#> 7029: US dollar/Euro ECB reference exchange rate
#> 7030: US dollar/Euro ECB reference exchange rate
#> 7031: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7027: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7028: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7029: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7030: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7031: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix source_agency   unit decimals
#>               <char>   <char>     <char>        <char> <char>   <char>
#>    1:            EUR     SP00          A           4F0    USD        4
#>    2:            EUR     SP00          A           4F0    USD        4
#>    3:            EUR     SP00          A           4F0    USD        4
#>    4:            EUR     SP00          A           4F0    USD        4
#>    5:            EUR     SP00          A           4F0    USD        4
#>   ---                                                                 
#> 7027:            EUR     SP00          A           4F0    USD        4
#> 7028:            EUR     SP00          A           4F0    USD        4
#> 7029:            EUR     SP00          A           4F0    USD        4
#> 7030:            EUR     SP00          A           4F0    USD        4
#> 7031:            EUR     SP00          A           4F0    USD        4
#>       time_format collection unit_index_base unit_mult
#>            <char>     <char>          <char>    <char>
#>    1:         P1D          A        99Q1=100         0
#>    2:         P1D          A        99Q1=100         0
#>    3:         P1D          A        99Q1=100         0
#>    4:         P1D          A        99Q1=100         0
#>    5:         P1D          A        99Q1=100         0
#>   ---                                                 
#> 7027:         P1D          A        99Q1=100         0
#> 7028:         P1D          A        99Q1=100         0
#> 7029:         P1D          A        99Q1=100         0
#> 7030:         P1D          A        99Q1=100         0
#> 7031:         P1D          A        99Q1=100         0

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
#> 14058: 2026-03-16 D.USD.EUR.SP00.A   1.1478  daily
#> 14059: 2026-03-17 D.USD.EUR.SP00.A   1.1531  daily
#> 14060: 2026-03-18 D.USD.EUR.SP00.A   1.1500  daily
#> 14061: 2026-03-19 D.USD.EUR.SP00.A   1.1489  daily
#> 14062: 2026-03-20 D.USD.EUR.SP00.A   1.1555  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14058:    US dollar/Euro ECB reference exchange rate
#> 14059:    US dollar/Euro ECB reference exchange rate
#> 14060:    US dollar/Euro ECB reference exchange rate
#> 14061:    US dollar/Euro ECB reference exchange rate
#> 14062:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14058:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14059:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14060:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14061:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14062:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix time_format   unit
#>          <char>         <char>   <char>     <char>      <char> <char>
#>     1:      JPY            EUR     SP00          A         P1D    JPY
#>     2:      JPY            EUR     SP00          A         P1D    JPY
#>     3:      JPY            EUR     SP00          A         P1D    JPY
#>     4:      JPY            EUR     SP00          A         P1D    JPY
#>     5:      JPY            EUR     SP00          A         P1D    JPY
#>    ---                                                               
#> 14058:      USD            EUR     SP00          A         P1D    USD
#> 14059:      USD            EUR     SP00          A         P1D    USD
#> 14060:      USD            EUR     SP00          A         P1D    USD
#> 14061:      USD            EUR     SP00          A         P1D    USD
#> 14062:      USD            EUR     SP00          A         P1D    USD
#>        unit_index_base collection decimals unit_mult source_agency
#>                 <char>     <char>   <char>    <char>        <char>
#>     1:        99Q1=100          A        2         0           4F0
#>     2:        99Q1=100          A        2         0           4F0
#>     3:        99Q1=100          A        2         0           4F0
#>     4:        99Q1=100          A        2         0           4F0
#>     5:        99Q1=100          A        2         0           4F0
#>    ---                                                            
#> 14058:        99Q1=100          A        4         0           4F0
#> 14059:        99Q1=100          A        4         0           4F0
#> 14060:        99Q1=100          A        4         0           4F0
#> 14061:        99Q1=100          A        4         0           4F0
#> 14062:        99Q1=100          A        4         0           4F0
# }
```
