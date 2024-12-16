library(docopt)
source("R/download_data.R")

# docopt usage string
doc <- "
Usage:
  00_download_data.R <url> <output_file>

Options:
  <url>         URL of the CSV file to download
  <output_file> Name of the output file to save in data/
"

args <- docopt(doc)

main <- function(url, output_file) {
  download_data(url, output_file)
}

main(args$url, args$output_file)