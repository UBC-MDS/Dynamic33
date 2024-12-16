library(tidyverse)
library(janitor)

#' Perform Exploratory Data Analysis (EDA) on Street Tree Data
#'
#' This function performs exploratory data analysis by creating a heatmap, a level correspondence table, and a contingency table 
#' for the provided tree dataset. The outputs are saved to specified files.
#'
#' @param input_file A string specifying the path to the input CSV file containing tree data.
#' @param heatmap_file A string specifying the path to save the generated heatmap PNG file.
#' @param level_table A string specifying the path to save the level correspondence table CSV file.
#' @param contingency_table A string specifying the path to save the contingency table CSV file.
#' 
#' @return This function does not return an object but saves outputs to files and displays a success message.
#' @examples
#' eda("street-trees.csv", "heatmap.png", "level_table.csv")
#' @export
eda <- function(input_file, heatmap_file, level_table, contingency_table) {
  # Load data
  data <- read_csv2(input_file)

  # Level correspondence check
  level_data <- data |>
    distinct(HEIGHT_RANGE, HEIGHT_RANGE_ID) |>
    arrange(HEIGHT_RANGE_ID)

  write_csv(level_data, level_table)

  # Create contingency table for the heatmap
  cont_table <- data |> 
    select(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID) |> 
    mutate(across(everything(), as.factor)) |> 
    tabyl(NEIGHBOURHOOD_NAME, HEIGHT_RANGE_ID)

  write_csv(cont_table, contingency_table) # Save it out for use in the qmd report

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

  ggsave(filename = heatmap_file, plot = heatmap_plot)

  message("Heatmap, level correspondence table, and contingency table saved successfully.")
}