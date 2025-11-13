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
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
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
#>   1:          5796274 1.07560                        2025-11-14
#>   2:          5796275 0.09400                        2025-11-14
#>   3:          5796276 1.00000                        2025-11-14
#>   4:          5796277 0.03320                        2025-11-14
#>   5:          5796278 1.00030                        2025-11-14
#>  ---                                                           
#> 150:          5796423 0.00613                        2025-11-14
#> 151:          5796424 0.04327                        2025-11-14
#> 152:          5796425 0.47465                        2025-11-14
#> 153:          5796426 0.00005                        2025-11-14
#> 154:          5796427 0.06188                        2025-11-14
#>      exchange_rate_expiry_timestamp exchange_rate_source from_currency
#>                              <POSc>               <char>        <char>
#>   1:            2025-11-14 23:59:59                  BoC           SGD
#>   2:            2025-11-14 23:59:59                 CBSA           EEK
#>   3:            2025-11-14 23:59:59                 CBSA           SKL
#>   4:            2025-11-14 23:59:59                  BoC           TRY
#>   5:            2025-11-14 23:59:59                 CBSA           ERP
#>  ---                                                                  
#> 150:            2025-11-14 23:59:59                 CBSA           VES
#> 151:            2025-11-14 23:59:59                 CBSA           THB
#> 152:            2025-11-14 23:59:59                 CBSA           TND
#> 153:            2025-11-14 23:59:59                 CBSA           VND
#> 154:            2025-11-14 23:59:59                 CBSA           ZMW
#>      from_currency_csn to_currency to_currency_csn
#>                  <int>      <char>           <int>
#>   1:               176         CAD              36
#>   2:                59         CAD              36
#>   3:               180         CAD              36
#>   4:               199         CAD              36
#>   5:                62         CAD              36
#>  ---                                              
#> 150:               214         CAD              36
#> 151:               190         CAD              36
#> 152:               196         CAD              36
#> 153:               215         CAD              36
#> 154:               229         CAD              36

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
