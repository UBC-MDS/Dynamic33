# Load necessary libraries
library(docopt)
library(testthat)
library(tidyverse)

# docopt usage string
doc <- "
Usage:
  01_validate_data.R <input_file>

Options:
  <input_file> Path to the input CSV file
"

args <- docopt(doc)

# Load data
data <- tryCatch({
  read_csv2(args$input_file)
}, error = function(e) {
  stop("Error in reading input file: ", e$message)
})

# Validation
test_that("Validation checks", {
  expect_true(!anyNA(data$NEIGHBOURHOOD_NAME), "Missing NEIGHBOURHOOD_NAME values")
  expect_true(!anyNA(data$HEIGHT_RANGE), "Missing HEIGHT_RANGE values")
  expect_true(!anyNA(data$HEIGHT_RANGE_ID), "Missing HEIGHT_RANGE_ID values")
  expect_true(n_distinct(data$TREE_ID) == nrow(data), "Duplicates found in TREE_ID")
})

message("Validation passed successfully.")