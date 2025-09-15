boc_lists <- function(type = "groups") {
  assert_choice(type, c("groups", "series"))
  json <- boc("lists", type)
  lst <- json[[type]]
  dt <- rbindlist(lapply(lst, setDT))
  dt[, id := names(lst)]
  setcolorder(dt, "id")
  dt[]
}

boc_series <- function(name = "FXUSDCAD") {
  assert_string(name, min.chars = 1L)
  json <- boc("series", name)
  dt <- setDT(json$seriesDetails)
  dt
}

#' @examples
#'
#' \dontrun{
#' boc_observations(c("FXUSDCAD", "FXEURCAD"), "2023-01-23", "2023-07-19")
#' }
boc_observations <- function(name = c("FXUSDCAD", "FXEURCAD"), start_date = NULL, end_date = NULL) {
  assert_character(name, min.chars = 1L, min.len = 1L)
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)

  name <- paste(name, collapse = ",")
  json <- boc("observations", name, start_date = start_date, end_date = end_date)

  meta <- rbindlist(lapply(json$seriesDetail, \(x) setDT(x[lengths(x) == 1])))
  meta[, id := names(json$seriesDetail)]

  obs <- json$observations |>
    lapply(function(x) {
      nms <- names(x)
      x |>
        unlist(recursive = FALSE, use.names = FALSE) |>
        setDT() |>
        setnames(nms)
    }) |>
    rbindlist(fill = TRUE) |>
    setnames("d", "date") |>
    melt(
      id.vars = "date",
      variable.name = "id",
      value.name = "rate",
      na.rm = TRUE,
      variable.factor = FALSE
    )

  obs <- obs[meta, on = "id"]
  obs[, let(date = as.Date(date), rate = as.numeric(rate))]
  setcolorder(obs, "id")
  obs[]
}

boc_group_series <- function(name = "FX_RATES_DAILY") {
  assert_string(name, min.chars = 1L)
  json <- boc("groups", name)
  grp <- json$groupDetails
  meta <- setDT(grp[lengths(grp) == 1L])
  setnames(meta, \(x) paste("group", x, sep = "_"))
  series <- rbindlist(lapply(grp$groupSeries, setDT))
  series[, id := names(grp$groupSeries)]
  setnames(series, \(x) paste("series", x, sep = "_"))
  series[, names(meta) := meta]
  cols <- names(series)
  setcolorder(series, cols[startsWith(cols, "group_")])
  series[]
}

boc_group_observations <- function(name = "FX_RATES_DAILY", start_date = NULL, end_date = NULL) {
  assert_string(name, min.chars = 1L)
  start_date <- assert_dateish(start_date, null.ok = TRUE)
  end_date <- assert_dateish(end_date, null.ok = TRUE)

  json <- boc("observations/group", name)
  grp <- setDT(lapply(json$groupDetail, \(x) x %||% NA_character_))
  setnames(grp, \(x) paste("group", x, sep = "_"))
  meta <- rbindlist(lapply(json$seriesDetail, \(x) setDT(x[lengths(x) == 1])))
  meta[, id := names(json$seriesDetail)]
  setnames(meta, \(x) paste("series", x, sep = "_"))

  obs <- json$observations |>
    lapply(function(x) {
      nms <- names(x)
      x |>
        unlist(recursive = FALSE, use.names = FALSE) |>
        setDT() |>
        setnames(nms)
    }) |>
    rbindlist(fill = TRUE) |>
    setnames("d", "date") |>
    melt(
      id.vars = "date",
      variable.name = "id",
      value.name = "rate",
      na.rm = TRUE,
      variable.factor = FALSE
    )
  obs[, let(date = as.Date(date), rate = as.numeric(rate))]
  setnames(obs, "id", "series_id")

  obs <- obs[meta, on = "series_id"]
  obs[, names(grp) := grp]
  obs[]
}

boc <- function(resource, name, ...) {
  request("https://www.bankofcanada.ca/valet") |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_path_append(resource, name, "json") |>
    req_url_query(...) |>
    req_perform() |>
    resp_body_json()
}
