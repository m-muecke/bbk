# Fetch Bank for International Settlements (BIS) dimensions

Retrieve the dimension structure for a given dataflow from the BIS SDMX
Web Service.

## Usage

``` r
bis_dimension(id)
```

## Source

<https://stats.bis.org/api-doc/v1/>

## Arguments

- id:

  (`character(1)`)  
  The id of the data structure definition to query (e.g.,
  `"BIS_CBPOL"`).

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with columns:

- id:

  The dimension id (e.g., `"FREQ"`, `"REF_AREA"`)

- position:

  The position of the dimension in the series key

- codelist:

  The id of the associated codelist (e.g., `"CL_FREQ"`)

## See also

Other metadata:
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
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
bis_dimension("BIS_CBPOL")
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
