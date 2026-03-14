# Get or manage the bbk API cache

`bbk_cache_dir()` returns the path where cached API responses are
stored. `bbk_cache_clear()` clears all cached responses.

## Usage

``` r
bbk_cache_dir()

bbk_cache_clear()
```

## Details

The cache is only used when enabled with `options(bbk.cache = TRUE)`.
Cached responses are stored for 1 day by default, but this can be
customized with `options(bbk.cache_max_age = seconds)`.

## Examples

``` r
if (FALSE) { # \dontrun{
# enable caching
options(bbk.cache = TRUE)

# view cache location
bbk_cache_dir()

# clear the cache
bbk_cache_clear()
} # }
```
