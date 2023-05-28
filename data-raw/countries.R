library(tidyverse)
library(rvest)

unhcr_by_region <-
  jsonlite::fromJSON("https://api.unhcr.org/population/v1/regions")$items |>
  transmute(unhcr_region = name,
            data = map(id, \(x) jsonlite::fromJSON(glue::glue("https://api.unhcr.org/population/v1/countries?unhcr_region={x}"))$items)) |>
  unnest(data) |>
  select(iso_code = iso, unhcr_code = code, name, unhcr_region)

unhcr_no_region <-
  anti_join(jsonlite::fromJSON(glue::glue("https://api.unhcr.org/population/v1/countries"))$items,
            unhcr_by_region,
            by = c(code = "unhcr_code")) |>
  transmute(iso_code = case_when(code == "SGS" ~ "SGS",
                                 # FIXME: these are actually codes for machine-readable passports.
                                 # Not part of the ISO standard. Should we keep them?
                                 code == "STA" ~ "XXA",
                                 code == "UKN" ~ "XXX"),
            unhcr_code = code,
            name = if_else(unhcr_code == "KOS", "Kosovo", name),
            unhcr_region = case_when(code == "SGS" ~ "Europe",
                                     code == "KOS" ~ "Europe",
                                     code == "TIB" ~ "Asia and the Pacific"))

unhcr <- bind_rows(unhcr_by_region, unhcr_no_region)

m49 <-
  session("https://unstats.un.org/unsd/methodology/m49/overview") |>
  html_table() |>
  pluck(1) |>
  select(iso_code = X12,
         unsd_region = X4,
         unsd_subregion = X6,
         unsd_imregion = X8)

countries <- left_join(unhcr, m49) |> as_tibble() |> arrange(name)

usethis::use_data(countries, overwrite = TRUE)
