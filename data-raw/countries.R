library(tidyverse)
library(rvest)

unhcr_by_region <-
  jsonlite::fromJSON("https://api.unhcr.org/population/v1/regions")$items |>
  transmute(unhcr_region = name,
            data = map(id, \(x) jsonlite::fromJSON(glue::glue("https://api.unhcr.org/population/v1/countries?unhcr_region={x}"))$items)) |>
  unnest(data)

unhcr_no_region <-
  anti_join(jsonlite::fromJSON(glue::glue("https://api.unhcr.org/population/v1/countries"))$items,
            unhcr_by_region, by = "code")

corrections <-
  tribble(~code,  ~iso, ~name,                                          ~unhcr_region,
          "SGS", "SGS", "South Georgia and the South Sandwich Islands", "Europe",
          "KOS",    NA, "Kosovo",                                       "Europe",
          "TIB",    NA, "Tibetan",                                      "Asia and the Pacific",
          # FIXME: the next two ISO codes are for machine-readable passports, not countries.
          # Should we keep them? The first appears in the API but the second doesn't.
          "STA", "XXA", "Stateless",                                    NA,
          "UKN", "XXX", "Unknown",                                      NA)

unhcr <-
  bind_rows(unhcr_by_region, unhcr_no_region) |>
  rows_update(corrections, by = "code") |>
  select(iso_code = iso, unhcr_code = code, name, unhcr_region) |>
  arrange(name)

m49 <-
  session("https://unstats.un.org/unsd/methodology/m49/overview") |>
  html_table() |>
  pluck(1) |>
  select(iso_code = X12,
         unsd_region = X4,
         unsd_subregion = X6,
         unsd_imregion = X8)

countries <- left_join(unhcr, m49)

usethis::use_data(countries, overwrite = TRUE)
