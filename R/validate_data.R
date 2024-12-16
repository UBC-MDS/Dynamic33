library(testthat)
library(tidyverse)

#' Validate Street Tree Data for Quality and Consistency
#'
#' This function performs validation checks on the input tree dataset to ensure data quality and consistency.
#' It checks for missing values in specific columns and duplicate Tree IDs.
#'
#' @param input_file A string specifying the path to the input CSV file containing tree data.
#'
#' @return This function does not return an object but raises an error if validation checks fail.
#' @examples
#' validate_data("tree_data.csv")
#' @export
validate_data <- function(input_file) {
  # Load data
  data <- tryCatch({
    read_csv2(input_file)
  }, error = function(e) {
    stop("Error in reading input file: ", e$message)
  })

  # Validation
  if (anyNA(data$NEIGHBOURHOOD_NAME)) {
    stop("Missing NEIGHBOURHOOD_NAME values.")
  }
  if (anyNA(data$HEIGHT_RANGE)) {
    stop("Missing HEIGHT_RANGE values.")
  }
  if (anyNA(data$HEIGHT_RANGE_ID)) {
    stop("Missing HEIGHT_RANGE_ID values.")
  }
  if (n_distinct(data$TREE_ID) != nrow(data)) {
    stop("Duplicates found in TREE_ID.")
  }

  message("Validation passed successfully.")
}