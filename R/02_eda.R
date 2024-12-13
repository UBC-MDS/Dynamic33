# Load necessary libraries
library(docopt)
library(tidyverse)
library(janitor)

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

# Load data
data <- read_csv2(args$input_file)

# Level correspondence check
level_table <- data |>
  distinct(HEIGHT_RANGE, HEIGHT_RANGE_ID) |>
  arrange(HEIGHT_RANGE_ID)

write_csv(level_table, args$level_table)

# Create contingency table for the heatmap
cont_table <- data |> 
  select(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID) |> 
  mutate(across(everything(), as.factor)) |> 
  tabyl(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID)

# Heatmap
heatmap_data <- cont_table |> 
  pivot_longer(
    cols = -NEIGHBOURHOOD_NAME,
    names_to = "HEIGHT_RANGE_ID",
    values_to = "Tree_Count"
  ) |> 
  mutate(
    HEIGHT_RANGE_ID = factor(HEIGHT_RANGE_ID,
                             levels = as.character(0:10))
  )

heatmap_plot <- ggplot(heatmap_data, aes(x = HEIGHT_RANGE_ID,
                         y = NEIGHBOURHOOD_NAME,
                         fill = Tree_Count)) +
  geom_tile() +
  scale_fill_gradient(low = "white",
                      high = "blue") +
  labs(
    x = "Height Category ID",
    y = "Neighbourhood",
    fill = "Tree Count"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(filename = args$heatmap_file, plot = heatmap_plot)

message("Heatmap and level correspondence table saved successfully.")