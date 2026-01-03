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
#> 6972: 2025-12-24 D.USD.EUR.SP00.A 1.1787  daily US dollar/Euro
#> 6973: 2025-12-29 D.USD.EUR.SP00.A 1.1766  daily US dollar/Euro
#> 6974: 2025-12-30 D.USD.EUR.SP00.A 1.1757  daily US dollar/Euro
#> 6975: 2025-12-31 D.USD.EUR.SP00.A 1.1750  daily US dollar/Euro
#> 6976: 2026-01-02 D.USD.EUR.SP00.A 1.1721  daily US dollar/Euro
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 6972: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6973: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6974: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6975: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6976: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix unit_index_base unit_mult time_format
#>               <char>   <char>     <char>          <char>    <char>      <char>
#>    1:            EUR     SP00          A        99Q1=100         0         P1D
#>    2:            EUR     SP00          A        99Q1=100         0         P1D
#>    3:            EUR     SP00          A        99Q1=100         0         P1D
#>    4:            EUR     SP00          A        99Q1=100         0         P1D
#>    5:            EUR     SP00          A        99Q1=100         0         P1D
#>   ---                                                                         
#> 6972:            EUR     SP00          A        99Q1=100         0         P1D
#> 6973:            EUR     SP00          A        99Q1=100         0         P1D
#> 6974:            EUR     SP00          A        99Q1=100         0         P1D
#> 6975:            EUR     SP00          A        99Q1=100         0         P1D
#> 6976:            EUR     SP00          A        99Q1=100         0         P1D
#>       source_agency   unit decimals collection
#>              <char> <char>   <char>     <char>
#>    1:           4F0    USD        4          A
#>    2:           4F0    USD        4          A
#>    3:           4F0    USD        4          A
#>    4:           4F0    USD        4          A
#>    5:           4F0    USD        4          A
#>   ---                                         
#> 6972:           4F0    USD        4          A
#> 6973:           4F0    USD        4          A
#> 6974:           4F0    USD        4          A
#> 6975:           4F0    USD        4          A
#> 6976:           4F0    USD        4          A

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
#> 13948: 2025-12-24 D.USD.EUR.SP00.A   1.1787  daily    US dollar/Euro
#> 13949: 2025-12-29 D.USD.EUR.SP00.A   1.1766  daily    US dollar/Euro
#> 13950: 2025-12-30 D.USD.EUR.SP00.A   1.1757  daily    US dollar/Euro
#> 13951: 2025-12-31 D.USD.EUR.SP00.A   1.1750  daily    US dollar/Euro
#> 13952: 2026-01-02 D.USD.EUR.SP00.A   1.1721  daily    US dollar/Euro
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 13948:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13949:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13950:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13951:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13952:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix unit_index_base decimals
#>          <char>         <char>   <char>     <char>          <char>   <char>
#>     1:      JPY            EUR     SP00          A        99Q1=100        2
#>     2:      JPY            EUR     SP00          A        99Q1=100        2
#>     3:      JPY            EUR     SP00          A        99Q1=100        2
#>     4:      JPY            EUR     SP00          A        99Q1=100        2
#>     5:      JPY            EUR     SP00          A        99Q1=100        2
#>    ---                                                                     
#> 13948:      USD            EUR     SP00          A        99Q1=100        4
#> 13949:      USD            EUR     SP00          A        99Q1=100        4
#> 13950:      USD            EUR     SP00          A        99Q1=100        4
#> 13951:      USD            EUR     SP00          A        99Q1=100        4
#> 13952:      USD            EUR     SP00          A        99Q1=100        4
#>        unit_mult source_agency   unit time_format collection
#>           <char>        <char> <char>      <char>     <char>
#>     1:         0           4F0    JPY         P1D          A
#>     2:         0           4F0    JPY         P1D          A
#>     3:         0           4F0    JPY         P1D          A
#>     4:         0           4F0    JPY         P1D          A
#>     5:         0           4F0    JPY         P1D          A
#>    ---                                                      
#> 13948:         0           4F0    USD         P1D          A
#> 13949:         0           4F0    USD         P1D          A
#> 13950:         0           4F0    USD         P1D          A
#> 13951:         0           4F0    USD         P1D          A
#> 13952:         0           4F0    USD         P1D          A
# }
```
