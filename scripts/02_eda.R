# Libraries
library(docopt)
library(tidyverse)
library(knitr)

# Docopt usage string
doc <- "
Usage:
  02_eda.R --input=<input> --output_prefix=<output_prefix>

Options:
  --input=<input>           Input path of the cleaned data
  --output_prefix=<output_prefix> Prefix for output artifacts
"

args <- docopt(doc)

# Load cleaned data
trees <- read_csv(args$input)

# Generate contingency table
cont_table <- trees %>%
  tabyl(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID)

write_csv(cont_table, paste0(args$output_prefix, "_cont_table.csv"))

cat(kable(cont_table, caption = "Contingency table of tree height by neighborhood"), "\n")

# Create heatmap
heatmap_data <- cont_table %>%
  pivot_longer(cols = -NEIGHBOURHOOD_NAME, names_to = "HEIGHT_RANGE_ID", values_to = "Tree_Count") %>%
  mutate(HEIGHT_RANGE_ID = factor(HEIGHT_RANGE_ID, levels = as.character(0:10)))

heatmap_plot <- ggplot(heatmap_data, aes(x = HEIGHT_RANGE_ID, y = NEIGHBOURHOOD_NAME, fill = Tree_Count)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  theme_minimal()

ggsave(paste0(args$output_prefix, "_heatmap.png"), heatmap_plot)