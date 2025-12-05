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

  ([`character()`](https://rdrr.io/r/base/character.html))  
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
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
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
#>             date              key  value   freq          title
#>           <Date>           <char>  <num> <char>         <char>
#>    1: 1999-01-04 D.USD.EUR.SP00.A 1.1789  daily US dollar/Euro
#>    2: 1999-01-05 D.USD.EUR.SP00.A 1.1790  daily US dollar/Euro
#>    3: 1999-01-06 D.USD.EUR.SP00.A 1.1743  daily US dollar/Euro
#>    4: 1999-01-07 D.USD.EUR.SP00.A 1.1632  daily US dollar/Euro
#>    5: 1999-01-08 D.USD.EUR.SP00.A 1.1659  daily US dollar/Euro
#>   ---                                                         
#> 6955: 2025-12-01 D.USD.EUR.SP00.A 1.1646  daily US dollar/Euro
#> 6956: 2025-12-02 D.USD.EUR.SP00.A 1.1614  daily US dollar/Euro
#> 6957: 2025-12-03 D.USD.EUR.SP00.A 1.1668  daily US dollar/Euro
#> 6958: 2025-12-04 D.USD.EUR.SP00.A 1.1666  daily US dollar/Euro
#> 6959: 2025-12-05 D.USD.EUR.SP00.A 1.1645  daily US dollar/Euro
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 6955: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6956: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6957: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6958: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6959: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix collection unit_index_base   unit
#>               <char>   <char>     <char>     <char>          <char> <char>
#>    1:            EUR     SP00          A          A        99Q1=100    USD
#>    2:            EUR     SP00          A          A        99Q1=100    USD
#>    3:            EUR     SP00          A          A        99Q1=100    USD
#>    4:            EUR     SP00          A          A        99Q1=100    USD
#>    5:            EUR     SP00          A          A        99Q1=100    USD
#>   ---                                                                     
#> 6955:            EUR     SP00          A          A        99Q1=100    USD
#> 6956:            EUR     SP00          A          A        99Q1=100    USD
#> 6957:            EUR     SP00          A          A        99Q1=100    USD
#> 6958:            EUR     SP00          A          A        99Q1=100    USD
#> 6959:            EUR     SP00          A          A        99Q1=100    USD
#>       time_format decimals unit_mult source_agency
#>            <char>   <char>    <char>        <char>
#>    1:         P1D        4         0           4F0
#>    2:         P1D        4         0           4F0
#>    3:         P1D        4         0           4F0
#>    4:         P1D        4         0           4F0
#>    5:         P1D        4         0           4F0
#>   ---                                             
#> 6955:         P1D        4         0           4F0
#> 6956:         P1D        4         0           4F0
#> 6957:         P1D        4         0           4F0
#> 6958:         P1D        4         0           4F0
#> 6959:         P1D        4         0           4F0

# fetch data for multiple keys
ecb_data("EXR", c("D.USD", "JPY.EUR.SP00.A"))
#>              date              key    value   freq             title
#>            <Date>           <char>    <num> <char>            <char>
#>     1: 1999-01-04 D.JPY.EUR.SP00.A 133.7300  daily Japanese yen/Euro
#>     2: 1999-01-05 D.JPY.EUR.SP00.A 130.9600  daily Japanese yen/Euro
#>     3: 1999-01-06 D.JPY.EUR.SP00.A 131.4200  daily Japanese yen/Euro
#>     4: 1999-01-07 D.JPY.EUR.SP00.A 129.4300  daily Japanese yen/Euro
#>     5: 1999-01-08 D.JPY.EUR.SP00.A 130.0900  daily Japanese yen/Euro
#>    ---                                                              
#> 13914: 2025-12-01 D.USD.EUR.SP00.A   1.1646  daily    US dollar/Euro
#> 13915: 2025-12-02 D.USD.EUR.SP00.A   1.1614  daily    US dollar/Euro
#> 13916: 2025-12-03 D.USD.EUR.SP00.A   1.1668  daily    US dollar/Euro
#> 13917: 2025-12-04 D.USD.EUR.SP00.A   1.1666  daily    US dollar/Euro
#> 13918: 2025-12-05 D.USD.EUR.SP00.A   1.1645  daily    US dollar/Euro
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 13914:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13915:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13916:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13917:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13918:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix time_format   unit decimals
#>          <char>         <char>   <char>     <char>      <char> <char>   <char>
#>     1:      JPY            EUR     SP00          A         P1D    JPY        2
#>     2:      JPY            EUR     SP00          A         P1D    JPY        2
#>     3:      JPY            EUR     SP00          A         P1D    JPY        2
#>     4:      JPY            EUR     SP00          A         P1D    JPY        2
#>     5:      JPY            EUR     SP00          A         P1D    JPY        2
#>    ---                                                                        
#> 13914:      USD            EUR     SP00          A         P1D    USD        4
#> 13915:      USD            EUR     SP00          A         P1D    USD        4
#> 13916:      USD            EUR     SP00          A         P1D    USD        4
#> 13917:      USD            EUR     SP00          A         P1D    USD        4
#> 13918:      USD            EUR     SP00          A         P1D    USD        4
#>        collection source_agency unit_index_base unit_mult
#>            <char>        <char>          <char>    <char>
#>     1:          A           4F0        99Q1=100         0
#>     2:          A           4F0        99Q1=100         0
#>     3:          A           4F0        99Q1=100         0
#>     4:          A           4F0        99Q1=100         0
#>     5:          A           4F0        99Q1=100         0
#>    ---                                                   
#> 13914:          A           4F0        99Q1=100         0
#> 13915:          A           4F0        99Q1=100         0
#> 13916:          A           4F0        99Q1=100         0
#> 13917:          A           4F0        99Q1=100         0
#> 13918:          A           4F0        99Q1=100         0
# }
```
