# Fetch Banco de Portugal (BdP) data

Retrieve time series data from the BPstat API.

## Usage

``` r
bdp_data(
  domain_id,
  dataset_id,
  series_ids = NULL,
  start_date = NULL,
  end_date = NULL,
  last_n = NULL,
  lang = "en"
)
```

## Source

<https://bpstat.bportugal.pt/data/docs>

## Arguments

- domain_id:

  (`integer(1)`)  
  The domain ID. Use
  [`bdp_domains()`](https://m-muecke.github.io/bbk/reference/bdp_domains.md)
  to list available domains.

- dataset_id:

  (`character(1)`)  
  The dataset ID within the domain.

- series_ids:

  (`NULL` \| [`integer()`](https://rdrr.io/r/base/integer.html))  
  Optional series IDs to filter the dataset.

- start_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  Start date of the data.

- end_date:

  (`NULL` \| `character(1)` \| `Date(1)`)  
  End date of the data.

- last_n:

  (`NULL` \| `integer(1)`)  
  Return only the last `n` observations per series.

- lang:

  (`character(1)`)  
  Language for labels, either `"en"` or `"pt"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## Details

The BPstat API uses a two-step workflow: first look up the series
metadata with
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md)
to find the `domain_id` and `dataset_id`, then use those to fetch the
actual observations.

You can browse available series at the [BPstat
portal](https://bpstat.bportugal.pt).

## See also

Other data:
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nob_data()`](https://m-muecke.github.io/bbk/reference/nob_data.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
# Portuguese GDP (annual, current prices)
bdp_data(54L, "ce3e4e50cda325537eff729ef64037cd", series_ids = 12518356L)
#> Error in req_perform(req_bbk_cache(req_bbk_retry(req_error(req_url_query(req_url_path_append(req_user_agent(request("https://bpstat.bportugal.pt/data/v1"),     bbk_user_agent()), ...), lang = lang, series_ids = series_ids,     obs_since = obs_since, obs_to = obs_to, obs_last_n = obs_last_n,     .multi = "comma"), body = bdp_error_body)))): HTTP 400 Bad Request.
#> ℹ See docs at <https://bpstat.bportugal.pt/data/docs>
# }
```
