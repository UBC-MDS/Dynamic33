# Load necessary libraries
library(docopt)
library(tidyverse)

# docopt usage string
doc <- "
Usage:
  03_stat_analysis.R <input_file> <chi_squared_file>

Options:
  <input_file>         Path to the contingency table CSV file
  <chi_squared_file>   Output RDS file for chi-squared test results
"

args <- docopt(doc)

# Load contingency table
cont_table <- read_csv(args$input_file) %>%
  column_to_rownames("NEIGHBOURHOOD_NAME")

# Perform chi-squared test
chisq_results <- chisq.test(as.matrix(cont_table), correct = FALSE)

saveRDS(chisq_results, args$chi_squared_file)

message("Chi-squared test completed and saved.")