test_that("countries dataset has more than 0 row", {
  expect_gt(nrow(countries), 0)
})

test_that("countries dataset has the correct column names", {
  cn <- c("iso_code", "unhcr_code", "name", "unhcr_region", "unsd_region", "unsd_subregion", "unsd_imregion", "sdg_region")
  expect_equal(cn, names(countries))
})

test_that("countries dataset columns have the right type", {
  expect_type(countries[["iso_code"]], "character")
  expect_type(countries[["unhcr_code"]], "character")
  expect_type(countries[["name"]], "character")
  expect_type(countries[["unhcr_region"]], "character")
  expect_type(countries[["unsd_region"]], "character")
  expect_type(countries[["unsd_subregion"]], "character")
  expect_type(countries[["unsd_imregion"]], "character")
  expect_type(countries[["sdg_region"]], "character")
})
