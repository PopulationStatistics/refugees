test_that("idmc dataset has more than 0 row", {
  expect_gt(nrow(idmc), 0)
})

test_that("idmc dataset has the correct column names", {
  cn <- c("year", "coo_name", "coo", "coo_iso", "coa_name", "coa", "coa_iso", "total")
  expect_equal(cn, names(idmc))
})

test_that("idmc dataset columns have the right type", {
  expect_type(idmc[["year"]], "double")
  expect_type(idmc[["coo_name"]], "character")
  expect_type(idmc[["coo"]], "character")
  expect_type(idmc[["coo_iso"]], "character")
  expect_type(idmc[["coa_name"]], "character")
  expect_type(idmc[["coa"]], "character")
  expect_type(idmc[["coa_iso"]], "character")
  expect_type(idmc[["total"]], "double")
})
