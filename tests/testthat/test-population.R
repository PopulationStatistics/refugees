test_that("population dataset has more than 0 row", {
  expect_gt(nrow(population), 0)
})

test_that("population dataset has the correct column names", {
  cn <- c("year", "coo_name", "coo", "coo_iso", "coa_name", "coa", "coa_iso",
          "refugees", "asylum_seekers", "returned_refugees", "idps", "returned_idps",
          "stateless", "ooc", "oip", "hst")
  expect_equal(cn, names(population))
})

test_that("population dataset columns have the right type", {
  expect_type(population[["year"]], "double")
  expect_type(population[["coo_name"]], "character")
  expect_type(population[["coo"]], "character")
  expect_type(population[["coo_iso"]], "character")
  expect_type(population[["coa_name"]], "character")
  expect_type(population[["coa"]], "character")
  expect_type(population[["coa_iso"]], "character")
  expect_type(population[["refugees"]], "double")
  expect_type(population[["asylum_seekers"]], "double")
  expect_type(population[["returned_refugees"]], "double")
  expect_type(population[["idps"]], "double")
  expect_type(population[["returned_idps"]], "double")
  expect_type(population[["stateless"]], "double")
  expect_type(population[["ooc"]], "double")
  expect_type(population[["oip"]], "double")
  expect_type(population[["hst"]], "double")
})
