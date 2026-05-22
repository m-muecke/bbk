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
#> 7069: 2026-05-18 D.USD.EUR.SP00.A 1.1648  daily
#> 7070: 2026-05-19 D.USD.EUR.SP00.A 1.1620  daily
#> 7071: 2026-05-20 D.USD.EUR.SP00.A 1.1600  daily
#> 7072: 2026-05-21 D.USD.EUR.SP00.A 1.1599  daily
#> 7073: 2026-05-22 D.USD.EUR.SP00.A 1.1595  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7069: US dollar/Euro ECB reference exchange rate
#> 7070: US dollar/Euro ECB reference exchange rate
#> 7071: US dollar/Euro ECB reference exchange rate
#> 7072: US dollar/Euro ECB reference exchange rate
#> 7073: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7069: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7070: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7071: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7072: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7073: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix unit_index_base unit_mult
#>               <char>   <char>     <char>          <char>    <char>
#>    1:            EUR     SP00          A        99Q1=100         0
#>    2:            EUR     SP00          A        99Q1=100         0
#>    3:            EUR     SP00          A        99Q1=100         0
#>    4:            EUR     SP00          A        99Q1=100         0
#>    5:            EUR     SP00          A        99Q1=100         0
#>   ---                                                             
#> 7069:            EUR     SP00          A        99Q1=100         0
#> 7070:            EUR     SP00          A        99Q1=100         0
#> 7071:            EUR     SP00          A        99Q1=100         0
#> 7072:            EUR     SP00          A        99Q1=100         0
#> 7073:            EUR     SP00          A        99Q1=100         0
#>       source_agency collection   unit time_format decimals
#>              <char>     <char> <char>      <char>   <char>
#>    1:           4F0          A    USD         P1D        4
#>    2:           4F0          A    USD         P1D        4
#>    3:           4F0          A    USD         P1D        4
#>    4:           4F0          A    USD         P1D        4
#>    5:           4F0          A    USD         P1D        4
#>   ---                                                     
#> 7069:           4F0          A    USD         P1D        4
#> 7070:           4F0          A    USD         P1D        4
#> 7071:           4F0          A    USD         P1D        4
#> 7072:           4F0          A    USD         P1D        4
#> 7073:           4F0          A    USD         P1D        4

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
#> 14142: 2026-05-18 D.USD.EUR.SP00.A   1.1648  daily
#> 14143: 2026-05-19 D.USD.EUR.SP00.A   1.1620  daily
#> 14144: 2026-05-20 D.USD.EUR.SP00.A   1.1600  daily
#> 14145: 2026-05-21 D.USD.EUR.SP00.A   1.1599  daily
#> 14146: 2026-05-22 D.USD.EUR.SP00.A   1.1595  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14142:    US dollar/Euro ECB reference exchange rate
#> 14143:    US dollar/Euro ECB reference exchange rate
#> 14144:    US dollar/Euro ECB reference exchange rate
#> 14145:    US dollar/Euro ECB reference exchange rate
#> 14146:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14142:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14143:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14144:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14145:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14146:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix collection decimals
#>          <char>         <char>   <char>     <char>     <char>   <char>
#>     1:      JPY            EUR     SP00          A          A        2
#>     2:      JPY            EUR     SP00          A          A        2
#>     3:      JPY            EUR     SP00          A          A        2
#>     4:      JPY            EUR     SP00          A          A        2
#>     5:      JPY            EUR     SP00          A          A        2
#>    ---                                                                
#> 14142:      USD            EUR     SP00          A          A        4
#> 14143:      USD            EUR     SP00          A          A        4
#> 14144:      USD            EUR     SP00          A          A        4
#> 14145:      USD            EUR     SP00          A          A        4
#> 14146:      USD            EUR     SP00          A          A        4
#>        unit_index_base time_format source_agency   unit unit_mult
#>                 <char>      <char>        <char> <char>    <char>
#>     1:        99Q1=100         P1D           4F0    JPY         0
#>     2:        99Q1=100         P1D           4F0    JPY         0
#>     3:        99Q1=100         P1D           4F0    JPY         0
#>     4:        99Q1=100         P1D           4F0    JPY         0
#>     5:        99Q1=100         P1D           4F0    JPY         0
#>    ---                                                           
#> 14142:        99Q1=100         P1D           4F0    USD         0
#> 14143:        99Q1=100         P1D           4F0    USD         0
#> 14144:        99Q1=100         P1D           4F0    USD         0
#> 14145:        99Q1=100         P1D           4F0    USD         0
#> 14146:        99Q1=100         P1D           4F0    USD         0
# }
```
