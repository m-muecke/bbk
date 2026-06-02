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
#> 7075: 2026-05-26 D.USD.EUR.SP00.A 1.1634  daily
#> 7076: 2026-05-27 D.USD.EUR.SP00.A 1.1637  daily
#> 7077: 2026-05-28 D.USD.EUR.SP00.A 1.1617  daily
#> 7078: 2026-05-29 D.USD.EUR.SP00.A 1.1644  daily
#> 7079: 2026-06-01 D.USD.EUR.SP00.A 1.1646  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7075: US dollar/Euro ECB reference exchange rate
#> 7076: US dollar/Euro ECB reference exchange rate
#> 7077: US dollar/Euro ECB reference exchange rate
#> 7078: US dollar/Euro ECB reference exchange rate
#> 7079: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7075: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7076: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7077: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7078: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7079: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix decimals unit_mult time_format
#>               <char>   <char>     <char>   <char>    <char>      <char>
#>    1:            EUR     SP00          A        4         0         P1D
#>    2:            EUR     SP00          A        4         0         P1D
#>    3:            EUR     SP00          A        4         0         P1D
#>    4:            EUR     SP00          A        4         0         P1D
#>    5:            EUR     SP00          A        4         0         P1D
#>   ---                                                                  
#> 7075:            EUR     SP00          A        4         0         P1D
#> 7076:            EUR     SP00          A        4         0         P1D
#> 7077:            EUR     SP00          A        4         0         P1D
#> 7078:            EUR     SP00          A        4         0         P1D
#> 7079:            EUR     SP00          A        4         0         P1D
#>       source_agency unit_index_base   unit collection
#>              <char>          <char> <char>     <char>
#>    1:           4F0        99Q1=100    USD          A
#>    2:           4F0        99Q1=100    USD          A
#>    3:           4F0        99Q1=100    USD          A
#>    4:           4F0        99Q1=100    USD          A
#>    5:           4F0        99Q1=100    USD          A
#>   ---                                                
#> 7075:           4F0        99Q1=100    USD          A
#> 7076:           4F0        99Q1=100    USD          A
#> 7077:           4F0        99Q1=100    USD          A
#> 7078:           4F0        99Q1=100    USD          A
#> 7079:           4F0        99Q1=100    USD          A

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
#> 14154: 2026-05-26 D.USD.EUR.SP00.A   1.1634  daily
#> 14155: 2026-05-27 D.USD.EUR.SP00.A   1.1637  daily
#> 14156: 2026-05-28 D.USD.EUR.SP00.A   1.1617  daily
#> 14157: 2026-05-29 D.USD.EUR.SP00.A   1.1644  daily
#> 14158: 2026-06-01 D.USD.EUR.SP00.A   1.1646  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14154:    US dollar/Euro ECB reference exchange rate
#> 14155:    US dollar/Euro ECB reference exchange rate
#> 14156:    US dollar/Euro ECB reference exchange rate
#> 14157:    US dollar/Euro ECB reference exchange rate
#> 14158:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14154:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14155:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14156:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14157:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14158:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix source_agency time_format
#>          <char>         <char>   <char>     <char>        <char>      <char>
#>     1:      JPY            EUR     SP00          A           4F0         P1D
#>     2:      JPY            EUR     SP00          A           4F0         P1D
#>     3:      JPY            EUR     SP00          A           4F0         P1D
#>     4:      JPY            EUR     SP00          A           4F0         P1D
#>     5:      JPY            EUR     SP00          A           4F0         P1D
#>    ---                                                                      
#> 14154:      USD            EUR     SP00          A           4F0         P1D
#> 14155:      USD            EUR     SP00          A           4F0         P1D
#> 14156:      USD            EUR     SP00          A           4F0         P1D
#> 14157:      USD            EUR     SP00          A           4F0         P1D
#> 14158:      USD            EUR     SP00          A           4F0         P1D
#>        decimals unit_index_base collection   unit unit_mult
#>          <char>          <char>     <char> <char>    <char>
#>     1:        2        99Q1=100          A    JPY         0
#>     2:        2        99Q1=100          A    JPY         0
#>     3:        2        99Q1=100          A    JPY         0
#>     4:        2        99Q1=100          A    JPY         0
#>     5:        2        99Q1=100          A    JPY         0
#>    ---                                                     
#> 14154:        4        99Q1=100          A    USD         0
#> 14155:        4        99Q1=100          A    USD         0
#> 14156:        4        99Q1=100          A    USD         0
#> 14157:        4        99Q1=100          A    USD         0
#> 14158:        4        99Q1=100          A    USD         0
# }
```
