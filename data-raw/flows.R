library(tidyverse)
library(readxl)
library(httr)

tmpf <- fs::file_temp(ext = "xlsx")

GET("https://unhcr-web.github.io/refugee-statistics/data/UNHCR_Flow_Data.xlsx",
    write_disk(tmpf))

flows <-
  read_excel(tmpf, sheet = "DATA") |>
  pivot_wider(names_from = PT, values_from = Count) |>
  select(year = Year,
         coo_name = OriginName, coo = origin, coo_iso = OriginISO,
         coa_name = AsylumName, coa = asylum, coa_iso = AsylumISO,
         refugees = REF, asylum_seekers = ASY, returned_refugees = ROC, oip = OIP)

usethis::use_data(flows, overwrite = TRUE)
