# Libraries
library(docopt)
library(tidyverse)

# Docopt usage string
doc <- "
Usage:
  01_clean_transform.R --input=<input> --output=<output>

Options:
  --input=<input>  Input path of the raw data
  --output=<output> Output path for cleaned data
"

args <- docopt(doc)

# Read, clean, and save the dataset
trees <- read_csv2(args$input)

missing_data_check <- trees %>%
  summarise(
    NEIGHBOURHOOD_NAME_missing = sum(is.na(NEIGHBOURHOOD_NAME)),
    HEIGHT_RANGE_missing = sum(is.na(HEIGHT_RANGE)),
    HEIGHT_RANGE_ID_missing = sum(is.na(HEIGHT_RANGE_ID))
  )

duplicate_count <- trees %>%
  select(TREE_ID) %>%
  duplicated() %>%
  sum()

cat(paste("Number of duplicate records:", duplicate_count), "\n")

write_csv(trees, args$output)