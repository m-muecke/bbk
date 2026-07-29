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
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_fx_rates()`](https://m-muecke.github.io/bbk/reference/bcb_fx_rates.md),
[`bcb_inflation()`](https://m-muecke.github.io/bbk/reference/bcb_inflation.md),
[`bcb_selic()`](https://m-muecke.github.io/bbk/reference/bcb_selic.md),
[`bcb_top5()`](https://m-muecke.github.io/bbk/reference/bcb_top5.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boi_data()`](https://m-muecke.github.io/bbk/reference/boi_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_czeonia()`](https://m-muecke.github.io/bbk/reference/cnb_czeonia.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
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
#> 7116: 2026-07-22 D.USD.EUR.SP00.A 1.1408  daily
#> 7117: 2026-07-23 D.USD.EUR.SP00.A 1.1392  daily
#> 7118: 2026-07-24 D.USD.EUR.SP00.A 1.1377  daily
#> 7119: 2026-07-27 D.USD.EUR.SP00.A 1.1389  daily
#> 7120: 2026-07-28 D.USD.EUR.SP00.A 1.1367  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7116: US dollar/Euro ECB reference exchange rate
#> 7117: US dollar/Euro ECB reference exchange rate
#> 7118: US dollar/Euro ECB reference exchange rate
#> 7119: US dollar/Euro ECB reference exchange rate
#> 7120: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7116: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7117: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7118: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7119: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7120: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix decimals source_agency unit_index_base
#>               <char>   <char>     <char>   <char>        <char>          <char>
#>    1:            EUR     SP00          A        4           4F0        99Q1=100
#>    2:            EUR     SP00          A        4           4F0        99Q1=100
#>    3:            EUR     SP00          A        4           4F0        99Q1=100
#>    4:            EUR     SP00          A        4           4F0        99Q1=100
#>    5:            EUR     SP00          A        4           4F0        99Q1=100
#>   ---                                                                          
#> 7116:            EUR     SP00          A        4           4F0        99Q1=100
#> 7117:            EUR     SP00          A        4           4F0        99Q1=100
#> 7118:            EUR     SP00          A        4           4F0        99Q1=100
#> 7119:            EUR     SP00          A        4           4F0        99Q1=100
#> 7120:            EUR     SP00          A        4           4F0        99Q1=100
#>         unit time_format unit_mult collection
#>       <char>      <char>    <char>     <char>
#>    1:    USD         P1D         0          A
#>    2:    USD         P1D         0          A
#>    3:    USD         P1D         0          A
#>    4:    USD         P1D         0          A
#>    5:    USD         P1D         0          A
#>   ---                                        
#> 7116:    USD         P1D         0          A
#> 7117:    USD         P1D         0          A
#> 7118:    USD         P1D         0          A
#> 7119:    USD         P1D         0          A
#> 7120:    USD         P1D         0          A

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
#> 14236: 2026-07-22 D.USD.EUR.SP00.A   1.1408  daily
#> 14237: 2026-07-23 D.USD.EUR.SP00.A   1.1392  daily
#> 14238: 2026-07-24 D.USD.EUR.SP00.A   1.1377  daily
#> 14239: 2026-07-27 D.USD.EUR.SP00.A   1.1389  daily
#> 14240: 2026-07-28 D.USD.EUR.SP00.A   1.1367  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14236:    US dollar/Euro ECB reference exchange rate
#> 14237:    US dollar/Euro ECB reference exchange rate
#> 14238:    US dollar/Euro ECB reference exchange rate
#> 14239:    US dollar/Euro ECB reference exchange rate
#> 14240:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14236:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14237:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14238:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14239:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14240:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix unit_index_base time_format
#>          <char>         <char>   <char>     <char>          <char>      <char>
#>     1:      JPY            EUR     SP00          A        99Q1=100         P1D
#>     2:      JPY            EUR     SP00          A        99Q1=100         P1D
#>     3:      JPY            EUR     SP00          A        99Q1=100         P1D
#>     4:      JPY            EUR     SP00          A        99Q1=100         P1D
#>     5:      JPY            EUR     SP00          A        99Q1=100         P1D
#>    ---                                                                        
#> 14236:      USD            EUR     SP00          A        99Q1=100         P1D
#> 14237:      USD            EUR     SP00          A        99Q1=100         P1D
#> 14238:      USD            EUR     SP00          A        99Q1=100         P1D
#> 14239:      USD            EUR     SP00          A        99Q1=100         P1D
#> 14240:      USD            EUR     SP00          A        99Q1=100         P1D
#>        collection unit_mult   unit source_agency decimals
#>            <char>    <char> <char>        <char>   <char>
#>     1:          A         0    JPY           4F0        2
#>     2:          A         0    JPY           4F0        2
#>     3:          A         0    JPY           4F0        2
#>     4:          A         0    JPY           4F0        2
#>     5:          A         0    JPY           4F0        2
#>    ---                                                   
#> 14236:          A         0    USD           4F0        4
#> 14237:          A         0    USD           4F0        4
#> 14238:          A         0    USD           4F0        4
#> 14239:          A         0    USD           4F0        4
#> 14240:          A         0    USD           4F0        4
# }
```
