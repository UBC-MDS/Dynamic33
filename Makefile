# Makefile
# Dynamic33, Dec 2024

# Default target
all: report/vancouver-tree-height-geo.html

.PHONY: all clean test validate_data

# Download the data
data/street-trees.csv: R/00_download_data.R
	Rscript R/00_download_data.R \
	"https://opendata.vancouver.ca/api/explore/v2.1/catalog/datasets/street-trees/exports/csv?lang=en&timezone=America%2FLos_Angeles&use_labels=true&delimiter=%3B" \
	"data/street-trees.csv"

# Validate the data
validate_data: data/street-trees.csv R/01_validate_data.R
	Rscript R/01_validate_data.R \
	"data/street-trees.csv"

# Perform EDA (Generate Level table and Heatmap)
results/figures/heatmap.png results/tables/level_table.csv: validate_data data/street-trees.csv R/02_eda.R
	Rscript R/02_eda.R \
	"data/street-trees.csv" \
	"results/figures/heatmap.png" \
	"results/tables/level_table.csv" \
	"results/tables/contingency_table.csv"

# Statistical analysis
results/models/chi_squared_results.rds: data/street-trees.csv R/03_stat_analysis.R
	Rscript R/03_stat_analysis.R \
	"data/street-trees.csv" \
	"results/models/chi_squared_results.rds"

# Render the report
report/vancouver-tree-height-geo.html: report/vancouver-tree-height-geo.qmd \
	results/figures/heatmap.png \
	results/tables/level_table.csv \
	results/tables/contingency_table.csv \
	results/models/chi_squared_results.rds
	quarto render report/vancouver-tree-height-geo.qmd --to html

# Clean intermediate and output files
clean:
	rm -f data/street-trees.csv \
	      results/tables/level_table.csv \
	      results/tables/contingency_table.csv \
	      results/models/chi_squared_results.rds \
	      results/figures/heatmap.png \
	      report/vancouver-tree-height-geo.html

# Run tests
test:
	Rscript tests/test_download_data.R 
	Rscript tests/test_validate_data.R
	Rscript tests/test_eda.R 
	Rscript tests/test_stat_analysis.R
