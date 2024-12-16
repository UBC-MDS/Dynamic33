library(testthat)
source("R/stat_analysis.R")

test_that("chi-squared test RDS file saves successfully", {
    rds_path <- "tests/chi_squared_results.rds"

    stat_analysis("tests/street-trees.csv", rds_path)

    expect_true(fs::file_exists(rds_path))

    fs::file_delete(c(rds_path))
})
