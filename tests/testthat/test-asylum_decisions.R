test_that("asylum_decisions dataset has more than 0 row", {
  expect_gt(nrow(asylum_decisions), 0)
})

test_that("asylum_decisions dataset has the correct column names", {
  cn <- c("year", "coo_name", "coo", "coo_iso", "coa_name",
          "coa", "coa_iso", "procedure_type", "dec_level",
          "dec_pc", "dec_recognized", "dec_other", "dec_rejected",
          "dec_closed", "dec_total")
  expect_equal(cn, names(asylum_decisions))
})

test_that("asylum_decisions dataset columns have the right type", {
  expect_type(asylum_decisions[["year"]], "double")
  expect_type(asylum_decisions[["coo_name"]], "character")
  expect_type(asylum_decisions[["coo"]], "character")
  expect_type(asylum_decisions[["coo_iso"]], "character")
  expect_type(asylum_decisions[["coa_name"]], "character")
  expect_type(asylum_decisions[["coa"]], "character")
  expect_type(asylum_decisions[["coa_iso"]], "character")
  expect_type(asylum_decisions[["procedure_type"]], "character")
  expect_type(asylum_decisions[["dec_level"]], "character")
  expect_type(asylum_decisions[["dec_pc"]], "character")
  expect_type(asylum_decisions[["dec_recognized"]], "double")
  expect_type(asylum_decisions[["dec_other"]], "double")
  expect_type(asylum_decisions[["dec_rejected"]], "double")
  expect_type(asylum_decisions[["dec_closed"]], "double")
  expect_type(asylum_decisions[["dec_total"]], "double")
})
