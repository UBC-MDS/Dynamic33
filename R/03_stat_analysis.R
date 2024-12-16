library(docopt)
source("R/stat_analysis.R")

# docopt usage string
doc <- "
Usage:
  03_stat_analysis.R <input_file> <chi_squared_file>

Options:
  <input_file>         Path to the tree data CSV file
  <chi_squared_file>   Output RDS file for chi-squared test results
"

args <- docopt(doc)

main <- function(input_file, chi_squared_file) {
  stat_analysis(input_file, chi_squared_file)
}
main(args$input_file, args$chi_squared_file)