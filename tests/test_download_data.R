library(testthat)
source("R/download_data.R")

test_that("data downloads successfully", {
    download_data("https://opendata.vancouver.ca/api/explore/v2.1/catalog/datasets/street-trees/exports/csv?lang=en&timezone=America%2FLos_Angeles&use_labels=true&delimiter=%3B", "tests/street-trees.csv")

    expect_true(fs::file_exists("tests/street-trees.csv"))
})