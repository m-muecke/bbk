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
#> 7013: 2026-02-24 D.USD.EUR.SP00.A 1.1777  daily
#> 7014: 2026-02-25 D.USD.EUR.SP00.A 1.1784  daily
#> 7015: 2026-02-26 D.USD.EUR.SP00.A 1.1814  daily
#> 7016: 2026-02-27 D.USD.EUR.SP00.A 1.1805  daily
#> 7017: 2026-03-02 D.USD.EUR.SP00.A 1.1698  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7013: US dollar/Euro ECB reference exchange rate
#> 7014: US dollar/Euro ECB reference exchange rate
#> 7015: US dollar/Euro ECB reference exchange rate
#> 7016: US dollar/Euro ECB reference exchange rate
#> 7017: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7013: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7014: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7015: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7016: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7017: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix collection unit_index_base decimals
#>               <char>   <char>     <char>     <char>          <char>   <char>
#>    1:            EUR     SP00          A          A        99Q1=100        4
#>    2:            EUR     SP00          A          A        99Q1=100        4
#>    3:            EUR     SP00          A          A        99Q1=100        4
#>    4:            EUR     SP00          A          A        99Q1=100        4
#>    5:            EUR     SP00          A          A        99Q1=100        4
#>   ---                                                                       
#> 7013:            EUR     SP00          A          A        99Q1=100        4
#> 7014:            EUR     SP00          A          A        99Q1=100        4
#> 7015:            EUR     SP00          A          A        99Q1=100        4
#> 7016:            EUR     SP00          A          A        99Q1=100        4
#> 7017:            EUR     SP00          A          A        99Q1=100        4
#>       time_format   unit source_agency unit_mult
#>            <char> <char>        <char>    <char>
#>    1:         P1D    USD           4F0         0
#>    2:         P1D    USD           4F0         0
#>    3:         P1D    USD           4F0         0
#>    4:         P1D    USD           4F0         0
#>    5:         P1D    USD           4F0         0
#>   ---                                           
#> 7013:         P1D    USD           4F0         0
#> 7014:         P1D    USD           4F0         0
#> 7015:         P1D    USD           4F0         0
#> 7016:         P1D    USD           4F0         0
#> 7017:         P1D    USD           4F0         0

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
#> 14030: 2026-02-24 D.USD.EUR.SP00.A   1.1777  daily
#> 14031: 2026-02-25 D.USD.EUR.SP00.A   1.1784  daily
#> 14032: 2026-02-26 D.USD.EUR.SP00.A   1.1814  daily
#> 14033: 2026-02-27 D.USD.EUR.SP00.A   1.1805  daily
#> 14034: 2026-03-02 D.USD.EUR.SP00.A   1.1698  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14030:    US dollar/Euro ECB reference exchange rate
#> 14031:    US dollar/Euro ECB reference exchange rate
#> 14032:    US dollar/Euro ECB reference exchange rate
#> 14033:    US dollar/Euro ECB reference exchange rate
#> 14034:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14030:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14031:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14032:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14033:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14034:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix unit_index_base
#>          <char>         <char>   <char>     <char>          <char>
#>     1:      JPY            EUR     SP00          A        99Q1=100
#>     2:      JPY            EUR     SP00          A        99Q1=100
#>     3:      JPY            EUR     SP00          A        99Q1=100
#>     4:      JPY            EUR     SP00          A        99Q1=100
#>     5:      JPY            EUR     SP00          A        99Q1=100
#>    ---                                                            
#> 14030:      USD            EUR     SP00          A        99Q1=100
#> 14031:      USD            EUR     SP00          A        99Q1=100
#> 14032:      USD            EUR     SP00          A        99Q1=100
#> 14033:      USD            EUR     SP00          A        99Q1=100
#> 14034:      USD            EUR     SP00          A        99Q1=100
#>        source_agency unit_mult decimals   unit time_format collection
#>               <char>    <char>   <char> <char>      <char>     <char>
#>     1:           4F0         0        2    JPY         P1D          A
#>     2:           4F0         0        2    JPY         P1D          A
#>     3:           4F0         0        2    JPY         P1D          A
#>     4:           4F0         0        2    JPY         P1D          A
#>     5:           4F0         0        2    JPY         P1D          A
#>    ---                                                               
#> 14030:           4F0         0        4    USD         P1D          A
#> 14031:           4F0         0        4    USD         P1D          A
#> 14032:           4F0         0        4    USD         P1D          A
#> 14033:           4F0         0        4    USD         P1D          A
#> 14034:           4F0         0        4    USD         P1D          A
# }
```
