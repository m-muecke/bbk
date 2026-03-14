# Fetch Sveriges Riksbank (SRb) data

Retrieve time series data from the Sveriges Riksbank SWEA API.

## Usage

``` r
srb_data(series, start_date = NULL, end_date = NULL)
```

## Source

<https://developer.api.riksbank.se/>

## Arguments

- series:

  (`character(1)`)  
  The series ID to query. See
  [`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)
  for available series.

- start_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  Start date of the data (e.g., `"2024-01-01"`). If `NULL`, all
  available data is returned. Default `NULL`.

- end_date:

  (`NULL` \| `Date(1)` \| `character(1)`)  
  End date of the data, in the same format as start_date. If `NULL`,
  data up to the latest available date is returned. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md)

## Examples

``` r
# \donttest{
# fetch USD/SEK exchange rate
srb_data("SEKUSDPMI", start_date = "2024-01-01")
#> Error in req_perform(req_bbk_cache(req_error(req_url_path_append(req_user_agent(request("https://api.riksbank.se/swea/v1"),     bbk_user_agent()), ...), body = srb_error_body))): HTTP 400 Bad Request.
#> ℹ {"type":"https://tools.ietf.org/html/rfc9110#section-15.5.1","title":"One or
#>   more validation errors occurred.","status":400,"errors":{"to":["The value
#>   '20525' is not valid."],"from":["The value '19723' is not
#>   valid."]},"traceId":"00-c2f2f72c784d71d4e5be9d001f1325aa-bb66f392d7c1c2b2-00"}

# fetch EUR/SEK exchange rate
srb_data("SEKEURPMI", start_date = "2024-01-01")
#> Error in req_perform(req_bbk_cache(req_error(req_url_path_append(req_user_agent(request("https://api.riksbank.se/swea/v1"),     bbk_user_agent()), ...), body = srb_error_body))): HTTP 400 Bad Request.
#> ℹ {"type":"https://tools.ietf.org/html/rfc9110#section-15.5.1","title":"One or
#>   more validation errors occurred.","status":400,"errors":{"to":["The value
#>   '20525' is not valid."],"from":["The value '19723' is not
#>   valid."]},"traceId":"00-452ae277c9b3b6ba0f764ee1a07717cb-7004cf3eddbf012f-00"}
# }
```
