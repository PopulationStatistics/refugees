library(tidyverse)

fetch_dataset <- function(dataset, ...) {
  read_json <- insistently(jsonlite::fromJSON, rate = rate_delay(60))
  results_per_page <- 10000

  rdf_url <- function(dataset, ...) {
    httr::modify_url("https://api.unhcr.org/",
                     path = glue::glue("/population/v1/{dataset}"),
                     query = rlang::list2(yearFrom = 1951,
                                          yearTo = year(today()),
                                          coo_all = "true",
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
