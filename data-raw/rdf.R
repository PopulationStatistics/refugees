library(tidyverse)
library(httr2)

fetch_dataset <- function(dataset, ...) {
  request("https://api.unhcr.org/") |>
    req_url_path("population", "v1", dataset) |>
    req_url_query(coo_all = "true", coa_all = "true", limit = 10000, ...) |>
    req_retry(max_tries = 10,
              backoff = \(resp) 60) |>
    req_perform_iterative(max_reqs = Inf,
                          next_req = iterate_with_offset(param_name = "page",
                                                         resp_pages = \(resp) resp_body_json(resp)$maxPages)) |>
    resps_data(\(resp) resp_body_json(resp, simplifyVector = T)$items |>
                 mutate(across(everything(), as.character))) |>
    type_convert(na = "-") |>
    select(-coo_id, -coa_id) |>
    as_tibble()
}

population <- fetch_dataset("population")
demographics <- fetch_dataset("demographics",
                              ptype_show = 1, locationDescription_show = 1,
                              locationUR_show = 1, locationAccType_show = 1)
asylum_applications <- fetch_dataset("asylum-applications")
asylum_decisions <- fetch_dataset("asylum-decisions")
solutions <- fetch_dataset("solutions")
idmc <- fetch_dataset("idmc")
unrwa <- fetch_dataset("unrwa")

usethis::use_data(population, demographics,
                  asylum_applications, asylum_decisions,
                  solutions, idmc, unrwa,
                  overwrite = TRUE)
