library(testthat)
library(readr)
library(fs)
source("R/eda.R")

test_that("eda produces correct outputs", {
  # Prepare paths
  input_file <- "tests/street-trees.csv"
  heatmap_file <- "tests/mock-heatmap.png"
  level_table <- "tests/mock-level-table.csv"

  # Run the function
  eda(input_file, heatmap_file, level_table)

  # Test 1: Ensure level table file is created
  expect_true(file_exists(level_table))

  # Test 2: Check level table structure and row count
  level_data <- read_csv(level_table)
  expect_named(level_data, c("HEIGHT_RANGE", "HEIGHT_RANGE_ID"))
  expect_equal(nrow(level_data), 11) # Expected number of unique height ranges

  # Test 3: Ensure heatmap file is created
  expect_true(file_exists(heatmap_file))

  # Cleanup: Remove generated files after the test
  file_delete(c(level_table, heatmap_file))
})