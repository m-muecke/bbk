sdmx_request <- function(base_url, resource, error_body, ...) {
  request(base_url) |>
    req_user_agent(bbk_user_agent()) |>
    req_url_path_append(resource) |>
    req_url_query(...) |>
    req_error(body = error_body) |>
    req_bbk_retry() |>
    req_bbk_cache() |>
    req_perform() |>
    resp_body_xml()
}

sdmx_data_resource <- function(flow, key, default_key = NULL) {
  flow <- toupper(flow)
  key <- if (is.null(key)) default_key else paste(toupper(key), collapse = "+")
  paste(c("data", flow, key), collapse = "/")
}

sdmx_freq <- function(code) {
  switch(
    code,
    # ISO 8601 duration codes (BBk)
    P1D = "daily",
    P1M = "monthly",
    P3M = "quarterly",
    P1Y = "annual",
    # SDMX frequency codes (ECB, NoB)
    A = "annual",
    S = "semi-annual",
    Q = "quarterly",
    M = "monthly",
    W = "weekly",
    B = ,
    D = "daily"
  )
}

sdmx_metadata <- function(entries, lang = "en", ns_prefix = "com") {
  xpath <- sprintf(".//%s:Name[@xml:lang='%s']", ns_prefix, lang)
  rbindlist(lapply(entries, function(node) {
    id <- xml2::xml_attr(node, "id")
    nms <- node |>
      xml2::xml_find_all(xpath) |>
      xml2::xml_text()
    data.table(id = id, name = nms)
  }))
}
