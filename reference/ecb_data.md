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

  (`NULL` \| `character(1)`)  
  ISO 8601 timestamp to retrieve only observations updated after the
  given time (e.g., `"2024-06-01T00:00:00"`). If `NULL`, no restriction
  is applied. Default `NULL`.

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
#> 7054: 2026-04-24 D.USD.EUR.SP00.A 1.1712  daily
#> 7055: 2026-04-27 D.USD.EUR.SP00.A 1.1749  daily
#> 7056: 2026-04-28 D.USD.EUR.SP00.A 1.1680  daily
#> 7057: 2026-04-29 D.USD.EUR.SP00.A 1.1706  daily
#> 7058: 2026-04-30 D.USD.EUR.SP00.A 1.1702  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7054: US dollar/Euro ECB reference exchange rate
#> 7055: US dollar/Euro ECB reference exchange rate
#> 7056: US dollar/Euro ECB reference exchange rate
#> 7057: US dollar/Euro ECB reference exchange rate
#> 7058: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7054: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7055: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7056: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7057: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7058: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix collection unit_mult time_format
#>               <char>   <char>     <char>     <char>    <char>      <char>
#>    1:            EUR     SP00          A          A         0         P1D
#>    2:            EUR     SP00          A          A         0         P1D
#>    3:            EUR     SP00          A          A         0         P1D
#>    4:            EUR     SP00          A          A         0         P1D
#>    5:            EUR     SP00          A          A         0         P1D
#>   ---                                                                    
#> 7054:            EUR     SP00          A          A         0         P1D
#> 7055:            EUR     SP00          A          A         0         P1D
#> 7056:            EUR     SP00          A          A         0         P1D
#> 7057:            EUR     SP00          A          A         0         P1D
#> 7058:            EUR     SP00          A          A         0         P1D
#>       unit_index_base source_agency decimals   unit
#>                <char>        <char>   <char> <char>
#>    1:        99Q1=100           4F0        4    USD
#>    2:        99Q1=100           4F0        4    USD
#>    3:        99Q1=100           4F0        4    USD
#>    4:        99Q1=100           4F0        4    USD
#>    5:        99Q1=100           4F0        4    USD
#>   ---                                              
#> 7054:        99Q1=100           4F0        4    USD
#> 7055:        99Q1=100           4F0        4    USD
#> 7056:        99Q1=100           4F0        4    USD
#> 7057:        99Q1=100           4F0        4    USD
#> 7058:        99Q1=100           4F0        4    USD

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
#> 14112: 2026-04-24 D.USD.EUR.SP00.A   1.1712  daily
#> 14113: 2026-04-27 D.USD.EUR.SP00.A   1.1749  daily
#> 14114: 2026-04-28 D.USD.EUR.SP00.A   1.1680  daily
#> 14115: 2026-04-29 D.USD.EUR.SP00.A   1.1706  daily
#> 14116: 2026-04-30 D.USD.EUR.SP00.A   1.1702  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14112:    US dollar/Euro ECB reference exchange rate
#> 14113:    US dollar/Euro ECB reference exchange rate
#> 14114:    US dollar/Euro ECB reference exchange rate
#> 14115:    US dollar/Euro ECB reference exchange rate
#> 14116:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14112:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14113:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14114:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14115:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14116:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix   unit decimals
#>          <char>         <char>   <char>     <char> <char>   <char>
#>     1:      JPY            EUR     SP00          A    JPY        2
#>     2:      JPY            EUR     SP00          A    JPY        2
#>     3:      JPY            EUR     SP00          A    JPY        2
#>     4:      JPY            EUR     SP00          A    JPY        2
#>     5:      JPY            EUR     SP00          A    JPY        2
#>    ---                                                            
#> 14112:      USD            EUR     SP00          A    USD        4
#> 14113:      USD            EUR     SP00          A    USD        4
#> 14114:      USD            EUR     SP00          A    USD        4
#> 14115:      USD            EUR     SP00          A    USD        4
#> 14116:      USD            EUR     SP00          A    USD        4
#>        source_agency collection unit_index_base time_format unit_mult
#>               <char>     <char>          <char>      <char>    <char>
#>     1:           4F0          A        99Q1=100         P1D         0
#>     2:           4F0          A        99Q1=100         P1D         0
#>     3:           4F0          A        99Q1=100         P1D         0
#>     4:           4F0          A        99Q1=100         P1D         0
#>     5:           4F0          A        99Q1=100         P1D         0
#>    ---                                                               
#> 14112:           4F0          A        99Q1=100         P1D         0
#> 14113:           4F0          A        99Q1=100         P1D         0
#> 14114:           4F0          A        99Q1=100         P1D         0
#> 14115:           4F0          A        99Q1=100         P1D         0
#> 14116:           4F0          A        99Q1=100         P1D         0
# }
```
