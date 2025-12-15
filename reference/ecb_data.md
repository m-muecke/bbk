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
#> 6961: 2025-12-09 D.USD.EUR.SP00.A 1.1637  daily US dollar/Euro
#> 6962: 2025-12-10 D.USD.EUR.SP00.A 1.1634  daily US dollar/Euro
#> 6963: 2025-12-11 D.USD.EUR.SP00.A 1.1714  daily US dollar/Euro
#> 6964: 2025-12-12 D.USD.EUR.SP00.A 1.1731  daily US dollar/Euro
#> 6965: 2025-12-15 D.USD.EUR.SP00.A 1.1753  daily US dollar/Euro
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 6961: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6962: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6963: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6964: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6965: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix unit_index_base source_agency
#>               <char>   <char>     <char>          <char>        <char>
#>    1:            EUR     SP00          A        99Q1=100           4F0
#>    2:            EUR     SP00          A        99Q1=100           4F0
#>    3:            EUR     SP00          A        99Q1=100           4F0
#>    4:            EUR     SP00          A        99Q1=100           4F0
#>    5:            EUR     SP00          A        99Q1=100           4F0
#>   ---                                                                 
#> 6961:            EUR     SP00          A        99Q1=100           4F0
#> 6962:            EUR     SP00          A        99Q1=100           4F0
#> 6963:            EUR     SP00          A        99Q1=100           4F0
#> 6964:            EUR     SP00          A        99Q1=100           4F0
#> 6965:            EUR     SP00          A        99Q1=100           4F0
#>       unit_mult collection time_format decimals   unit
#>          <char>     <char>      <char>   <char> <char>
#>    1:         0          A         P1D        4    USD
#>    2:         0          A         P1D        4    USD
#>    3:         0          A         P1D        4    USD
#>    4:         0          A         P1D        4    USD
#>    5:         0          A         P1D        4    USD
#>   ---                                                 
#> 6961:         0          A         P1D        4    USD
#> 6962:         0          A         P1D        4    USD
#> 6963:         0          A         P1D        4    USD
#> 6964:         0          A         P1D        4    USD
#> 6965:         0          A         P1D        4    USD

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
#> 13926: 2025-12-09 D.USD.EUR.SP00.A   1.1637  daily    US dollar/Euro
#> 13927: 2025-12-10 D.USD.EUR.SP00.A   1.1634  daily    US dollar/Euro
#> 13928: 2025-12-11 D.USD.EUR.SP00.A   1.1714  daily    US dollar/Euro
#> 13929: 2025-12-12 D.USD.EUR.SP00.A   1.1731  daily    US dollar/Euro
#> 13930: 2025-12-15 D.USD.EUR.SP00.A   1.1753  daily    US dollar/Euro
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 13926:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13927:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13928:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13929:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13930:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix unit_index_base decimals
#>          <char>         <char>   <char>     <char>          <char>   <char>
#>     1:      JPY            EUR     SP00          A        99Q1=100        2
#>     2:      JPY            EUR     SP00          A        99Q1=100        2
#>     3:      JPY            EUR     SP00          A        99Q1=100        2
#>     4:      JPY            EUR     SP00          A        99Q1=100        2
#>     5:      JPY            EUR     SP00          A        99Q1=100        2
#>    ---                                                                     
#> 13926:      USD            EUR     SP00          A        99Q1=100        4
#> 13927:      USD            EUR     SP00          A        99Q1=100        4
#> 13928:      USD            EUR     SP00          A        99Q1=100        4
#> 13929:      USD            EUR     SP00          A        99Q1=100        4
#> 13930:      USD            EUR     SP00          A        99Q1=100        4
#>        time_format collection unit_mult   unit source_agency
#>             <char>     <char>    <char> <char>        <char>
#>     1:         P1D          A         0    JPY           4F0
#>     2:         P1D          A         0    JPY           4F0
#>     3:         P1D          A         0    JPY           4F0
#>     4:         P1D          A         0    JPY           4F0
#>     5:         P1D          A         0    JPY           4F0
#>    ---                                                      
#> 13926:         P1D          A         0    USD           4F0
#> 13927:         P1D          A         0    USD           4F0
#> 13928:         P1D          A         0    USD           4F0
#> 13929:         P1D          A         0    USD           4F0
#> 13930:         P1D          A         0    USD           4F0
# }
```
