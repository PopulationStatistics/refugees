library(tidyverse)
library(readxl)
library(rvest)
library(httr)

tmpf <- fs::file_temp(ext = "xlsx")

GET("https://unhcr-web.github.io/refugee-statistics/0000-Countries/T22.xlsx",
    write_disk(tmpf))

countries <-
  read_excel(tmpf, skip = 4) |>
  select(iso_code = `ISO3 Country code`,
         unhcr_code = `UNHCR Country code`,
         name = `UNSD Name`,
         unhcr_region = `UNHCR Region name`,
         unsd_region = `UNSD Region name`,
         unsd_subregion = `UNSD Sub-region name`,
         sdg_region = `SDG Region name`)

m49 <- session("https://unstats.un.org/unsd/methodology/m49/overview") |> html_table() |> pluck(1)

countries <-
  left_join(countries,
            m49 |> select(iso_code = X12, unsd_imregion = X8)) |>
  relocate(unsd_imregion, .after = unsd_subregion)

usethis::use_data(countries, overwrite = TRUE)
