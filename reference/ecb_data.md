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
#> 6982: 2026-01-12 D.USD.EUR.SP00.A 1.1692  daily US dollar/Euro
#> 6983: 2026-01-13 D.USD.EUR.SP00.A 1.1654  daily US dollar/Euro
#> 6984: 2026-01-14 D.USD.EUR.SP00.A 1.1651  daily US dollar/Euro
#> 6985: 2026-01-15 D.USD.EUR.SP00.A 1.1624  daily US dollar/Euro
#> 6986: 2026-01-16 D.USD.EUR.SP00.A 1.1617  daily US dollar/Euro
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 6982: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6983: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6984: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6985: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6986: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix source_agency   unit decimals
#>               <char>   <char>     <char>        <char> <char>   <char>
#>    1:            EUR     SP00          A           4F0    USD        4
#>    2:            EUR     SP00          A           4F0    USD        4
#>    3:            EUR     SP00          A           4F0    USD        4
#>    4:            EUR     SP00          A           4F0    USD        4
#>    5:            EUR     SP00          A           4F0    USD        4
#>   ---                                                                 
#> 6982:            EUR     SP00          A           4F0    USD        4
#> 6983:            EUR     SP00          A           4F0    USD        4
#> 6984:            EUR     SP00          A           4F0    USD        4
#> 6985:            EUR     SP00          A           4F0    USD        4
#> 6986:            EUR     SP00          A           4F0    USD        4
#>       unit_mult unit_index_base time_format collection
#>          <char>          <char>      <char>     <char>
#>    1:         0        99Q1=100         P1D          A
#>    2:         0        99Q1=100         P1D          A
#>    3:         0        99Q1=100         P1D          A
#>    4:         0        99Q1=100         P1D          A
#>    5:         0        99Q1=100         P1D          A
#>   ---                                                 
#> 6982:         0        99Q1=100         P1D          A
#> 6983:         0        99Q1=100         P1D          A
#> 6984:         0        99Q1=100         P1D          A
#> 6985:         0        99Q1=100         P1D          A
#> 6986:         0        99Q1=100         P1D          A

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
#> 13968: 2026-01-12 D.USD.EUR.SP00.A   1.1692  daily    US dollar/Euro
#> 13969: 2026-01-13 D.USD.EUR.SP00.A   1.1654  daily    US dollar/Euro
#> 13970: 2026-01-14 D.USD.EUR.SP00.A   1.1651  daily    US dollar/Euro
#> 13971: 2026-01-15 D.USD.EUR.SP00.A   1.1624  daily    US dollar/Euro
#> 13972: 2026-01-16 D.USD.EUR.SP00.A   1.1617  daily    US dollar/Euro
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 13968:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13969:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13970:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13971:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13972:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix unit_index_base
#>          <char>         <char>   <char>     <char>          <char>
#>     1:      JPY            EUR     SP00          A        99Q1=100
#>     2:      JPY            EUR     SP00          A        99Q1=100
#>     3:      JPY            EUR     SP00          A        99Q1=100
#>     4:      JPY            EUR     SP00          A        99Q1=100
#>     5:      JPY            EUR     SP00          A        99Q1=100
#>    ---                                                            
#> 13968:      USD            EUR     SP00          A        99Q1=100
#> 13969:      USD            EUR     SP00          A        99Q1=100
#> 13970:      USD            EUR     SP00          A        99Q1=100
#> 13971:      USD            EUR     SP00          A        99Q1=100
#> 13972:      USD            EUR     SP00          A        99Q1=100
#>        source_agency time_format decimals unit_mult   unit collection
#>               <char>      <char>   <char>    <char> <char>     <char>
#>     1:           4F0         P1D        2         0    JPY          A
#>     2:           4F0         P1D        2         0    JPY          A
#>     3:           4F0         P1D        2         0    JPY          A
#>     4:           4F0         P1D        2         0    JPY          A
#>     5:           4F0         P1D        2         0    JPY          A
#>    ---                                                               
#> 13968:           4F0         P1D        4         0    USD          A
#> 13969:           4F0         P1D        4         0    USD          A
#> 13970:           4F0         P1D        4         0    USD          A
#> 13971:           4F0         P1D        4         0    USD          A
#> 13972:           4F0         P1D        4         0    USD          A
# }
```
