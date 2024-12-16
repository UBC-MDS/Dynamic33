library(docopt)
source("R/validate_data.R")

# docopt usage string
doc <- "
Usage:
  01_validate_data.R <input_file>

Options:
  <input_file> Path to the input CSV file
"

args <- docopt(doc)

main <- function(input_file) {
  validate_data(input_file)
}
main(args$input_file)