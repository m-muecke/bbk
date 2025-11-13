# Fetch Bank of Canada (BoC) available series or group

Access all available series or groups from the Bank of Canada Valet API.

## Usage

``` r
boc_catalog(type = "groups")
```

## Source

<https://www.bankofcanada.ca/valet/docs>

## Arguments

- type:

  (`character(1)`)  
  Set of data to return. One of `"groups"` or `"series"`. Default
  `"groups"`.

## Value

A
[`data.table::data.table()`](https://rdatatable.gitlab.io/data.table/reference/data.table.html)
with the requested data.

## Examples

``` r
if (FALSE) { # \dontrun{
catalog <- boc_catalog()
head(catalog)

# filter for effective exchange rate series
dt <- catalog[grepl("CEER", label)]
head(dt)
} # }
```
