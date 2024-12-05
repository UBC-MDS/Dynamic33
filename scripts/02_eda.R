# Load necessary libraries
library(docopt)
library(tidyverse)

# docopt usage string
doc <- "
Usage:
  02_eda.R <input_file> <heatmap_file> <contingency_table> <level_table>

Options:
  <input_file>         Path to the input CSV file
  <heatmap_file>       Output PNG file for heatmap
  <contingency_table>  Output CSV file for contingency table
  <level_table>        Output CSV file for level correspondence table
"

args <- docopt(doc)

# Load data
data <- read_csv2(args$input_file)

# Contingency table
cont_table <- data %>%
  count(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID) %>%
  pivot_wider(names_from = HEIGHT_RANGE_ID, values_from = n, values_fill = 0)

write_csv(cont_table, args$contingency_table)

# Level correspondence
level_table <- data %>%
  distinct(HEIGHT_RANGE, HEIGHT_RANGE_ID)

write_csv(level_table, args$level_table)

# Heatmap
heatmap_data <- cont_table %>%
  pivot_longer(-NEIGHBOURHOOD_NAME, names_to = "HEIGHT_RANGE_ID", values_to = "count")

heatmap_plot = ggplot(heatmap_data, aes(x = HEIGHT_RANGE_ID, y = NEIGHBOURHOOD_NAME, fill = count)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  theme_minimal()

#ggsave(filename = args$heatmap_file, plot = heatmap_plot, width = 7, height = 7)

ggsave(filename = args$heatmap_file, plot = heatmap_plot)