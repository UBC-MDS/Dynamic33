# Load necessary libraries
library(docopt)
library(tidyverse)

# docopt usage string
doc <- "
Usage:
  00_download_data.R <url> <output_file>

Options:
  <url>         URL of the CSV file to download
  <output_file> Name of the output file to save in data/
"

args <- docopt(doc)

# Validate inputs
tryCatch({
  download.file(args$url, destfile = args$output_file, method = "auto")
}, error = function(e) {
  stop("Error in downloading file: ", e$message)
})

message("Data downloaded successfully.")