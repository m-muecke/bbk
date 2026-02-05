# Fetch Bank of Canada foreign exchange rates

Fetch the latest or historical foreign exchange reference rates from the
Bank of Canada (BoC).

## Usage

``` r
boc_fx_rates(start_date = NULL, end_date = NULL, limit = NULL, skip = NULL)
```

## Source

<https://www.cbsa-asfc.gc.ca/eservices/api/er-tc-api-eng.html>

## Arguments

- start_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  Start date of the data. Default `NULL`.

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End date of the data. Default `NULL`.

- limit:

  (`NULL` \| `integer(1)`)  
  Maximum number of records to return. Default `NULL` (all records).

- skip:

  (`NULL` \| `integer(1)`)  
  Number of records to skip. Default `NULL` (do not skip any records).

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the exchange rates.

## Details

The recorded rates indicate the number of Canadian dollars required to
buy a single unit of the foreign currency. New rates are released by the
Bank of Canada (BoC) daily at 4:30 pm. The Canada Border Services (CBSA)
retrieves these updates between 4:30 pm and 5 pm ET.

BoC provides 23 foreign exchange rates. All other rates are maintained
by the CBSA.

Exchange rates from the BoC are updated daily in the system while other
exchange rates are updated by the CBSA at set intervals. The updated
rates are available for retrieval between 7 pm and 11:59 pm ET.

As BoC publishes exchange rates every business day, it is recommended
that exchange rate data be retrieved on a daily basis. This retrieval
should occur after 7 pm ET to ensure retrieval of the latest updates.

## Examples

``` r
# \donttest{
# fetch latest exchange rates
boc_fx_rates()
#>      exchange_rate_id    rate exchange_rate_effective_timestamp
#>                 <int>   <num>                            <POSc>
#>   1:          5810053 0.33450                        2026-02-06
#>   2:          5810054 0.00376                        2026-02-06
#>   3:          5810055 0.00000                        2026-02-06
#>   4:          5810056 0.00003                        2026-02-06
#>   5:          5810057 1.07380                        2026-02-06
#>  ---                                                           
#> 150:          5810202 0.03472                        2026-02-06
#> 151:          5810203 0.00092                        2026-02-06
#> 152:          5810204 0.00011                        2026-02-06
#> 153:          5810205 0.00570                        2026-02-06
#> 154:          5810206 0.01193                        2026-02-06
#>      exchange_rate_expiry_timestamp exchange_rate_source from_currency
#>                              <POSc>               <char>        <char>
#>   1:            2026-02-06 23:59:59                 CBSA           SRG
#>   2:            2026-02-06 23:59:59                 CBSA           ZWL
#>   3:            2026-02-06 23:59:59                 CBSA           XCG
#>   4:            2026-02-06 23:59:59                 CBSA           MZM
#>   5:            2026-02-06 23:59:59                  BoC           SGD
#>  ---                                                                  
#> 150:            2026-02-06 23:59:59                 CBSA           UYU
#> 151:            2026-02-06 23:59:59                 CBSA           RWF
#> 152:            2026-02-06 23:59:59                 CBSA           UZS
#> 153:            2026-02-06 23:59:59                 CBSA           YER
#> 154:            2026-02-06 23:59:59                 CBSA           VUV
#>      from_currency_csn to_currency to_currency_csn
#>                  <int>      <char>           <int>
#>   1:               184         CAD              36
#>   2:               238         CAD              36
#>   3:               252         CAD              36
#>   4:               141         CAD              36
#>   5:               176         CAD              36
#>  ---                                              
#> 150:               209         CAD              36
#> 151:               169         CAD              36
#> 152:               211         CAD              36
#> 153:               225         CAD              36
#> 154:               216         CAD              36

# fetch historical exchange rates
boc_fx_rates(start_date = "2021-10-22", end_date = "2021-10-23", limit = 10, skip = 2)
#>     exchange_rate_id     rate exchange_rate_effective_timestamp
#>                <int>    <num>                            <POSc>
#>  1:          5546931 0.193100                        2021-10-22
#>  2:          5546932 1.437200                        2021-10-22
#>  3:          5546933 0.158900                        2021-10-22
#>  4:          5546934 0.016500                        2021-10-22
#>  5:          5546935 0.000087                        2021-10-22
#>  6:          5546936 0.010850                        2021-10-22
#>  7:          5546937 0.060900                        2021-10-22
#>  8:          5546938 0.884600                        2021-10-22
#>  9:          5546939 0.147900                        2021-10-22
#> 10:          5546940 0.312500                        2021-10-22
#>     exchange_rate_expiry_timestamp exchange_rate_source from_currency
#>                             <POSc>               <char>        <char>
#>  1:            2021-10-22 23:59:59                  BoC           CNY
#>  2:            2021-10-22 23:59:59                  BoC           EUR
#>  3:            2021-10-22 23:59:59                  BoC           HKD
#>  4:            2021-10-22 23:59:59                  BoC           INR
#>  5:            2021-10-22 23:59:59                  BoC           IDR
#>  6:            2021-10-22 23:59:59                  BoC           JPY
#>  7:            2021-10-22 23:59:59                  BoC           MXN
#>  8:            2021-10-22 23:59:59                  BoC           NZD
#>  9:            2021-10-22 23:59:59                  BoC           NOK
#> 10:            2021-10-22 23:59:59                  BoC           PEN
#>     from_currency_csn to_currency to_currency_csn
#>                 <int>      <char>           <int>
#>  1:                42         CAD              36
#>  2:                66         CAD              36
#>  3:                87         CAD              36
#>  4:                95         CAD              36
#>  5:                92         CAD              36
#>  6:               102         CAD              36
#>  7:               138         CAD              36
#>  8:               150         CAD              36
#>  9:               148         CAD              36
#> 10:               154         CAD              36
# }
```
