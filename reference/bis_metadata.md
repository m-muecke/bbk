# Fetch Bank for International Settlements (BIS) metadata

Retrieve metadata from the BIS SDMX Web Service.

## Usage

``` r
bis_metadata(type, id = NULL)
```

## Source

<https://stats.bis.org/api-doc/v1/>

## Arguments

- type:

  (`character(1)`)  
  The type of metadata to query. One of: `"datastructure"`,
  `"dataflow"`, `"codelist"`, or `"concept"`.

- id:

  (`NULL` \| `character(1)`)  
  The id to query. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested metadata.

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
[`ecb_dimension()`](https://m-muecke.github.io/bbk/reference/ecb_dimension.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`nob_dimension()`](https://m-muecke.github.io/bbk/reference/nob_dimension.md),
[`nob_metadata()`](https://m-muecke.github.io/bbk/reference/nob_metadata.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md),
[`snb_dimension()`](https://m-muecke.github.io/bbk/reference/snb_dimension.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
bis_metadata("dataflow")
#> Error in req_perform(req_bbk_cache(req_bbk_retry(req_error(req_url_query(req_url_path_append(req_headers(req_user_agent(request(base_url),     bbk_user_agent()), accept = accept), resource), ...), body = error_body)))): HTTP 406 Not Acceptable.
#> ℹ <?xml version="1.0" ?> <message:Error
#>   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
#>   xmlns:message="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/message"
#>   xmlns:com="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/common">
#>   <message:ErrorMessage code="406"> <com:Text>Unsupported Accept format:
#>   application/vnd.sdmx.genericdata+xml;version=2.1</com:Text>
#>   </message:ErrorMessage> </message:Error>
bis_metadata("datastructure", "BIS_CBPOL")
#> Error in req_perform(req_bbk_cache(req_bbk_retry(req_error(req_url_query(req_url_path_append(req_headers(req_user_agent(request(base_url),     bbk_user_agent()), accept = accept), resource), ...), body = error_body)))): HTTP 406 Not Acceptable.
#> ℹ <?xml version="1.0" ?> <message:Error
#>   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
#>   xmlns:message="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/message"
#>   xmlns:com="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/common">
#>   <message:ErrorMessage code="406"> <com:Text>Unsupported Accept format:
#>   application/vnd.sdmx.genericdata+xml;version=2.1</com:Text>
#>   </message:ErrorMessage> </message:Error>
bis_metadata("codelist", "CL_FREQ")
#> Error in req_perform(req_bbk_cache(req_bbk_retry(req_error(req_url_query(req_url_path_append(req_headers(req_user_agent(request(base_url),     bbk_user_agent()), accept = accept), resource), ...), body = error_body)))): HTTP 406 Not Acceptable.
#> ℹ <?xml version="1.0" ?> <message:Error
#>   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
#>   xmlns:message="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/message"
#>   xmlns:com="http://www.sdmx.org/resources/sdmxml/schemas/v2_1/common">
#>   <message:ErrorMessage code="406"> <com:Text>Unsupported Accept format:
#>   application/vnd.sdmx.genericdata+xml;version=2.1</com:Text>
#>   </message:ErrorMessage> </message:Error>
# }
```
