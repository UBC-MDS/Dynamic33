library(testthat)
source("R/validate_data.R")

test_that("missing or duplicate data throws an error", {
    expect_error(validate_data("tests/broken-tree-data.csv"))
})