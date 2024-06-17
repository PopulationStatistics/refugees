test_that("flows dataset has more than 0 row", {
  expect_gt(nrow(flows), 0)
})

test_that("flows dataset has the correct column names", {
  cn <- c("year", "coo_name", "coo", "coo_iso", "coa_name", "coa", "coa_iso",
          "refugees", "asylum_seekers", "refugee_like", "oip")
  expect_equal(cn, names(flows))
})

test_that("flows dataset columns have the right type", {
  expect_type(flows[["year"]], "double")
  expect_type(flows[["coo_name"]], "character")
  expect_type(flows[["coo"]], "character")
  expect_type(flows[["coo_iso"]], "character")
  expect_type(flows[["coa_name"]], "character")
  expect_type(flows[["coa"]], "character")
  expect_type(flows[["coa_iso"]], "character")
  expect_type(flows[["refugees"]], "double")
  expect_type(flows[["asylum_seekers"]], "double")
  expect_type(flows[["refugee_like"]], "double")
  expect_type(flows[["oip"]], "double")
})
