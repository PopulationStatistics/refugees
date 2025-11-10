library(tidyverse)
library(readxl)
library(curl)


tmpf <- fs::file_temp(ext = "xlsx")

h <- curl::new_handle()

curl::handle_setheaders(
  h,
  "User-Agent"      = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/126.0 Safari/537.36 R/curl",
  "Referer"         = "https://www.unhcr.org/refugee-statistics/",
  "Accept"          = "text/html,application/xhtml+xml,application/xml;q=0.9,application/octet-stream,*/*;q=0.8",
  "Accept-Language" = "en-US,en;q=0.9",
  "Connection"      = "keep-alive"
)


curl::curl_download("https://www.unhcr.org/refugee-statistics/insights/data/UNHCR_Flow_Data.xlsx", tmpf, handle = h, mode = "wb")

flows <-
  read_excel(tmpf, sheet = "DATA") |>
  pivot_wider(names_from = PT, values_from = Count) |>
  select(year = Year,
         coo_name = OriginName, coo = origin, coo_iso = OriginISO,
         coa_name = AsylumName, coa = asylum, coa_iso = AsylumISO,
         refugees = REF, asylum_seekers = ASY, refugee_like = ROC, oip = OIP)

usethis::use_data(flows, overwrite = TRUE)
