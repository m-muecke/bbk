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
  last_n = NULL,
  updated_after = NULL
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

- updated_after:

  (`NULL` \| `character(1)` \| `Date(1)` \| `POSIXct(1)`)  
  Retrieve only observations updated after the given timestamp (e.g.,
  `"2024-06-01T00:00:00"`). Useful for incremental retrieval. If `NULL`,
  no restriction is applied. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
[`nbp_fx_rates()`](https://m-muecke.github.io/bbk/reference/nbp_fx_rates.md),
[`nbp_gold()`](https://m-muecke.github.io/bbk/reference/nbp_gold.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
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
#> 7073: 2026-05-22 D.USD.EUR.SP00.A 1.1595  daily
#> 7074: 2026-05-25 D.USD.EUR.SP00.A 1.1643  daily
#> 7075: 2026-05-26 D.USD.EUR.SP00.A 1.1634  daily
#> 7076: 2026-05-27 D.USD.EUR.SP00.A 1.1637  daily
#> 7077: 2026-05-28 D.USD.EUR.SP00.A 1.1617  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7073: US dollar/Euro ECB reference exchange rate
#> 7074: US dollar/Euro ECB reference exchange rate
#> 7075: US dollar/Euro ECB reference exchange rate
#> 7076: US dollar/Euro ECB reference exchange rate
#> 7077: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7073: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7074: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7075: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7076: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7077: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix   unit time_format collection decimals
#>               <char>   <char>     <char> <char>      <char>     <char>   <char>
#>    1:            EUR     SP00          A    USD         P1D          A        4
#>    2:            EUR     SP00          A    USD         P1D          A        4
#>    3:            EUR     SP00          A    USD         P1D          A        4
#>    4:            EUR     SP00          A    USD         P1D          A        4
#>    5:            EUR     SP00          A    USD         P1D          A        4
#>   ---                                                                          
#> 7073:            EUR     SP00          A    USD         P1D          A        4
#> 7074:            EUR     SP00          A    USD         P1D          A        4
#> 7075:            EUR     SP00          A    USD         P1D          A        4
#> 7076:            EUR     SP00          A    USD         P1D          A        4
#> 7077:            EUR     SP00          A    USD         P1D          A        4
#>       unit_index_base unit_mult source_agency
#>                <char>    <char>        <char>
#>    1:        99Q1=100         0           4F0
#>    2:        99Q1=100         0           4F0
#>    3:        99Q1=100         0           4F0
#>    4:        99Q1=100         0           4F0
#>    5:        99Q1=100         0           4F0
#>   ---                                        
#> 7073:        99Q1=100         0           4F0
#> 7074:        99Q1=100         0           4F0
#> 7075:        99Q1=100         0           4F0
#> 7076:        99Q1=100         0           4F0
#> 7077:        99Q1=100         0           4F0

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
#> 14150: 2026-05-22 D.USD.EUR.SP00.A   1.1595  daily
#> 14151: 2026-05-25 D.USD.EUR.SP00.A   1.1643  daily
#> 14152: 2026-05-26 D.USD.EUR.SP00.A   1.1634  daily
#> 14153: 2026-05-27 D.USD.EUR.SP00.A   1.1637  daily
#> 14154: 2026-05-28 D.USD.EUR.SP00.A   1.1617  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14150:    US dollar/Euro ECB reference exchange rate
#> 14151:    US dollar/Euro ECB reference exchange rate
#> 14152:    US dollar/Euro ECB reference exchange rate
#> 14153:    US dollar/Euro ECB reference exchange rate
#> 14154:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14150:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14151:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14152:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14153:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14154:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix unit_index_base time_format
#>          <char>         <char>   <char>     <char>          <char>      <char>
#>     1:      JPY            EUR     SP00          A        99Q1=100         P1D
#>     2:      JPY            EUR     SP00          A        99Q1=100         P1D
#>     3:      JPY            EUR     SP00          A        99Q1=100         P1D
#>     4:      JPY            EUR     SP00          A        99Q1=100         P1D
#>     5:      JPY            EUR     SP00          A        99Q1=100         P1D
#>    ---                                                                        
#> 14150:      USD            EUR     SP00          A        99Q1=100         P1D
#> 14151:      USD            EUR     SP00          A        99Q1=100         P1D
#> 14152:      USD            EUR     SP00          A        99Q1=100         P1D
#> 14153:      USD            EUR     SP00          A        99Q1=100         P1D
#> 14154:      USD            EUR     SP00          A        99Q1=100         P1D
#>          unit unit_mult collection decimals source_agency
#>        <char>    <char>     <char>   <char>        <char>
#>     1:    JPY         0          A        2           4F0
#>     2:    JPY         0          A        2           4F0
#>     3:    JPY         0          A        2           4F0
#>     4:    JPY         0          A        2           4F0
#>     5:    JPY         0          A        2           4F0
#>    ---                                                   
#> 14150:    USD         0          A        4           4F0
#> 14151:    USD         0          A        4           4F0
#> 14152:    USD         0          A        4           4F0
#> 14153:    USD         0          A        4           4F0
#> 14154:    USD         0          A        4           4F0
# }
```
