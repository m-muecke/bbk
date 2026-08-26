sdmx_request = function(base_url, resource, error_body, ..., accept = NULL) {
  base_request(base_url) |>
    req_headers(accept = accept) |>
    req_url_path_append(resource) |>
    req_url_query(...) |>
    req_error(body = error_body) |>
    req_perform() |>
    resp_body_xml()
}

sdmx_error_body = function(resp, docs = NULL) {
  tryCatch(
    {
      type = resp_content_type(resp)
      msg = if (grepl("[+/]xml$", type)) {
        xml = resp_body_xml(resp, check_type = FALSE)
        trimws(xml2::xml_text(xml2::xml_find_all(xml, "//*[local-name() = 'Text']")))
      } else if (grepl("[+/]json$", type)) {
        json = resp_body_json(resp, check_type = FALSE)
        msg = json$detail %||% json$title %||% json$message
        trimws(sub("[[:space:]:]*<\\?xml.*$", "", msg))
      } else if (identical(type, "text/plain")) {
        resp_body_string(resp, "UTF-8")
      }
      c(msg, docs)
    },
    error = function(e) docs
  )
}

sdmx_data_resource = function(flow, key, default_key = NULL) {
  flow = toupper(flow)
  key = if (is.null(key)) default_key else paste(toupper(key), collapse = "+")
  paste(c("data", flow, key), collapse = "/")
}

sdmx_metadata_type = function(type) {
  switch(
    type,
    datastructure = list(resource = "datastructure", xpath = "//str:DataStructure"),
    dataflow = list(resource = "dataflow", xpath = "//str:Dataflow"),
    codelist = list(resource = "codelist", xpath = "//str:Codelist"),
    concept = list(resource = "conceptscheme", xpath = "//str:ConceptScheme")
  )
}

sdmx_freq = function(code) {
  if (length(code) != 1L || is.na(code)) {
    return(NA_character_)
  }
  switch(
    code,
    # ISO 8601 duration codes (BBk)
    P1D = "daily",
    P7D = "weekly",
    P1M = "monthly",
    P3M = "quarterly",
    P6M = "semi-annual",
    P1Y = "annual",
    # SDMX frequency codes (ECB, NoB)
    A = "annual",
    # the ECB uses the older H alongside S, both are half-yearly
    H = ,
    S = "semi-annual",
    Q = "quarterly",
    M = "monthly",
    W = "weekly",
    B = ,
    D = "daily",
    # unknown codes
    code
  )
}

sdmx_dimension = function(xml, ns_prefix = "str") {
  xpath = sprintf(".//%s:DimensionList/%s:Dimension", ns_prefix, ns_prefix)
  dims = xml2::xml_find_all(xml, xpath)
  codelist_xpath = sprintf(".//%s:Enumeration/Ref", ns_prefix)
  data.table(
    id = xml2::xml_attr(dims, "id"),
    position = as.integer(xml2::xml_attr(dims, "position")),
    codelist = map_chr(dims, \(x) x |> xml2::xml_find_first(codelist_xpath) |> xml2::xml_attr("id"))
  )
}

sdmx_metadata = function(entries, lang = "en", ns_prefix = "com") {
  xpath = sprintf("./%s:Name[@xml:lang='%s']", ns_prefix, lang)
  rbindlist(map(entries, function(node) {
    data.table(
      id = xml2::xml_attr(node, "id"),
      name = node |> xml2::xml_find_first(xpath) |> xml2::xml_text()
    )
  }))
}
