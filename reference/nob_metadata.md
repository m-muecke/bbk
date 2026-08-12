# Fetch Norges Bank (NoB) metadata

Retrieve metadata from the Norges Bank SDMX Web Service.

## Usage

``` r
nob_metadata(type, id = NULL, lang = "en")
```

## Source

<https://www.norges-bank.no/en/topics/Statistics/open-data/>

## Arguments

- type:

  (`character(1)`)  
  The type of metadata to query. One of: `"datastructure"`,
  `"dataflow"`, `"codelist"`, or `"concept"`.

- id:

  (`NULL` \| `character(1)`)  
  The id to query. Default `NULL`.

- lang:

  (`character(1)`)  
  Language for names, either `"en"` or `"no"`. Default `"en"`.

## Value

A
[`data.table::data.table()`](https://rdrr.io/pkg/data.table/man/data.table.html)
with the requested metadata.

## See also

Other metadata:
[`banxico_metadata()`](https://m-muecke.github.io/bbk/reference/banxico_metadata.md),
[`bbk_dimension()`](https://m-muecke.github.io/bbk/reference/bbk_dimension.md),
[`bbk_metadata()`](https://m-muecke.github.io/bbk/reference/bbk_metadata.md),
[`bcb_currencies()`](https://m-muecke.github.io/bbk/reference/bcb_currencies.md),
[`bdf_dimension()`](https://m-muecke.github.io/bbk/reference/bdf_dimension.md),
[`bdp_dataset()`](https://m-muecke.github.io/bbk/reference/bdp_dataset.md),
[`bdp_dimension()`](https://m-muecke.github.io/bbk/reference/bdp_dimension.md),
[`bdp_domain()`](https://m-muecke.github.io/bbk/reference/bdp_domain.md),
[`bdp_series()`](https://m-muecke.github.io/bbk/reference/bdp_series.md),
[`bis_dimension()`](https://m-muecke.github.io/bbk/reference/bis_dimension.md),
[`bis_metadata()`](https://m-muecke.github.io/bbk/reference/bis_metadata.md),
[`boi_dimension()`](https://m-muecke.github.io/bbk/reference/boi_dimension.md),
[`boi_metadata()`](https://m-muecke.github.io/bbk/reference/boi_metadata.md),
[`boj_metadata()`](https://m-muecke.github.io/bbk/reference/boj_metadata.md),
[`cnb_dimension()`](https://m-muecke.github.io/bbk/reference/cnb_dimension.md),
[`cnb_indicators()`](https://m-muecke.github.io/bbk/reference/cnb_indicators.md),
[`cnb_snapshots()`](https://m-muecke.github.io/bbk/reference/cnb_snapshots.md),
[`cnb_tree()`](https://m-muecke.github.io/bbk/reference/cnb_tree.md),
[`ecb_dimension()`](https://m-muecke.github.io/bbk/reference/ecb_dimension.md),
[`ecb_metadata()`](https://m-muecke.github.io/bbk/reference/ecb_metadata.md),
[`nob_dimension()`](https://m-muecke.github.io/bbk/reference/nob_dimension.md),
[`onb_dimension()`](https://m-muecke.github.io/bbk/reference/onb_dimension.md),
[`onb_frequency()`](https://m-muecke.github.io/bbk/reference/onb_frequency.md),
[`onb_hierarchy()`](https://m-muecke.github.io/bbk/reference/onb_hierarchy.md),
[`onb_metadata()`](https://m-muecke.github.io/bbk/reference/onb_metadata.md),
[`onb_toc()`](https://m-muecke.github.io/bbk/reference/onb_toc.md),
[`snb_dimension()`](https://m-muecke.github.io/bbk/reference/snb_dimension.md),
[`snb_metadata()`](https://m-muecke.github.io/bbk/reference/snb_metadata.md),
[`snb_toc()`](https://m-muecke.github.io/bbk/reference/snb_toc.md),
[`srb_calendar()`](https://m-muecke.github.io/bbk/reference/srb_calendar.md),
[`srb_series()`](https://m-muecke.github.io/bbk/reference/srb_series.md)

## Examples

``` r
# \donttest{
nob_metadata("dataflow")
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
#>   information.  </div> <div class="mt-3">2026-08-12 20:22:19 UTC</div>
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
#>   class="font-semibold">a2a2300cba45e5b4</strong></span> <span
#>   class="cf-footer-separator sm:hidden">&bull;</span> <span
#>   id="cf-footer-item-ip" class="cf-footer-item hidden sm:block sm:mb-1"> Your
#>   IP: <button type="button" id="cf-footer-ip-reveal"
#>   class="cf-footer-ip-reveal-btn">Click to reveal</button> <span class="hidden"
#>   id="cf-footer-ip">52.186.174.180</span> <span class="cf-footer-separator
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
nob_metadata("datastructure")
#>                            id
#>                        <char>
#>  1:            DSD_ANN_FX_SPU
#>  2:              DSD_ANN_KPRA
#>  3:              DSD_ANN_TEST
#>  4:          DSD_CBC_CALENDAR
#>  5:       DSD_CBC_INSTRUMENTS
#>  6:      DSD_CBC_TRANSACTIONS
#>  7:                   DSD_EXR
#>  8:              DSD_FAUCTION
#>  9:  DSD_FINANCIAL_INDICATORS
#> 10:    DSD_GOVT_GENERIC_RATES
#> 11:              DSD_GOVT_IRS
#> 12:       DSD_GOVT_KEYFIGURES
#> 13:   DSD_GOVT_PRIMARY_MARKET
#> 14: DSD_GOVT_SECONDARY_MARKET
#> 15:       DSD_GOVT_ZEROCOUPON
#> 16:                    DSD_IR
#> 17:    DSD_LIQUIDITY_FORECAST
#> 18:  DSD_LIQUIDITY_STATISTICS
#> 19:          DSD_MONEY_MARKET
#> 20:                DSD_REGNET
#> 21:                   DSD_SEC
#> 22: DSD_SETTLEMENT_STATISTICS
#> 23:           DSD_SHORT_RATES
#>                            id
#>                        <char>
#>                                                     name
#>                                                   <char>
#>  1: Announcement of foreign exchange transaction for SPU
#>  2:                         Key policy rate announcement
#>  3:                        Announcement of test messages
#>  4:            Central bank certificate auction calendar
#>  5:                             Central bank instruments
#>  6:                Central bank certificate transactions
#>  7:                                       Exchange rates
#>  8:              Announcements and results of F-auctions
#>  9:                                 Financial indicators
#> 10:                               Generic interest rates
#> 11:                                  Interest rate swaps
#> 12:                Norwegian government debt key figures
#> 13:                                       Primary market
#> 14:                            Secondary Market turnover
#> 15:             Government securities Zero coupons rates
#> 16:                                          Policy rate
#> 17:             Structural liquidity and total liquidity
#> 18:                                 Liquidity statistics
#> 19:                                 Money Market Figures
#> 20:                                     Regional Network
#> 21:                                           Securities
#> 22:                                Settlement Statistics
#> 23:                                 Short Interest rates
#>                                                     name
#>                                                   <char>
nob_metadata("codelist", "CL_CURRENCY")
#>               id                name
#>           <char>              <char>
#>   1: CL_CURRENCY            Currency
#>   2: CL_CURRENCY     Norwegian krone
#>   3: CL_CURRENCY         Swiss franc
#>   4: CL_CURRENCY           US dollar
#>   5: CL_CURRENCY                Euro
#>  ---                                
#> 183: CL_CURRENCY ADB Unit of Account
#> 184: CL_CURRENCY         No currency
#> 185: CL_CURRENCY         Yemeni rial
#> 186: CL_CURRENCY      Zambian kwacha
#> 187: CL_CURRENCY   Zimbabwean dollar
# }
```
