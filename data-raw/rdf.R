library(tidyverse)

fetch_dataset <- function(dataset) {
  url_template <- "https://api.unhcr.org/population/v1/{dataset}/?limit=10000&year={year}&coo_all=true&coa_all=true"
  read_json <- insistently(jsonlite::fromJSON, rate = rate_backoff(pause_cap = 300, max_times = 10))

  fetch_dataset_year <- function(year) {
    read_json(glue::glue(url_template))$items |>
      as_tibble() |>
      mutate(across(everything(), as.character))
  }

  map(1951:2022, fetch_dataset_year) |> list_rbind() |> type_convert(na = "-")
}

datasets <-
  c("population", "demographics",
    "asylum-applications", "asylum-decisions",
    "solutions", "idmc", "unrwa")

data <- set_names(datasets) |> map(fetch_dataset)

data |> iwalk(~saveRDS(.x, fs::path("data", .y, ext = "rda")))

