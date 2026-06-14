# Fetch Czech National Bank (CNB) exchange rates of other currencies

Retrieve the monthly exchange rate fixing for less commonly traded
("other") currencies from the CNB API. These currencies are not part of
the daily fixing returned by
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md).

## Usage

``` r
cnb_fx_other_rates(year_month = NULL, year = NULL, lang = "EN")
```

## Source

<https://api.cnb.cz/cnbapi/swagger-ui.html>

## Arguments

- year_month:

  (`NULL` \| `character(1)`)  
  The month to query in `"YYYY-MM"` format, returning rates for all
  currencies in that month. If `NULL`, the latest available month is
  returned. Mutually exclusive with `year`. Default `NULL`.

- year:

  (`NULL` \| `integer(1)`)  
  A calendar year, returning rates for all currencies in every month of
  that year. Mutually exclusive with `year_month`. Default `NULL`.

- lang:

  (`character(1)`)  
  Language for the country and currency names, either `"EN"` or `"CZ"`.
  Default `"EN"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested exchange rates. The `rate` is the amount of Czech
koruna per `amount` units of the foreign currency.

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
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
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
# latest month for all other currencies
cnb_fx_other_rates()
#> Empty data.table (0 rows and 6 cols): date,currency_code,currency,country,amount,rate

# a specific month
cnb_fx_other_rates(year_month = "2024-01")
#>            date currency_code currency     country amount   rate
#>          <Date>        <char>   <char>      <char>  <int>  <num>
#>   1: 2024-01-31           AFN  afghani Afghanistan    100 31.052
#>   2: 2024-01-31           ALL      lek     Albania    100 24.016
#>   3: 2024-01-31           DZD    dinar     Algeria    100 17.069
#>   4: 2024-01-31           AOA   kwanza      Angola    100  2.717
#>   5: 2024-01-31           ARS     peso   Argentina    100  2.776
#>  ---                                                            
#> 120: 2024-01-31           VEF  bolivar   Venezuela      1  0.000
#> 121: 2024-01-31           VND     dong     Vietnam  10000  9.394
#> 122: 2024-01-31           YER     rial       Yemen    100  9.175
#> 123: 2024-01-31           ZMW   kwacha      Zambia      1  0.848
#> 124: 2024-01-31           ZWL   dollar    Zimbabwe   1000  0.000

# all months of a given year
cnb_fx_other_rates(year = 2024L)
#>             date currency_code  currency                 country amount   rate
#>           <Date>        <char>    <char>                  <char>  <int>  <num>
#>    1: 2024-01-31           AED    dirham    United Arab Emirates      1  6.245
#>    2: 2024-01-31           AFN   afghani             Afghanistan    100 31.052
#>    3: 2024-01-31           ALL       lek                 Albania    100 24.016
#>    4: 2024-01-31           AMD      dram                 Armenia    100  5.719
#>    5: 2024-01-31           ANG   guilder Curacao and St. Maarten      1 12.885
#>   ---                                                                         
#> 1484: 2024-12-31           XOF franc CFA                   BCEAO    100  3.872
#> 1485: 2024-12-31           XPF franc CFP        French Polynesia    100 21.158
#> 1486: 2024-12-31           YER      rial                   Yemen    100  9.731
#> 1487: 2024-12-31           ZMW    kwacha                  Zambia      1  0.873
#> 1488: 2024-12-31           ZWL    dollar                Zimbabwe   1000  0.000
# }
```
