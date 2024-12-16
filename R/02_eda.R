library(docopt)
source("R/eda.R")

# docopt usage string
doc <- "
Usage:
  02_eda.R <input_file> <heatmap_file> <level_table>

Options:
  <input_file>         Path to the input CSV file
  <heatmap_file>       Output PNG file for heatmap
  <level_table>        Output CSV file for level correspondence table
"

args <- docopt(doc)


main <- function(input_file, heatmap_file, level_table) {
  eda(input_file, heatmap_file, level_table)
}

main(args$input_file, args$heatmap_file, args$level_table)