# Fetch Österreichische Nationalbank (OeNB) hierarchy

Fetch Österreichische Nationalbank (OeNB) hierarchy

## Usage

``` r
onb_hierarchy(hier_id, lang = "en")
```

## Arguments

- hier_id:

  (`integer(1)`)  
  Hierarchy id to query.

- lang:

  (`character(1)`)  
  Language to query. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
with the requested data.

## See also

Other metadata:
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md)

## Examples

``` r
# \donttest{
onb_hierarchy(hier_id = 11)
#>           group             id
#>          <char>         <char>
#>  1:    all data VDBFKBSC217000
#>  2:    all data VDBFKBSC217001
#>  3:    all data VDBFKBSC217013
#>  4:    all data VDBFKBSC217010
#>  5:    all data VDBFKBSC317000
#>  6:    all data VDBFKBSC317001
#>  7:    all data VDBFKBSC317013
#>  8:    all data VDBFKBSC317010
#>  9:    all data VDBFKBSC507001
#> 10:    all data VDBFKBSC507013
#> 11:    all data VDBFKBSC203000
#> 12:    all data VDBFKBSC507000
#> 13:    all data VDBFKBSC830000
#> 14:    all data VDBFKBSC917001
#> 15:    all data VDBFKBSC917014
#> 16:    all data VDBFKBSC917009
#> 17:    all data VDBFKBSX917000
#> 18:    all data VDBFKBSC127000
#> 19:    all data VDBFKBSC117000
#> 20:    all data VDBFKBSC403000
#> 21:      Assets VDBFKBSC217000
#> 22:      Assets VDBFKBSC217001
#> 23:      Assets VDBFKBSC217013
#> 24:      Assets VDBFKBSC217010
#> 25:      Assets VDBFKBSC317000
#> 26:      Assets VDBFKBSC317001
#> 27:      Assets VDBFKBSC317013
#> 28:      Assets VDBFKBSC317010
#> 29:      Assets VDBFKBSC507001
#> 30:      Assets VDBFKBSC507013
#> 31:      Assets VDBFKBSC203000
#> 32:      Assets VDBFKBSC507000
#> 33: Liabilities VDBFKBSC830000
#> 34: Liabilities VDBFKBSC917001
#> 35: Liabilities VDBFKBSC917014
#> 36: Liabilities VDBFKBSC917009
#> 37: Liabilities VDBFKBSX917000
#> 38: Liabilities VDBFKBSC127000
#> 39: Liabilities VDBFKBSC117000
#> 40: Liabilities VDBFKBSC403000
#>           group             id
#>                                                                                value
#>                                                                               <char>
#>  1:                                             Loans to euro area residents - total
#>  2:                                              Loans to euro area residents - MFIs
#>  3:                                Loans to euro area residents - general government
#>  4:                                               Loans to other euro area residents
#>  5:   Holdings of securities other than shares issued by euro area residents - total
#>  6:     Collected within the framework of the balance sheet report to the ECB  MFIs.
#>  7: Holdings of securities other than shares issued by euro area general governments
#>  8:     Holdings of securities other than shares issued by other euro area residents
#>  9:                     Holdings of shares and other equity issued by euro area MFIs
#> 10:          Holdings of shares and other equity issued by other euro area residents
#> 11:                                External claims vis-à-vis non-euro area residents
#> 12:        Holdings of shares and other equity issued by euro area residents - total
#> 13:                            Banknotes issued pursuant to ECB Decision ECB/2001/15
#> 14:                                         Liabilities - deposits of euro area MFIs
#> 15:                                                 Liabilities - central government
#> 16:                 Liabilities - other general government/other euro area residents
#> 17:                            Liabilities - deposits of euro area residents - total
#> 18:                                           Liabilities - money market instruments
#> 19:                                             Liabilities - debt securities issued
#> 20:                                                             External liabilities
#> 21:                                             Loans to euro area residents - total
#> 22:                                              Loans to euro area residents - MFIs
#> 23:                                Loans to euro area residents - general government
#> 24:                                               Loans to other euro area residents
#> 25:   Holdings of securities other than shares issued by euro area residents - total
#> 26:     Collected within the framework of the balance sheet report to the ECB  MFIs.
#> 27: Holdings of securities other than shares issued by euro area general governments
#> 28:     Holdings of securities other than shares issued by other euro area residents
#> 29:                     Holdings of shares and other equity issued by euro area MFIs
#> 30:          Holdings of shares and other equity issued by other euro area residents
#> 31:                                External claims vis-à-vis non-euro area residents
#> 32:        Holdings of shares and other equity issued by euro area residents - total
#> 33:                            Banknotes issued pursuant to ECB Decision ECB/2001/15
#> 34:                                         Liabilities - deposits of euro area MFIs
#> 35:                                                 Liabilities - central government
#> 36:                 Liabilities - other general government/other euro area residents
#> 37:                            Liabilities - deposits of euro area residents - total
#> 38:                                           Liabilities - money market instruments
#> 39:                                             Liabilities - debt securities issued
#> 40:                                                             External liabilities
#>                                                                                value
# }
```
