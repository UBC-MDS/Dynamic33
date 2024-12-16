library(tidyverse)
library(janitor)

#' Perform Statistical Analysis on Street Tree Data
#'
#' This function computes a chi-squared test on the contingency table derived from the tree dataset. 
#' The results are saved to an RDS file for later use.
#'
#' @param input_file A string specifying the path to the input CSV file containing tree data.
#' @param chi_squared_file A string specifying the path to save the chi-squared test results as an RDS file.
#'
#' @return This function does not return an object but saves the chi-squared test results to a file.
#' @examples
#' stat_analysis("tree_data.csv", "chi_squared_results.rds")
#' @export
stat_analysis <- function(input_file, chi_squared_file) {
  # Load trees data table
  data <- read_csv2(input_file)

  # Create contingency table for chi-squared test
  cont_table <- data |> 
    select(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID) |> 
    mutate(across(everything(), as.factor)) |> 
    tabyl(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID)

  # Perform chi-squared test
  chisq_results <- chisq.test(cont_table, correct = FALSE)

  saveRDS(chisq_results, chi_squared_file)

  message("Chi-squared test completed and saved.")
}