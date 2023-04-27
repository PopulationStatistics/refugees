library(tidyverse)
library(readxl)
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

usethis::use_data(countries, overwrite = TRUE)
