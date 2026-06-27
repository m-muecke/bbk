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
#> 7094: 2026-06-22 D.USD.EUR.SP00.A 1.1456  daily
#> 7095: 2026-06-23 D.USD.EUR.SP00.A 1.1392  daily
#> 7096: 2026-06-24 D.USD.EUR.SP00.A 1.1340  daily
#> 7097: 2026-06-25 D.USD.EUR.SP00.A 1.1342  daily
#> 7098: 2026-06-26 D.USD.EUR.SP00.A 1.1401  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7094: US dollar/Euro ECB reference exchange rate
#> 7095: US dollar/Euro ECB reference exchange rate
#> 7096: US dollar/Euro ECB reference exchange rate
#> 7097: US dollar/Euro ECB reference exchange rate
#> 7098: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7094: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7095: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7096: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7097: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7098: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix unit_index_base decimals unit_mult
#>               <char>   <char>     <char>          <char>   <char>    <char>
#>    1:            EUR     SP00          A        99Q1=100        4         0
#>    2:            EUR     SP00          A        99Q1=100        4         0
#>    3:            EUR     SP00          A        99Q1=100        4         0
#>    4:            EUR     SP00          A        99Q1=100        4         0
#>    5:            EUR     SP00          A        99Q1=100        4         0
#>   ---                                                                      
#> 7094:            EUR     SP00          A        99Q1=100        4         0
#> 7095:            EUR     SP00          A        99Q1=100        4         0
#> 7096:            EUR     SP00          A        99Q1=100        4         0
#> 7097:            EUR     SP00          A        99Q1=100        4         0
#> 7098:            EUR     SP00          A        99Q1=100        4         0
#>       collection source_agency time_format   unit
#>           <char>        <char>      <char> <char>
#>    1:          A           4F0         P1D    USD
#>    2:          A           4F0         P1D    USD
#>    3:          A           4F0         P1D    USD
#>    4:          A           4F0         P1D    USD
#>    5:          A           4F0         P1D    USD
#>   ---                                            
#> 7094:          A           4F0         P1D    USD
#> 7095:          A           4F0         P1D    USD
#> 7096:          A           4F0         P1D    USD
#> 7097:          A           4F0         P1D    USD
#> 7098:          A           4F0         P1D    USD

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
#> 14192: 2026-06-22 D.USD.EUR.SP00.A   1.1456  daily
#> 14193: 2026-06-23 D.USD.EUR.SP00.A   1.1392  daily
#> 14194: 2026-06-24 D.USD.EUR.SP00.A   1.1340  daily
#> 14195: 2026-06-25 D.USD.EUR.SP00.A   1.1342  daily
#> 14196: 2026-06-26 D.USD.EUR.SP00.A   1.1401  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14192:    US dollar/Euro ECB reference exchange rate
#> 14193:    US dollar/Euro ECB reference exchange rate
#> 14194:    US dollar/Euro ECB reference exchange rate
#> 14195:    US dollar/Euro ECB reference exchange rate
#> 14196:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14192:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14193:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14194:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14195:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14196:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix unit_index_base unit_mult
#>          <char>         <char>   <char>     <char>          <char>    <char>
#>     1:      JPY            EUR     SP00          A        99Q1=100         0
#>     2:      JPY            EUR     SP00          A        99Q1=100         0
#>     3:      JPY            EUR     SP00          A        99Q1=100         0
#>     4:      JPY            EUR     SP00          A        99Q1=100         0
#>     5:      JPY            EUR     SP00          A        99Q1=100         0
#>    ---                                                                      
#> 14192:      USD            EUR     SP00          A        99Q1=100         0
#> 14193:      USD            EUR     SP00          A        99Q1=100         0
#> 14194:      USD            EUR     SP00          A        99Q1=100         0
#> 14195:      USD            EUR     SP00          A        99Q1=100         0
#> 14196:      USD            EUR     SP00          A        99Q1=100         0
#>          unit collection source_agency decimals time_format
#>        <char>     <char>        <char>   <char>      <char>
#>     1:    JPY          A           4F0        2         P1D
#>     2:    JPY          A           4F0        2         P1D
#>     3:    JPY          A           4F0        2         P1D
#>     4:    JPY          A           4F0        2         P1D
#>     5:    JPY          A           4F0        2         P1D
#>    ---                                                     
#> 14192:    USD          A           4F0        4         P1D
#> 14193:    USD          A           4F0        4         P1D
#> 14194:    USD          A           4F0        4         P1D
#> 14195:    USD          A           4F0        4         P1D
#> 14196:    USD          A           4F0        4         P1D
# }
```
