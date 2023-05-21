test_that("unrwa dataset has more than 0 row", {
  expect_gt(nrow(unrwa), 0)
})

test_that("unrwa dataset has the correct column names", {
  cn <- c("year", "coo_name", "coo", "coo_iso", "coa_name", "coa", "coa_iso", "total")
  expect_equal(cn, names(unrwa))
})

test_that("unrwa dataset columns have the right type", {
  expect_type(unrwa[["year"]], "double")
  expect_type(unrwa[["coo_name"]], "character")
  expect_type(unrwa[["coo"]], "character")
  expect_type(unrwa[["coo_iso"]], "character")
  expect_type(unrwa[["coa_name"]], "character")
  expect_type(unrwa[["coa"]], "character")
  expect_type(unrwa[["coa_iso"]], "character")
  expect_type(unrwa[["total"]], "double")
})
