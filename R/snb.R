#' Fetch Swiss National Bank (SNB) data
#'
#' Retrieve time series data from the SNB data portal.
#'
#' @param key (`character(1)`)\cr
#'   The series key to query.
#' @param start_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   Start date of the data.
#' @param end_date (`NULL` | `character(1)` | `Date(1)`)\cr
#'   End date of the data.
#' @param lang (`character(1)`)\cr
#'   Language to query, either `"en"` or `"de"`. Default `"en"`.
#' @returns A [data.table::data.table()] with the requested data.
#' @export
#' @source <https://data.snb.ch/en>
#' @family data
#' @examplesIf curl::has_internet()
#' \donttest{
#' snb_data("rendopar")
#'
#' # or filter for date range
#' snb_data("rendopar", "2020-01-01", "2020-12-31")
#' }
snb_data = function(key, start_date = NULL, end_date = NULL, lang = "en") {
  assert_string(key, min.chars = 1L)
  start_date = assert_dateish(start_date, null.ok = TRUE)
  end_date = assert_dateish(end_date, null.ok = TRUE)
  assert_choice(lang, c("en", "de"))

  json = snb(id = key, fromDate = start_date, toDate = end_date, lang = lang)
  parse_snb_data(json)
}

parse_snb_data = function(json) {
  dt = rbindlist(map(json$timeseries, function(x) {
    meta = as.data.table(x$metadata)
    header = x$header
    cols = map_chr(header, "dim")
    cols = gsub("[[:space:][:punct:]]", "_", tolower(cols))
    item = setNames(map(header, "dimItem"), cols)
    ref = setDT(item)
    vals = x$values
    vals = data.table(
      date = map_chr(vals, "date"),
      value = map_dbl(vals, "value")
    )
    vals[, names(meta) := meta]
    vals[, names(ref) := ref]
  }))

  dt[!nzchar(scale), scale := NA_character_]
  setnames(dt, "frequency", "duration")
  duration = NULL
  dt[, duration := substring(duration, 1L, 3L)]
  freq = sdmx_freq(dt[1L, duration])
  dt[, let(date = parse_date(date, freq), freq = freq)]
  setcolorder(dt, col_order, skip_absent = TRUE)
  dt[]
}

#' Fetch Swiss National Bank (SNB) dimensions
#'
#' Retrieve the dimension structure for a given cube from the SNB data portal.
#'
#' @inheritParams snb_data
#' @returns A [data.table::data.table()] with the dimension structure.
#' @export
#' @source <https://data.snb.ch/en>
#' @family metadata
#' @examplesIf curl::has_internet()
#' \donttest{
#' snb_dimension("rendopar")
#' }
snb_dimension = function(key, lang = "en") {
  assert_string(key, min.chars = 1L)
  assert_choice(lang, c("en", "de"))

  json = snb(key, resource = "dimensions", lang = lang)
  parse_snb_dimension(json)
}

parse_snb_dimension = function(json) {
  rbindlist(map(json$dimensions, function(x) {
    items = x$dimensionItems
    has_children = map_lgl(items, \(item) !is.null(item$dimensionItems))
    if (any(has_children)) {
      items = unlist(map(items, "dimensionItems"), recursive = FALSE)
    }
    data.table(
      dim_id = x$id,
      dim_name = x$name,
      item_id = map_chr(items, "id"),
      item_name = map_chr(items, "name")
    )
  }))
}

#' Fetch Swiss National Bank (SNB) cube metadata
#'
#' Retrieve cube-level metadata (title, frequency, source, publication date) from the SNB data
#' portal.
#'
#' @inheritParams snb_data
#' @returns A single-row [data.table::data.table()] with columns:
#'   \item{key}{The cube key}
#'   \item{title}{The cube title}
#'   \item{sub_title}{The cube subtitle}
#'   \item{publishing_title}{The publishing section title}
#'   \item{public_since_date}{The first publication date}
#'   \item{frequency}{The frequency specification (e.g., `"Day"`, `"Month"`)}
#'   \item{source}{The data source}
#'   \item{has_multiple_sources}{Whether the cube has multiple sources}
#' @export
#' @source <https://data.snb.ch/en>
#' @family metadata
#' @examplesIf curl::has_internet()
#' \donttest{
#' snb_metadata("rendopar")
#' }
snb_metadata = function(key, lang = "en") {
  assert_string(key, min.chars = 1L)
  assert_choice(lang, c("en", "de"))

  json = snb_json(
    "/json/table/getCubeInfo",
    cubeId = key,
    lang = lang,
    isWarehouse = "false",
    pageViewTime = snb_page_view_time()
  )
  parse_snb_metadata(json, key)
}

parse_snb_metadata = function(json, key) {
  dt = data.table(
    id = key,
    title = json$title %||% NA_character_,
    sub_title = json$subTitle %||% NA_character_,
    publishing_title = json$publishingTitle %||% NA_character_,
    public_since_date = as.Date(json$publicSinceDate %||% NA_character_),
    frequency = json$frequencySpecification %||% NA_character_,
    source = json$source %||% NA_character_,
    has_multiple_sources = json$hasMultipleSources %||% NA
  )
  setnames(dt, "id", "key")
  dt
}

#' Fetch Swiss National Bank (SNB) table of contents
#'
#' Retrieve the publication topic tree from the SNB data portal, listing the cubes and charts
#' available under each topic.
#'
#' @param lang (`character(1)`)\cr
#'   Language to query, either `"en"` or `"de"`. Default `"en"`.
#' @returns A [data.table::data.table()] with one row per topic node and columns:
#'   \item{topic_id}{The top-level topic id}
#'   \item{topic}{The top-level topic title}
#'   \item{sub_topic}{The sub-topic title}
#'   \item{cube_id}{The associated cube id (if any)}
#'   \item{chart_id}{The associated chart id (if any)}
#'   \item{doc_id}{The associated documentation id (if any)}
#' @export
#' @source <https://data.snb.ch/en>
#' @family metadata
#' @examplesIf curl::has_internet()
#' \donttest{
#' snb_toc()
#' }
snb_toc = function(lang = "en") {
  assert_choice(lang, c("en", "de"))

  json = snb_json(
    "/json/topic/getTopicsWithRootSubTopics",
    lang = lang,
    pageViewTime = snb_page_view_time(),
    cache = "true"
  )
  parse_snb_toc(json)
}

parse_snb_toc = function(json) {
  topics = json$publicationTopics
  if (length(topics) == 0L) {
    return(data.table(
      topic_id = character(),
      topic = character(),
      sub_topic = character(),
      cube_id = character(),
      chart_id = character(),
      doc_id = character()
    ))
  }
  rbindlist(map(topics, function(top) {
    subs = top$subTopics
    if (length(subs) == 0L) {
      return(data.table(
        topic_id = top$topicId,
        topic = top$title,
        sub_topic = NA_character_,
        cube_id = top$cubeId %||% NA_character_,
        chart_id = top$chartId %||% NA_character_,
        doc_id = top$docId %||% NA_character_
      ))
    }
    data.table(
      topic_id = top$topicId,
      topic = top$title,
      sub_topic = map_chr(subs, \(s) s$title %||% NA_character_),
      cube_id = map_chr(subs, \(s) s$cubeId %||% NA_character_),
      chart_id = map_chr(subs, \(s) s$chartId %||% NA_character_),
      doc_id = map_chr(subs, \(s) s$docId %||% NA_character_)
    )
  }))
}

snb_json = function(path, ...) {
  base_request("https://data.snb.ch") |>
    req_url_path_append(path) |>
    req_url_query(...) |>
    req_error(body = snb_error_body) |>
    req_perform() |>
    resp_body_json(check_type = FALSE)
}

snb = function(id, ..., resource = "data/json", lang = "en") {
  snb_json(sprintf("/api/cube/%s/%s/%s", id, resource, lang), ...)
}

snb_page_view_time = function() {
  snb_json("/json/application/properties")$pageViewTime
}

snb_error_body = function(resp) {
  body = resp_body_string(resp, "UTF-8")
  if (startsWith(body, "<")) {
    return(c("SNB API request failed.", "See docs at <https://data.snb.ch/en>"))
  }
  msg = jsonlite::fromJSON(body)
  docs = "See docs at <https://data.snb.ch/en>"
  c(msg$message, docs)
}
