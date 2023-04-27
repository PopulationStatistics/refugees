library(tidyverse)

fetch_dataset <- function(dataset) {
  url_template <- "https://api.unhcr.org/population/v1/{dataset}/?limit=10000&year={year}&coo_all=true&coa_all=true"
  read_json <- insistently(jsonlite::fromJSON, rate = rate_delay(60))

  fetch_dataset_year <- function(year) {
    read_json(glue::glue(url_template))$items |>
      as_tibble() |>
      mutate(across(everything(), as.character))
  }

  map(1951:2022, fetch_dataset_year) |> list_rbind() |> type_convert(na = "-")
}

population <- fetch_dataset("population")
demographics <- fetch_dataset("demographics")
asylum_applications <- fetch_dataset("asylum-applications")
asylum_decisions <- fetch_dataset("asylum-decisions")
solutions <- fetch_dataset("solutions")
idmc <- fetch_dataset("idmc")
unrwa <- fetch_dataset("unrwa")

usethis::use_data(population, demographics,
                  asylum_applications, asylum_decisions,
                  solutions, idmc, unrwa,
                  overwrite = TRUE)
