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
#> 7063: 2026-05-08 D.USD.EUR.SP00.A 1.1761  daily
#> 7064: 2026-05-11 D.USD.EUR.SP00.A 1.1765  daily
#> 7065: 2026-05-12 D.USD.EUR.SP00.A 1.1738  daily
#> 7066: 2026-05-13 D.USD.EUR.SP00.A 1.1715  daily
#> 7067: 2026-05-14 D.USD.EUR.SP00.A 1.1702  daily
#>                                            title
#>                                           <char>
#>    1: US dollar/Euro ECB reference exchange rate
#>    2: US dollar/Euro ECB reference exchange rate
#>    3: US dollar/Euro ECB reference exchange rate
#>    4: US dollar/Euro ECB reference exchange rate
#>    5: US dollar/Euro ECB reference exchange rate
#>   ---                                           
#> 7063: US dollar/Euro ECB reference exchange rate
#> 7064: US dollar/Euro ECB reference exchange rate
#> 7065: US dollar/Euro ECB reference exchange rate
#> 7066: US dollar/Euro ECB reference exchange rate
#> 7067: US dollar/Euro ECB reference exchange rate
#>                                                         description currency
#>                                                              <char>   <char>
#>    1: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    2: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    3: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    4: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>    5: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>   ---                                                                       
#> 7063: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7064: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7065: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7066: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#> 7067: ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)      USD
#>       currency_denom exr_type exr_suffix decimals time_format source_agency
#>               <char>   <char>     <char>   <char>      <char>        <char>
#>    1:            EUR     SP00          A        4         P1D           4F0
#>    2:            EUR     SP00          A        4         P1D           4F0
#>    3:            EUR     SP00          A        4         P1D           4F0
#>    4:            EUR     SP00          A        4         P1D           4F0
#>    5:            EUR     SP00          A        4         P1D           4F0
#>   ---                                                                      
#> 7063:            EUR     SP00          A        4         P1D           4F0
#> 7064:            EUR     SP00          A        4         P1D           4F0
#> 7065:            EUR     SP00          A        4         P1D           4F0
#> 7066:            EUR     SP00          A        4         P1D           4F0
#> 7067:            EUR     SP00          A        4         P1D           4F0
#>       unit_index_base unit_mult collection   unit
#>                <char>    <char>     <char> <char>
#>    1:        99Q1=100         0          A    USD
#>    2:        99Q1=100         0          A    USD
#>    3:        99Q1=100         0          A    USD
#>    4:        99Q1=100         0          A    USD
#>    5:        99Q1=100         0          A    USD
#>   ---                                            
#> 7063:        99Q1=100         0          A    USD
#> 7064:        99Q1=100         0          A    USD
#> 7065:        99Q1=100         0          A    USD
#> 7066:        99Q1=100         0          A    USD
#> 7067:        99Q1=100         0          A    USD

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
#> 14130: 2026-05-08 D.USD.EUR.SP00.A   1.1761  daily
#> 14131: 2026-05-11 D.USD.EUR.SP00.A   1.1765  daily
#> 14132: 2026-05-12 D.USD.EUR.SP00.A   1.1738  daily
#> 14133: 2026-05-13 D.USD.EUR.SP00.A   1.1715  daily
#> 14134: 2026-05-14 D.USD.EUR.SP00.A   1.1702  daily
#>                                                title
#>                                               <char>
#>     1: Japanese yen/Euro ECB reference exchange rate
#>     2: Japanese yen/Euro ECB reference exchange rate
#>     3: Japanese yen/Euro ECB reference exchange rate
#>     4: Japanese yen/Euro ECB reference exchange rate
#>     5: Japanese yen/Euro ECB reference exchange rate
#>    ---                                              
#> 14130:    US dollar/Euro ECB reference exchange rate
#> 14131:    US dollar/Euro ECB reference exchange rate
#> 14132:    US dollar/Euro ECB reference exchange rate
#> 14133:    US dollar/Euro ECB reference exchange rate
#> 14134:    US dollar/Euro ECB reference exchange rate
#>                                                             description
#>                                                                  <char>
#>     1: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     2: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     3: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     4: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>     5: ECB reference exchange rate, Japanese yen/Euro, 2.15 pm (C.E.T.)
#>    ---                                                                 
#> 14130:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14131:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14132:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14133:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#> 14134:    ECB reference exchange rate, US dollar/Euro, 2.15 pm (C.E.T.)
#>        currency currency_denom exr_type exr_suffix collection source_agency
#>          <char>         <char>   <char>     <char>     <char>        <char>
#>     1:      JPY            EUR     SP00          A          A           4F0
#>     2:      JPY            EUR     SP00          A          A           4F0
#>     3:      JPY            EUR     SP00          A          A           4F0
#>     4:      JPY            EUR     SP00          A          A           4F0
#>     5:      JPY            EUR     SP00          A          A           4F0
#>    ---                                                                     
#> 14130:      USD            EUR     SP00          A          A           4F0
#> 14131:      USD            EUR     SP00          A          A           4F0
#> 14132:      USD            EUR     SP00          A          A           4F0
#> 14133:      USD            EUR     SP00          A          A           4F0
#> 14134:      USD            EUR     SP00          A          A           4F0
#>        unit_mult unit_index_base   unit time_format decimals
#>           <char>          <char> <char>      <char>   <char>
#>     1:         0        99Q1=100    JPY         P1D        2
#>     2:         0        99Q1=100    JPY         P1D        2
#>     3:         0        99Q1=100    JPY         P1D        2
#>     4:         0        99Q1=100    JPY         P1D        2
#>     5:         0        99Q1=100    JPY         P1D        2
#>    ---                                                      
#> 14130:         0        99Q1=100    USD         P1D        4
#> 14131:         0        99Q1=100    USD         P1D        4
#> 14132:         0        99Q1=100    USD         P1D        4
#> 14133:         0        99Q1=100    USD         P1D        4
#> 14134:         0        99Q1=100    USD         P1D        4
# }
```
