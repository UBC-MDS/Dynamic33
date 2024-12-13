# Load necessary libraries
library(docopt)
library(tidyverse)
library(janitor)

# docopt usage string
doc <- "
Usage:
  03_stat_analysis.R <input_file> <chi_squared_file>

Options:
  <input_file>         Path to the tree data CSV file
  <chi_squared_file>   Output RDS file for chi-squared test results
"

args <- docopt(doc)

# Load trees data table
data <- read_csv2(args$input_file)

# Create contingency table for chi-squared test
cont_table <- data |> 
  select(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID) |> 
  mutate(across(everything(), as.factor)) |> 
  tabyl(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID)

# Perform chi-squared test
chisq_results <- chisq.test(cont_table, correct = FALSE)

saveRDS(chisq_results, args$chi_squared_file)

message("Chi-squared test completed and saved.")