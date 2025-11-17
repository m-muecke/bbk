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
#> 6940: 2025-11-10 D.USD.EUR.SP00.A 1.1571  daily US dollar/Euro
#> 6941: 2025-11-11 D.USD.EUR.SP00.A 1.1575  daily US dollar/Euro
#> 6942: 2025-11-12 D.USD.EUR.SP00.A 1.1576  daily US dollar/Euro
#> 6943: 2025-11-13 D.USD.EUR.SP00.A 1.1619  daily US dollar/Euro
#> 6944: 2025-11-14 D.USD.EUR.SP00.A 1.1648  daily US dollar/Euro
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 6940: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6941: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6942: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6943: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6944: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix time_format collection unit_index_base
#>               <char>   <char>     <char>      <char>     <char>          <char>
#>    1:            EUR     SP00          A         P1D          A        99Q1=100
#>    2:            EUR     SP00          A         P1D          A        99Q1=100
#>    3:            EUR     SP00          A         P1D          A        99Q1=100
#>    4:            EUR     SP00          A         P1D          A        99Q1=100
#>    5:            EUR     SP00          A         P1D          A        99Q1=100
#>   ---                                                                          
#> 6940:            EUR     SP00          A         P1D          A        99Q1=100
#> 6941:            EUR     SP00          A         P1D          A        99Q1=100
#> 6942:            EUR     SP00          A         P1D          A        99Q1=100
#> 6943:            EUR     SP00          A         P1D          A        99Q1=100
#> 6944:            EUR     SP00          A         P1D          A        99Q1=100
#>       unit_mult decimals source_agency   unit
#>          <char>   <char>        <char> <char>
#>    1:         0        4           4F0    USD
#>    2:         0        4           4F0    USD
#>    3:         0        4           4F0    USD
#>    4:         0        4           4F0    USD
#>    5:         0        4           4F0    USD
#>   ---                                        
#> 6940:         0        4           4F0    USD
#> 6941:         0        4           4F0    USD
#> 6942:         0        4           4F0    USD
#> 6943:         0        4           4F0    USD
#> 6944:         0        4           4F0    USD

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
#> 13884: 2025-11-10 D.USD.EUR.SP00.A   1.1571  daily    US dollar/Euro
#> 13885: 2025-11-11 D.USD.EUR.SP00.A   1.1575  daily    US dollar/Euro
#> 13886: 2025-11-12 D.USD.EUR.SP00.A   1.1576  daily    US dollar/Euro
#> 13887: 2025-11-13 D.USD.EUR.SP00.A   1.1619  daily    US dollar/Euro
#> 13888: 2025-11-14 D.USD.EUR.SP00.A   1.1648  daily    US dollar/Euro
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 13884:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13885:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13886:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13887:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13888:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix   unit collection unit_mult
#>          <char>         <char>   <char>     <char> <char>     <char>    <char>
#>     1:      JPY            EUR     SP00          A    JPY          A         0
#>     2:      JPY            EUR     SP00          A    JPY          A         0
#>     3:      JPY            EUR     SP00          A    JPY          A         0
#>     4:      JPY            EUR     SP00          A    JPY          A         0
#>     5:      JPY            EUR     SP00          A    JPY          A         0
#>    ---                                                                        
#> 13884:      USD            EUR     SP00          A    USD          A         0
#> 13885:      USD            EUR     SP00          A    USD          A         0
#> 13886:      USD            EUR     SP00          A    USD          A         0
#> 13887:      USD            EUR     SP00          A    USD          A         0
#> 13888:      USD            EUR     SP00          A    USD          A         0
#>        time_format source_agency decimals unit_index_base
#>             <char>        <char>   <char>          <char>
#>     1:         P1D           4F0        2        99Q1=100
#>     2:         P1D           4F0        2        99Q1=100
#>     3:         P1D           4F0        2        99Q1=100
#>     4:         P1D           4F0        2        99Q1=100
#>     5:         P1D           4F0        2        99Q1=100
#>    ---                                                   
#> 13884:         P1D           4F0        4        99Q1=100
#> 13885:         P1D           4F0        4        99Q1=100
#> 13886:         P1D           4F0        4        99Q1=100
#> 13887:         P1D           4F0        4        99Q1=100
#> 13888:         P1D           4F0        4        99Q1=100
# }
```
