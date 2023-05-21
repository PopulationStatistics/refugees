test_that("asylum_applications dataset has more than 0 row", {
  expect_gt(nrow(asylum_applications), 0)
})

test_that("asylum_applications dataset has the correct column names", {
  cn <- c("year", "coo_name", "coo", "coo_iso", "coa_name", "coa", "coa_iso",
          "procedure_type", "app_type", "dec_level", "app_pc", "applied")
  expect_equal(cn, names(asylum_applications))
})

test_that("asylum_applications dataset columns have the right type", {
  expect_type(asylum_applications[["year"]], "double")
  expect_type(asylum_applications[["coo_name"]], "character")
  expect_type(asylum_applications[["coo"]], "character")
  expect_type(asylum_applications[["coo_iso"]], "character")
  expect_type(asylum_applications[["coa_name"]], "character")
  expect_type(asylum_applications[["coa"]], "character")
  expect_type(asylum_applications[["coa_iso"]], "character")
  expect_type(asylum_applications[["procedure_type"]], "character")
  expect_type(asylum_applications[["app_type"]], "character")
  expect_type(asylum_applications[["dec_level"]], "character")
  expect_type(asylum_applications[["app_pc"]], "character")
  expect_type(asylum_applications[["applied"]], "double")
})
