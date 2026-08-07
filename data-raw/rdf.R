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

check_dataset <- function(new, name, min_rows, min_years) {
  n_yr <- dplyr::n_distinct(new$year)
  if (nrow(new) < min_rows || n_yr < min_years) {
    stop(sprintf("%s: got %d rows / %d years, expected >= %d rows / %d years (API likely returned a truncated result - check for an upstream regression before overwriting the shipped data)",
                 name, nrow(new), n_yr, min_rows, min_years), call. = FALSE)
  }
  message(sprintf("%s: %d rows, %d years - OK", name, nrow(new), n_yr))
  new
}

population <- fetch_dataset("population") |>
  check_dataset("population", 100000, 60)
demographics <- fetch_dataset("demographics",
                              ptype_show = 1, locationDescription_show = 1,
                              locationUR_show = 1, locationAccType_show = 1) |>
  check_dataset("demographics", 150000, 15)
asylum_applications <- fetch_dataset("asylum-applications") |>
  check_dataset("asylum_applications", 90000, 18)
asylum_decisions <- fetch_dataset("asylum-decisions") |>
  check_dataset("asylum_decisions", 85000, 18)
solutions <- fetch_dataset("solutions") |>
  check_dataset("solutions", 12000, 40)
idmc <- fetch_dataset("idmc") |>
  check_dataset("idmc", 600, 25)
unrwa <- fetch_dataset("unrwa") |>
  check_dataset("unrwa", 180, 50)

usethis::use_data(population, demographics,
                  asylum_applications, asylum_decisions,
                  solutions, idmc, unrwa,
                  overwrite = TRUE)
