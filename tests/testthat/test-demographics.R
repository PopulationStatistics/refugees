test_that("demographics dataset has more than 0 row", {
  expect_gt(nrow(demographics), 0)
})

test_that("demographics dataset has the correct column names", {
  cn <- c("year", "coo_name", "coo", "coo_iso", "coa_name",
          "coa", "coa_iso", "pop_type", "location", "loc_type", "acc_type",
          "f_0_4", "f_5_11", "f_12_17", "f_18_59",
          "f_60", "f_other", "f_total", "m_0_4", "m_5_11", "m_12_17",
          "m_18_59", "m_60", "m_other", "m_total", "total")
  expect_equal(cn, names(demographics))
})

test_that("demographics dataset columns have the right type", {
  expect_type(demographics[["year"]], "double")
  expect_type(demographics[["coo_name"]], "character")
  expect_type(demographics[["coo"]], "character")
  expect_type(demographics[["coo_iso"]], "character")
  expect_type(demographics[["coa_name"]], "character")
  expect_type(demographics[["coa"]], "character")
  expect_type(demographics[["coa_iso"]], "character")
  expect_type(demographics[["pop_type"]], "character")
  expect_type(demographics[["location"]], "character")
  expect_type(demographics[["loc_type"]], "character")
  expect_type(demographics[["acc_type"]], "character")
  expect_type(demographics[["f_0_4"]], "double")
  expect_type(demographics[["f_5_11"]], "double")
  expect_type(demographics[["f_12_17"]], "double")
  expect_type(demographics[["f_18_59"]], "double")
  expect_type(demographics[["f_60"]], "double")
  expect_type(demographics[["f_other"]], "double")
  expect_type(demographics[["f_total"]], "double")
  expect_type(demographics[["m_0_4"]], "double")
  expect_type(demographics[["m_5_11"]], "double")
  expect_type(demographics[["m_12_17"]], "double")
  expect_type(demographics[["m_18_59"]], "double")
  expect_type(demographics[["m_60"]], "double")
  expect_type(demographics[["m_other"]], "double")
  expect_type(demographics[["m_total"]], "double")
  expect_type(demographics[["total"]], "double")
})
