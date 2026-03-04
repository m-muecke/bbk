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
#> 7014: 2026-02-25 D.USD.EUR.SP00.A 1.1784  daily
#> 7015: 2026-02-26 D.USD.EUR.SP00.A 1.1814  daily
#> 7016: 2026-02-27 D.USD.EUR.SP00.A 1.1805  daily
#> 7017: 2026-03-02 D.USD.EUR.SP00.A 1.1698  daily
#> 7018: 2026-03-03 D.USD.EUR.SP00.A 1.1606  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7014: US dollar/Euro ECB reference exchange rate
#> 7015: US dollar/Euro ECB reference exchange rate
#> 7016: US dollar/Euro ECB reference exchange rate
#> 7017: US dollar/Euro ECB reference exchange rate
#> 7018: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7014: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7015: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7016: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7017: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7018: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix   unit decimals unit_index_base
#>               <char>   <char>     <char> <char>   <char>          <char>
#>    1:            EUR     SP00          A    USD        4        99Q1=100
#>    2:            EUR     SP00          A    USD        4        99Q1=100
#>    3:            EUR     SP00          A    USD        4        99Q1=100
#>    4:            EUR     SP00          A    USD        4        99Q1=100
#>    5:            EUR     SP00          A    USD        4        99Q1=100
#>   ---                                                                   
#> 7014:            EUR     SP00          A    USD        4        99Q1=100
#> 7015:            EUR     SP00          A    USD        4        99Q1=100
#> 7016:            EUR     SP00          A    USD        4        99Q1=100
#> 7017:            EUR     SP00          A    USD        4        99Q1=100
#> 7018:            EUR     SP00          A    USD        4        99Q1=100
#>       unit_mult time_format collection source_agency
#>          <char>      <char>     <char>        <char>
#>    1:         0         P1D          A           4F0
#>    2:         0         P1D          A           4F0
#>    3:         0         P1D          A           4F0
#>    4:         0         P1D          A           4F0
#>    5:         0         P1D          A           4F0
#>   ---                                               
#> 7014:         0         P1D          A           4F0
#> 7015:         0         P1D          A           4F0
#> 7016:         0         P1D          A           4F0
#> 7017:         0         P1D          A           4F0
#> 7018:         0         P1D          A           4F0

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
#> 14032: 2026-02-25 D.USD.EUR.SP00.A   1.1784  daily
#> 14033: 2026-02-26 D.USD.EUR.SP00.A   1.1814  daily
#> 14034: 2026-02-27 D.USD.EUR.SP00.A   1.1805  daily
#> 14035: 2026-03-02 D.USD.EUR.SP00.A   1.1698  daily
#> 14036: 2026-03-03 D.USD.EUR.SP00.A   1.1606  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14032:    US dollar/Euro ECB reference exchange rate
#> 14033:    US dollar/Euro ECB reference exchange rate
#> 14034:    US dollar/Euro ECB reference exchange rate
#> 14035:    US dollar/Euro ECB reference exchange rate
#> 14036:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14032:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14033:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14034:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14035:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14036:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix collection unit_mult
#>          <char>         <char>   <char>     <char>     <char>    <char>
#>     1:      JPY            EUR     SP00          A          A         0
#>     2:      JPY            EUR     SP00          A          A         0
#>     3:      JPY            EUR     SP00          A          A         0
#>     4:      JPY            EUR     SP00          A          A         0
#>     5:      JPY            EUR     SP00          A          A         0
#>    ---                                                                 
#> 14032:      USD            EUR     SP00          A          A         0
#> 14033:      USD            EUR     SP00          A          A         0
#> 14034:      USD            EUR     SP00          A          A         0
#> 14035:      USD            EUR     SP00          A          A         0
#> 14036:      USD            EUR     SP00          A          A         0
#>        decimals   unit time_format source_agency unit_index_base
#>          <char> <char>      <char>        <char>          <char>
#>     1:        2    JPY         P1D           4F0        99Q1=100
#>     2:        2    JPY         P1D           4F0        99Q1=100
#>     3:        2    JPY         P1D           4F0        99Q1=100
#>     4:        2    JPY         P1D           4F0        99Q1=100
#>     5:        2    JPY         P1D           4F0        99Q1=100
#>    ---                                                          
#> 14032:        4    USD         P1D           4F0        99Q1=100
#> 14033:        4    USD         P1D           4F0        99Q1=100
#> 14034:        4    USD         P1D           4F0        99Q1=100
#> 14035:        4    USD         P1D           4F0        99Q1=100
#> 14036:        4    USD         P1D           4F0        99Q1=100
# }
```
