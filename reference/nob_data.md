# Fetch Norges Bank (NoB) data

Retrieve time series data from the Norges Bank SDMX Web Service.

## Usage

``` r
nob_data(
  flow,
  key = NULL,
  start_period = NULL,
  end_period = NULL,
  first_n = NULL,
  last_n = NULL
)
```

## Source

<https://www.norges-bank.no/en/topics/Statistics/open-data/>

## Arguments

- flow:

  (`character(1)`)  
  The dataflow to query. See
  [`nob_metadata()`](https://m-muecke.github.io/bbk/reference/nob_metadata.md)
  for available dataflows.

- key:

  (`NULL` \| `character(1)`)  
  The series key to query using dot-separated dimension values (e.g.,
  `"B.USD.NOK.SP"`). Use `+` for multiple values in one dimension (e.g.,
  `"B.USD+EUR.NOK.SP"`). If `NULL`, all data for the flow is returned.
  Default `NULL`.

- start_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  Start date of the data (e.g., `"2024-01-01"` or `2024`). If `NULL`, no
  start date restriction is applied. Default `NULL`.

- end_period:

  (`NULL` \| `character(1)` \| `integer(1)`)  
  End date of the data, in the same format as start_period. If `NULL`,
  no end date restriction is applied. Default `NULL`.

- first_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the start of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

- last_n:

  (`NULL` \| `numeric(1)`)  
  Number of observations to retrieve from the end of the series. If
  `NULL`, no restriction is applied. Default `NULL`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested data.

## See also

Other data:
[`banxico_data()`](https://m-muecke.github.io/bbk/reference/banxico_data.md),
[`bbk_data()`](https://m-muecke.github.io/bbk/reference/bbk_data.md),
[`bbk_series()`](https://m-muecke.github.io/bbk/reference/bbk_series.md),
[`bcb_data()`](https://m-muecke.github.io/bbk/reference/bcb_data.md),
[`bcb_expectations()`](https://m-muecke.github.io/bbk/reference/bcb_expectations.md),
[`bcb_fx_rates()`](https://m-muecke.github.io/bbk/reference/bcb_fx_rates.md),
[`bcb_inflation()`](https://m-muecke.github.io/bbk/reference/bcb_inflation.md),
[`bcb_selic()`](https://m-muecke.github.io/bbk/reference/bcb_selic.md),
[`bcb_top5()`](https://m-muecke.github.io/bbk/reference/bcb_top5.md),
[`bde_data()`](https://m-muecke.github.io/bbk/reference/bde_data.md),
[`bde_latest()`](https://m-muecke.github.io/bbk/reference/bde_latest.md),
[`bdf_codelist()`](https://m-muecke.github.io/bbk/reference/bdf_codelist.md),
[`bdf_data()`](https://m-muecke.github.io/bbk/reference/bdf_data.md),
[`bdf_dataset()`](https://m-muecke.github.io/bbk/reference/bdf_dataset.md),
[`bdp_data()`](https://m-muecke.github.io/bbk/reference/bdp_data.md),
[`bis_data()`](https://m-muecke.github.io/bbk/reference/bis_data.md),
[`boc_data()`](https://m-muecke.github.io/bbk/reference/boc_data.md),
[`boe_data()`](https://m-muecke.github.io/bbk/reference/boe_data.md),
[`boi_data()`](https://m-muecke.github.io/bbk/reference/boi_data.md),
[`boj_data()`](https://m-muecke.github.io/bbk/reference/boj_data.md),
[`cnb_czeonia()`](https://m-muecke.github.io/bbk/reference/cnb_czeonia.md),
[`cnb_data()`](https://m-muecke.github.io/bbk/reference/cnb_data.md),
[`cnb_fx_other_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_other_rates.md),
[`cnb_fx_rates()`](https://m-muecke.github.io/bbk/reference/cnb_fx_rates.md),
[`cnb_pribor()`](https://m-muecke.github.io/bbk/reference/cnb_pribor.md),
[`ecb_data()`](https://m-muecke.github.io/bbk/reference/ecb_data.md),
[`nbp_fx_rates()`](https://m-muecke.github.io/bbk/reference/nbp_fx_rates.md),
[`nbp_gold()`](https://m-muecke.github.io/bbk/reference/nbp_gold.md),
[`onb_data()`](https://m-muecke.github.io/bbk/reference/onb_data.md),
[`snb_data()`](https://m-muecke.github.io/bbk/reference/snb_data.md),
[`srb_cross_rates()`](https://m-muecke.github.io/bbk/reference/srb_cross_rates.md),
[`srb_data()`](https://m-muecke.github.io/bbk/reference/srb_data.md)

## Examples

``` r
# \donttest{
# fetch USD/NOK exchange rate
nob_data("EXR", "B.USD.NOK.SP", last_n = 5L)
#> Error in req_perform(req_error(req_url_query(req_url_path_append(req_headers(base_request(base_url),     accept = accept), resource), ...), body = error_body)): HTTP 522.
#> ℹ <!DOCTYPE html> <!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en-US">
#>   <![endif]--> <!--[if IE 7]> <html class="no-js ie7 oldie" lang="en-US">
#>   <![endif]--> <!--[if IE 8]> <html class="no-js ie8 oldie" lang="en-US">
#>   <![endif]--> <!--[if gt IE 8]><!--> <html class="no-js" lang="en-US">
#>   <!--<![endif]--> <head>
#> 
#> <title>norges-bank.no | 522: Connection timed out</title> <meta charset="UTF-8"
#>   /> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
#>   <meta http-equiv="X-UA-Compatible" content="IE=Edge" /> <meta name="robots"
#>   content="noindex, nofollow" /> <meta name="viewport"
#>   content="width=device-width,initial-scale=1" /> <link rel="stylesheet"
#>   id="cf_styles-css" href="/cdn-cgi/styles/main.css" /> </head> <body> <div
#>   id="cf-wrapper"> <div id="cf-error-details" class="p-0"> <header
#>   class="mx-auto pt-10 lg:pt-6 lg:px-8 w-240 lg:w-full mb-8"> <h1
#>   class="inline-block sm:block sm:mb-2 font-light text-60 lg:text-4xl
#>   text-black-dark leading-tight mr-2"> <span class="inline-block">Connection
#>   timed out</span> <span class="code-label">Error code 522</span> </h1> <div>
#>   Visit <a
#>   href="https://www.cloudflare.com/5xx-error-landing?utm_source=errorcode_522&utm_campaign=data.norges-bank.no"
#>   target="_blank" rel="noopener noreferrer">cloudflare.com</a> for more
#>   information.  </div> <div class="mt-3">2026-08-21 18:55:44 UTC</div>
#>   </header> <div class="my-8 bg-gradient-gray"> <div class="w-240 lg:w-full
#>   mx-auto"> <div class="clearfix md:px-8"> <div id="cf-browser-status" class="
#>   relative w-1/3 md:w-full py-15 md:p-0 md:py-8 md:text-left md:border-solid
#>   md:border-0 md:border-b md:border-gray-400 overflow-hidden float-left
#>   md:float-none text-center"> <div class="relative mb-10 md:m-0">
#> 
#> <span class="cf-icon-browser block md:hidden h-20 bg-center
#>   bg-no-repeat"></span> <span class="cf-icon-ok w-12 h-12 absolute left-1/2
#>   md:left-auto md:right-0 md:top-0 -ml-6 -bottom-4"></span>
#> 
#> </div> <span class="md:block w-full truncate">You</span> <h3
#>   class="md:inline-block mt-3 md:mt-0 text-2xl text-gray-600 font-light
#>   leading-1.3">
#> 
#> Browser
#> 
#> </h3>
#> 
#> <span class="leading-1.3 text-2xl text-green-success">Working</span>
#> 
#> </div> <div id="cf-cloudflare-status" class=" relative w-1/3 md:w-full py-15
#>   md:p-0 md:py-8 md:text-left md:border-solid md:border-0 md:border-b
#>   md:border-gray-400 overflow-hidden float-left md:float-none text-center">
#>   <div class="relative mb-10 md:m-0"> <a
#>   href="https://www.cloudflare.com/5xx-error-landing?utm_source=errorcode_522&#38;utm_campaign=data.norges-bank.no"
#>   target="_blank" rel="noopener noreferrer"> <span class="cf-icon-cloud block
#>   md:hidden h-20 bg-center bg-no-repeat"></span> <span class="cf-icon-ok w-12
#>   h-12 absolute left-1/2 md:left-auto md:right-0 md:top-0 -ml-6
#>   -bottom-4"></span> </a> </div> <span class="md:block w-full
#>   truncate">Ashburn</span> <h3 class="md:inline-block mt-3 md:mt-0 text-2xl
#>   text-gray-600 font-light leading-1.3"> <a
#>   href="https://www.cloudflare.com/5xx-error-landing?utm_source=errorcode_522&utm_campaign=data.norges-bank.no"
#>   target="_blank" rel="noopener noreferrer"> Cloudflare </a> </h3>
#> 
#> <span class="leading-1.3 text-2xl text-green-success">Working</span>
#> 
#> </div> <div id="cf-host-status" class="cf-error-source relative w-1/3 md:w-full
#>   py-15 md:p-0 md:py-8 md:text-left md:border-solid md:border-0 md:border-b
#>   md:border-gray-400 overflow-hidden float-left md:float-none text-center">
#>   <div class="relative mb-10 md:m-0">
#> 
#> <span class="cf-icon-server block md:hidden h-20 bg-center
#>   bg-no-repeat"></span> <span class="cf-icon-error w-12 h-12 absolute left-1/2
#>   md:left-auto md:right-0 md:top-0 -ml-6 -bottom-4"></span>
#> 
#> </div> <span class="md:block w-full truncate">data.norges-bank.no</span> <h3
#>   class="md:inline-block mt-3 md:mt-0 text-2xl text-gray-600 font-light
#>   leading-1.3">
#> 
#> Host
#> 
#> </h3>
#> 
#> <span class="leading-1.3 text-2xl text-red-error">Error</span>
#> 
#> </div> </div> </div> </div>
#> 
#> <div class="w-240 lg:w-full mx-auto mb-8 lg:px-8"> <div class="clearfix"> <div
#>   class="w-1/2 md:w-full float-left pr-6 md:pb-10 md:pr-0 leading-relaxed"> <h2
#>   class="text-3xl font-normal leading-1.3 mb-4">What happened?</h2> <p>The
#>   initial connection between Cloudflare's network and the origin web server
#>   timed out. As a result, the web page can not be displayed.</p> </div> <div
#>   class="w-1/2 md:w-full float-left leading-relaxed"> <h2 class="text-3xl
#>   font-normal leading-1.3 mb-4">What can I do?</h2>
#> 
#> <h3 class="text-15 font-semibold mb-2">If you're a visitor of this
#>   website:</h3> <p class="mb-6">Please try again in a few minutes.</p>
#> 
#> <h3 class="text-15 font-semibold mb-2">If you're the owner of this
#>   website:</h3> <p><span>Contact your hosting provider letting them know your
#>   web server is not completing requests. An Error 522 means that the request
#>   was able to connect to your web server, but that the request didn't finish.
#>   The most likely cause is that something on your server is hogging
#>   resources.</span> <a rel="noopener noreferrer"
#>   href="https://developers.cloudflare.com/support/troubleshooting/http-status-codes/cloudflare-5xx-errors/error-522/">Additional
#>   troubleshooting information here.</a></p> </div> </div> </div>
#> 
#> <div class="cf-error-footer cf-wrapper w-240 lg:w-full py-10 sm:py-4 sm:px-8
#>   mx-auto text-center sm:text-left border-solid border-0 border-t
#>   border-gray-300"> <p class="text-13"> <span class="cf-footer-item sm:block
#>   sm:mb-1">Cloudflare Ray ID: <strong
#>   class="font-semibold">a2ebd9974bb69c55</strong></span> <span
#>   class="cf-footer-separator sm:hidden">&bull;</span> <span
#>   id="cf-footer-item-ip" class="cf-footer-item hidden sm:block sm:mb-1"> Your
#>   IP: <button type="button" id="cf-footer-ip-reveal"
#>   class="cf-footer-ip-reveal-btn">Click to reveal</button> <span class="hidden"
#>   id="cf-footer-ip">20.161.30.225</span> <span class="cf-footer-separator
#>   sm:hidden">&bull;</span> </span> <span class="cf-footer-item sm:block
#>   sm:mb-1"><span>Performance &amp; security by</span> <a rel="noopener
#>   noreferrer"
#>   href="https://www.cloudflare.com/5xx-error-landing?utm_source=errorcode_522&#38;utm_campaign=data.norges-bank.no"
#>   id="brand_link" target="_blank">Cloudflare</a></span>
#> 
#> </p> <script>(function(){function d(){var
#>   b=a.getElementById("cf-footer-item-ip"),c=a.getElementById("cf-footer-ip-reveal");b&&"classList"in
#>   b&&(b.classList.remove("hidden"),c.addEventListener("click",function(){c.classList.add("hidden");a.getElementById("cf-footer-ip").classList.remove("hidden")}))}var
#>   a=document;document.addEventListener&&a.addEventListener("DOMContentLoaded",d)})();</script>
#>   </div><!-- /.error-footer -->
#> 
#> </div> </div> </body> </html>

# fetch multiple exchange rates
nob_data("EXR", "B.USD+EUR+GBP.NOK.SP", start_period = "2024-01-01")
#>             date          key   value   freq base_cur quote_cur  tenor
#>           <Date>       <char>   <num> <char>   <char>    <char> <char>
#>    1: 2024-01-02 B.USD.NOK.SP 10.2971  daily      USD       NOK     SP
#>    2: 2024-01-03 B.USD.NOK.SP 10.3672  daily      USD       NOK     SP
#>    3: 2024-01-04 B.USD.NOK.SP 10.3027  daily      USD       NOK     SP
#>    4: 2024-01-05 B.USD.NOK.SP 10.3553  daily      USD       NOK     SP
#>    5: 2024-01-08 B.USD.NOK.SP 10.3800  daily      USD       NOK     SP
#>   ---                                                                 
#> 1982: 2026-08-17 B.EUR.NOK.SP 10.9235  daily      EUR       NOK     SP
#> 1983: 2026-08-18 B.EUR.NOK.SP 10.9025  daily      EUR       NOK     SP
#> 1984: 2026-08-19 B.EUR.NOK.SP 10.9105  daily      EUR       NOK     SP
#> 1985: 2026-08-20 B.EUR.NOK.SP 10.9025  daily      EUR       NOK     SP
#> 1986: 2026-08-21 B.EUR.NOK.SP 10.8675  daily      EUR       NOK     SP

# fetch policy rate
nob_data("IR", last_n = 5L)
#>           date         key value    freq instrument_type  tenor unit_measure
#>         <Date>      <char> <num>  <char>          <char> <char>       <char>
#>  1: 2021-01-01 A.KPRA.SD.R  0.08  annual            KPRA     SD            R
#>  2: 2022-01-01 A.KPRA.SD.R  1.33  annual            KPRA     SD            R
#>  3: 2023-01-01 A.KPRA.SD.R  3.54  annual            KPRA     SD            R
#>  4: 2024-01-01 A.KPRA.SD.R  4.50  annual            KPRA     SD            R
#>  5: 2025-01-01 A.KPRA.SD.R  4.29  annual            KPRA     SD            R
#>  6: 2026-08-14 B.KPRA.OL.R  5.25   daily            KPRA     OL            R
#>  7: 2026-08-17 B.KPRA.OL.R  5.25   daily            KPRA     OL            R
#>  8: 2026-08-18 B.KPRA.OL.R  5.25   daily            KPRA     OL            R
#>  9: 2026-08-19 B.KPRA.OL.R  5.25   daily            KPRA     OL            R
#> 10: 2026-08-20 B.KPRA.OL.R  5.25   daily            KPRA     OL            R
#> 11: 2026-08-14 B.KPRA.SD.R  4.25   daily            KPRA     SD            R
#> 12: 2026-08-17 B.KPRA.SD.R  4.25   daily            KPRA     SD            R
#> 13: 2026-08-18 B.KPRA.SD.R  4.25   daily            KPRA     SD            R
#> 14: 2026-08-19 B.KPRA.SD.R  4.25   daily            KPRA     SD            R
#> 15: 2026-08-20 B.KPRA.SD.R  4.25   daily            KPRA     SD            R
#> 16: 2026-08-14 B.KPRA.RR.R  3.25   daily            KPRA     RR            R
#> 17: 2026-08-17 B.KPRA.RR.R  3.25   daily            KPRA     RR            R
#> 18: 2026-08-18 B.KPRA.RR.R  3.25   daily            KPRA     RR            R
#> 19: 2026-08-19 B.KPRA.RR.R  3.25   daily            KPRA     RR            R
#> 20: 2026-08-20 B.KPRA.RR.R  3.25   daily            KPRA     RR            R
#> 21: 2026-03-01 M.KPRA.OL.R  5.00 monthly            KPRA     OL            R
#> 22: 2026-04-01 M.KPRA.OL.R  5.00 monthly            KPRA     OL            R
#> 23: 2026-05-01 M.KPRA.OL.R  5.19 monthly            KPRA     OL            R
#> 24: 2026-06-01 M.KPRA.OL.R  5.25 monthly            KPRA     OL            R
#> 25: 2026-07-01 M.KPRA.OL.R  5.25 monthly            KPRA     OL            R
#> 26: 2021-01-01 A.KPRA.OL.R  1.08  annual            KPRA     OL            R
#> 27: 2022-01-01 A.KPRA.OL.R  2.33  annual            KPRA     OL            R
#> 28: 2023-01-01 A.KPRA.OL.R  4.54  annual            KPRA     OL            R
#> 29: 2024-01-01 A.KPRA.OL.R  5.50  annual            KPRA     OL            R
#> 30: 2025-01-01 A.KPRA.OL.R  5.29  annual            KPRA     OL            R
#> 31: 2026-03-01 M.KPRA.RR.R  3.00 monthly            KPRA     RR            R
#> 32: 2026-04-01 M.KPRA.RR.R  3.00 monthly            KPRA     RR            R
#> 33: 2026-05-01 M.KPRA.RR.R  3.19 monthly            KPRA     RR            R
#> 34: 2026-06-01 M.KPRA.RR.R  3.25 monthly            KPRA     RR            R
#> 35: 2026-07-01 M.KPRA.RR.R  3.25 monthly            KPRA     RR            R
#> 36: 2021-01-01 A.KPRA.RR.R -0.92  annual            KPRA     RR            R
#> 37: 2022-01-01 A.KPRA.RR.R  0.33  annual            KPRA     RR            R
#> 38: 2023-01-01 A.KPRA.RR.R  2.54  annual            KPRA     RR            R
#> 39: 2024-01-01 A.KPRA.RR.R  3.50  annual            KPRA     RR            R
#> 40: 2025-01-01 A.KPRA.RR.R  3.29  annual            KPRA     RR            R
#> 41: 2026-03-01 M.KPRA.SD.R  4.00 monthly            KPRA     SD            R
#> 42: 2026-04-01 M.KPRA.SD.R  4.00 monthly            KPRA     SD            R
#> 43: 2026-05-01 M.KPRA.SD.R  4.19 monthly            KPRA     SD            R
#> 44: 2026-06-01 M.KPRA.SD.R  4.25 monthly            KPRA     SD            R
#> 45: 2026-07-01 M.KPRA.SD.R  4.25 monthly            KPRA     SD            R
#>           date         key value    freq instrument_type  tenor unit_measure
#>         <Date>      <char> <num>  <char>          <char> <char>       <char>
# }
```
