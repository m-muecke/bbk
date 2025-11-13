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
#> 6939: 2025-11-07 D.USD.EUR.SP00.A 1.1561  daily US dollar/Euro
#> 6940: 2025-11-10 D.USD.EUR.SP00.A 1.1571  daily US dollar/Euro
#> 6941: 2025-11-11 D.USD.EUR.SP00.A 1.1575  daily US dollar/Euro
#> 6942: 2025-11-12 D.USD.EUR.SP00.A 1.1576  daily US dollar/Euro
#> 6943: 2025-11-13 D.USD.EUR.SP00.A 1.1619  daily US dollar/Euro
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 6939: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6940: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6941: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6942: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6943: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix collection unit_mult   unit
#>               <char>   <char>     <char>     <char>    <char> <char>
#>    1:            EUR     SP00          A          A         0    USD
#>    2:            EUR     SP00          A          A         0    USD
#>    3:            EUR     SP00          A          A         0    USD
#>    4:            EUR     SP00          A          A         0    USD
#>    5:            EUR     SP00          A          A         0    USD
#>   ---                                                               
#> 6939:            EUR     SP00          A          A         0    USD
#> 6940:            EUR     SP00          A          A         0    USD
#> 6941:            EUR     SP00          A          A         0    USD
#> 6942:            EUR     SP00          A          A         0    USD
#> 6943:            EUR     SP00          A          A         0    USD
#>       time_format decimals source_agency unit_index_base
#>            <char>   <char>        <char>          <char>
#>    1:         P1D        4           4F0        99Q1=100
#>    2:         P1D        4           4F0        99Q1=100
#>    3:         P1D        4           4F0        99Q1=100
#>    4:         P1D        4           4F0        99Q1=100
#>    5:         P1D        4           4F0        99Q1=100
#>   ---                                                   
#> 6939:         P1D        4           4F0        99Q1=100
#> 6940:         P1D        4           4F0        99Q1=100
#> 6941:         P1D        4           4F0        99Q1=100
#> 6942:         P1D        4           4F0        99Q1=100
#> 6943:         P1D        4           4F0        99Q1=100

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
#> 13882: 2025-11-07 D.USD.EUR.SP00.A   1.1561  daily    US dollar/Euro
#> 13883: 2025-11-10 D.USD.EUR.SP00.A   1.1571  daily    US dollar/Euro
#> 13884: 2025-11-11 D.USD.EUR.SP00.A   1.1575  daily    US dollar/Euro
#> 13885: 2025-11-12 D.USD.EUR.SP00.A   1.1576  daily    US dollar/Euro
#> 13886: 2025-11-13 D.USD.EUR.SP00.A   1.1619  daily    US dollar/Euro
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 13882:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13883:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13884:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13885:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13886:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix time_format unit_mult   unit
#>          <char>         <char>   <char>     <char>      <char>    <char> <char>
#>     1:      JPY            EUR     SP00          A         P1D         0    JPY
#>     2:      JPY            EUR     SP00          A         P1D         0    JPY
#>     3:      JPY            EUR     SP00          A         P1D         0    JPY
#>     4:      JPY            EUR     SP00          A         P1D         0    JPY
#>     5:      JPY            EUR     SP00          A         P1D         0    JPY
#>    ---                                                                         
#> 13882:      USD            EUR     SP00          A         P1D         0    USD
#> 13883:      USD            EUR     SP00          A         P1D         0    USD
#> 13884:      USD            EUR     SP00          A         P1D         0    USD
#> 13885:      USD            EUR     SP00          A         P1D         0    USD
#> 13886:      USD            EUR     SP00          A         P1D         0    USD
#>        unit_index_base decimals source_agency collection
#>                 <char>   <char>        <char>     <char>
#>     1:        99Q1=100        2           4F0          A
#>     2:        99Q1=100        2           4F0          A
#>     3:        99Q1=100        2           4F0          A
#>     4:        99Q1=100        2           4F0          A
#>     5:        99Q1=100        2           4F0          A
#>    ---                                                  
#> 13882:        99Q1=100        4           4F0          A
#> 13883:        99Q1=100        4           4F0          A
#> 13884:        99Q1=100        4           4F0          A
#> 13885:        99Q1=100        4           4F0          A
#> 13886:        99Q1=100        4           4F0          A
# }
```
