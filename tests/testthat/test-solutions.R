test_that("solutions dataset has more than 0 row", {
  expect_gt(nrow(solutions), 0)
})

test_that("solutions dataset has the correct column names", {
  cn <- c("year", "coo_name", "coo", "coo_iso", "coa_name", "coa", "coa_iso", "returned_refugees", "resettlement", "naturalisation", "returned_idps")
  expect_equal(cn, names(solutions))
})

test_that("solutions dataset columns have the right type", {
  expect_type(solutions[["year"]], "double")
  expect_type(solutions[["coo_name"]], "character")
  expect_type(solutions[["coo"]], "character")
  expect_type(solutions[["coo_iso"]], "character")
  expect_type(solutions[["coa_name"]], "character")
  expect_type(solutions[["coa"]], "character")
  expect_type(solutions[["coa_iso"]], "character")
  expect_type(solutions[["returned_refugees"]], "double")
  expect_type(solutions[["resettlement"]], "double")
  expect_type(solutions[["naturalisation"]], "double")
  expect_type(solutions[["returned_idps"]], "double")
})
