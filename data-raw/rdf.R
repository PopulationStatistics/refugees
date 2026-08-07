library(tidyverse)

fetch_dataset <- function(dataset, ...) {
  read_json <- insistently(jsonlite::fromJSON, rate = rate_delay(60))
  results_per_page <- 10000

  rdf_url <- function(dataset, ...) {
    httr::modify_url("https://api.unhcr.org/",
                     path = glue::glue("/population/v1/{dataset}"),
                     query = rlang::list2(coo_all = "true",
                                          coa_all = "true",
                                          ...))
  }

  fetch_page <- function(page) {
    rdf_url(dataset, limit = results_per_page, page = page, ...) |>
      read_json() |>
      pluck("items") |>
      mutate(across(everything(), as.character))
  }

  pages <-
    rdf_url(dataset, limit = 1, page = 1, ...) |>
    read_json() |>
    pluck("maxPages")

  map(1:ceiling(pages/results_per_page),
      fetch_page,
      .progress = dataset) |>
    list_rbind() |>
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
