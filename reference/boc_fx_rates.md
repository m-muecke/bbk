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
#>      exchange_rate_id     rate exchange_rate_effective_timestamp
#>                 <int>    <num>                            <POSc>
#>   1:          5818524 0.000000                        2026-03-30
#>   2:          5818525 0.003760                        2026-03-30
#>   3:          5818526 0.264600                        2026-03-30
#>   4:          5818527 0.000082                        2026-03-30
#>   5:          5818528 1.484300                        2026-03-30
#>  ---                                                            
#> 150:          5818673 0.373490                        2026-03-30
#> 151:          5818674 0.003020                        2026-03-30
#> 152:          5818675 0.000530                        2026-03-30
#> 153:          5818676 0.000050                        2026-03-30
#> 154:          5818677 0.069990                        2026-03-30
#>      exchange_rate_expiry_timestamp exchange_rate_source from_currency
#>                              <POSc>               <char>        <char>
#>   1:            2026-03-30 23:59:59                 CBSA           XCG
#>   2:            2026-03-30 23:59:59                 CBSA           ZWL
#>   3:            2026-03-30 23:59:59                  BoC           BRL
#>   4:            2026-03-30 23:59:59                  BoC           IDR
#>   5:            2026-03-30 23:59:59                 CBSA           LTL
#>  ---                                                                  
#> 150:            2026-03-30 23:59:59                 CBSA           AED
#> 151:            2026-03-30 23:59:59                 CBSA           VES
#> 152:            2026-03-30 23:59:59                 CBSA           TZS
#> 153:            2026-03-30 23:59:59                 CBSA           VND
#> 154:            2026-03-30 23:59:59                 CBSA           ZMW
#>      from_currency_csn to_currency to_currency_csn
#>                  <int>      <char>           <int>
#>   1:               252         CAD              36
#>   2:               238         CAD              36
#>   3:                30         CAD              36
#>   4:                92         CAD              36
#>   5:               118         CAD              36
#>  ---                                              
#> 150:                 1         CAD              36
#> 151:               214         CAD              36
#> 152:               202         CAD              36
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
