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
    rbindlist() |>
    setnames("d", "date") |>
    melt(
      id.vars = "date",
      variable.name = "id",
      value.name = "rate",
      variable.factor = FALSE
    )

  obs <- obs[meta, on = "id"]
  setcolorder(obs, "id")
  obs
}

boc <- function(resource, name, ...) {
  request("https://www.bankofcanada.ca/valet") |>
    req_user_agent("bbk (https://m-muecke.github.io/bbk)") |>
    req_url_path_append(resource, name, "json") |>
    req_url_query(...) |>
    req_perform() |>
    resp_body_json()
}
