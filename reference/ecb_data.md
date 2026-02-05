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
#>             date              key  value   freq          title
#>           <Date>           <char>  <num> <char>         <char>
#>    1: 1999-01-04 D.USD.EUR.SP00.A 1.1789  daily US dollar/Euro
#>    2: 1999-01-05 D.USD.EUR.SP00.A 1.1790  daily US dollar/Euro
#>    3: 1999-01-06 D.USD.EUR.SP00.A 1.1743  daily US dollar/Euro
#>    4: 1999-01-07 D.USD.EUR.SP00.A 1.1632  daily US dollar/Euro
#>    5: 1999-01-08 D.USD.EUR.SP00.A 1.1659  daily US dollar/Euro
#>   ---                                                         
#> 6996: 2026-01-30 D.USD.EUR.SP00.A 1.1919  daily US dollar/Euro
#> 6997: 2026-02-02 D.USD.EUR.SP00.A 1.1840  daily US dollar/Euro
#> 6998: 2026-02-03 D.USD.EUR.SP00.A 1.1801  daily US dollar/Euro
#> 6999: 2026-02-04 D.USD.EUR.SP00.A 1.1820  daily US dollar/Euro
#> 7000: 2026-02-05 D.USD.EUR.SP00.A 1.1798  daily US dollar/Euro
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 6996: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6997: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6998: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 6999: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7000: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix unit_index_base unit_mult time_format
#>               <char>   <char>     <char>          <char>    <char>      <char>
#>    1:            EUR     SP00          A        99Q1=100         0         P1D
#>    2:            EUR     SP00          A        99Q1=100         0         P1D
#>    3:            EUR     SP00          A        99Q1=100         0         P1D
#>    4:            EUR     SP00          A        99Q1=100         0         P1D
#>    5:            EUR     SP00          A        99Q1=100         0         P1D
#>   ---                                                                         
#> 6996:            EUR     SP00          A        99Q1=100         0         P1D
#> 6997:            EUR     SP00          A        99Q1=100         0         P1D
#> 6998:            EUR     SP00          A        99Q1=100         0         P1D
#> 6999:            EUR     SP00          A        99Q1=100         0         P1D
#> 7000:            EUR     SP00          A        99Q1=100         0         P1D
#>       collection decimals   unit source_agency
#>           <char>   <char> <char>        <char>
#>    1:          A        4    USD           4F0
#>    2:          A        4    USD           4F0
#>    3:          A        4    USD           4F0
#>    4:          A        4    USD           4F0
#>    5:          A        4    USD           4F0
#>   ---                                         
#> 6996:          A        4    USD           4F0
#> 6997:          A        4    USD           4F0
#> 6998:          A        4    USD           4F0
#> 6999:          A        4    USD           4F0
#> 7000:          A        4    USD           4F0

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
#> 13996: 2026-01-30 D.USD.EUR.SP00.A   1.1919  daily    US dollar/Euro
#> 13997: 2026-02-02 D.USD.EUR.SP00.A   1.1840  daily    US dollar/Euro
#> 13998: 2026-02-03 D.USD.EUR.SP00.A   1.1801  daily    US dollar/Euro
#> 13999: 2026-02-04 D.USD.EUR.SP00.A   1.1820  daily    US dollar/Euro
#> 14000: 2026-02-05 D.USD.EUR.SP00.A   1.1798  daily    US dollar/Euro
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 13996:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13997:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13998:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 13999:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14000:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix time_format unit_index_base
#>          <char>         <char>   <char>     <char>      <char>          <char>
#>     1:      JPY            EUR     SP00          A         P1D        99Q1=100
#>     2:      JPY            EUR     SP00          A         P1D        99Q1=100
#>     3:      JPY            EUR     SP00          A         P1D        99Q1=100
#>     4:      JPY            EUR     SP00          A         P1D        99Q1=100
#>     5:      JPY            EUR     SP00          A         P1D        99Q1=100
#>    ---                                                                        
#> 13996:      USD            EUR     SP00          A         P1D        99Q1=100
#> 13997:      USD            EUR     SP00          A         P1D        99Q1=100
#> 13998:      USD            EUR     SP00          A         P1D        99Q1=100
#> 13999:      USD            EUR     SP00          A         P1D        99Q1=100
#> 14000:      USD            EUR     SP00          A         P1D        99Q1=100
#>        unit_mult   unit source_agency collection decimals
#>           <char> <char>        <char>     <char>   <char>
#>     1:         0    JPY           4F0          A        2
#>     2:         0    JPY           4F0          A        2
#>     3:         0    JPY           4F0          A        2
#>     4:         0    JPY           4F0          A        2
#>     5:         0    JPY           4F0          A        2
#>    ---                                                   
#> 13996:         0    USD           4F0          A        4
#> 13997:         0    USD           4F0          A        4
#> 13998:         0    USD           4F0          A        4
#> 13999:         0    USD           4F0          A        4
#> 14000:         0    USD           4F0          A        4
# }
```
