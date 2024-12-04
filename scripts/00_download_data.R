# Libraries
library(docopt)
library(readr)

# Docopt usage string
doc <- "
Usage:
  00_download_data.R --url=<url> --output=<output>

Options:
  --url=<url>      URL of the dataset
  --output=<output> Output path for the downloaded file
"

args <- docopt(doc)

# Download and save the file
download.file(url = args$url, destfile = args$output)

cat("Downloaded file from", args$url, "to", args$output, "\n")