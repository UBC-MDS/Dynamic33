# Libraries
library(docopt)
library(tidyverse)

# Docopt usage string
doc <- "
Usage:
  03_statistical_test.R --input=<input> --output=<output>

Options:
  --input=<input>  Input path of the data
  --output=<output> Path to save statistical results
"

args <- docopt(doc)

# Load data
trees <- read_csv(args$input)

# Chi-squared test
cont_table <- table(trees$NEIGHBOURHOOD_NAME, trees$HEIGHT_RANGE_ID)
test_results <- chisq.test(cont_table)

cat(capture.output(test_results), "\n")
writeLines(capture.output(test_results), args$output)