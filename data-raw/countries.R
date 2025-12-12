library(tidyverse)
library(httr2)
library(rvest)

unhcr <-
  request("https://www.unhcr.org/refugee-statistics/insights/data/Annex_Countries.csv") |>
  req_headers(Referer = "https://www.unhcr.org/") |>
  req_perform() |>
  resp_body_string() |>
  read_csv() |>
  select(iso_code = ISO3_Country_Code, unhcr_code = UNHCR_Country_Code,
         name = UNSD_Name, unhcr_region = UNHCR_Region_Name)

unsd <-
  request("https://unstats.un.org/unsd/methodology/m49/overview") |>
  req_perform() |>
  resp_body_string() |>
  read_html() |>
  html_table() |>
  pluck(1) |>
  select(iso_code = X12,
         unsd_region = X4,
         unsd_subregion = X6,
         unsd_imregion = X8)

# Present in the population table but not the GT annexes
tib <- tibble(unhcr_code = "TIB",
              iso_code = "TIB",
              name = "Tibetan",
              unhcr_region = "Asia and the Pacific",
              unsd_region = "Asia",
              unsd_subregion = "Eastern Asia")

# Country name spelled differently between annex and data tables
cuw <- tibble(unhcr_code = "CUW",
              name = "Curacao")

# ISO code is recorded as "UNK" in data tables. "UKN" in the annexes.
ukn <- tibble(unhcr_code = "UKN",
              iso_code = "UNK")

countries <-
  left_join(unhcr, unsd) |>
  rows_upsert(tib) |>
  rows_upsert(cuw) |>
  rows_upsert(ukn)

usethis::use_data(countries, overwrite = TRUE)
