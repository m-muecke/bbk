bbk_user_agent = function() {
  sprintf("bbk/%s", utils::packageVersion("bbk"))
}

bbk_progress = function() {
  isTRUE(getOption("bbk.progress", TRUE))
}

req_bbk_retry = function(req) {
  req_retry(req, max_tries = 3L)
}

base_request = function(url) {
  request(url) |>
    req_user_agent(bbk_user_agent()) |>
    req_bbk_retry() |>
    req_bbk_cache()
}
