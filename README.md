# Dynamic33

## Project Overview
This project explores the geographic distribution of tree heights across Vancouver. By analyzing tree height data, the project aims to uncover patterns, trends, and potential correlations with geographic and environmental factors.

## Contributors
- Derek Rodgers
- Gunisha Kaur
- Jessie Zhang
- Zheng He

## Summary
This analysis involves processing, visualizing, and running a statistical test on data related to tree heights in Vancouver. The goal is to identify patterns that may inform urban planning, environmental studies, or conservation efforts.

## Report
The final report can be found
[here](to_be_updated).

## Dependencies
The following packages are required by the analysis, and all are installed in the `dynamic33` Docker image:
- tidyverse
- janitor
- ggplot2
- knitr
- stringr
- testthat

## Usage

### Setup

> If you are using Windows or Mac, make sure Docker Desktop is running.

1. **Clone the Repository**

Visit the [repository on GitHub](https://github.com/UBC-MDS/Dynamic33) and clone it locally:
  ```bash
   git clone [YOUR SSH URL HERE]
  ```

2. **Build the `dynamic33` Docker Image**

In your terminal, `cd` into the project directory and run
  ```bash
   docker build --platform=linux/amd64 --tag dynamic33 .
  ```

3. **Start the `dynamic33` Docker Image**

In your terminal, run
  ```bash
   docker compose up
  ```

4. **Open RStudio**

Connect to the instance of RStudio that is running in the container by visiting <http://localhost:8787/>. Log in using these credentials:
```
Username: rstudio
Password: Dynamic33
```

5. **Run the Analysis Code**

open a terminal (from the docker rstudio) and run the following commands:

```
Rscript scripts/00_download_data.R "https://opendata.vancouver.ca/api/explore/v2.1/catalog/datasets/street-trees/exports/csv?lang=en&timezone=America%2FLos_Angeles&use_labels=true&delimiter=%3B" "data/street-trees.csv"
```
```
Rscript scripts/01_validate_data.R "data/street-trees.csv"
```
```
Rscript scripts/02_eda.R "data/street-trees.csv" "results/figures/heatmap.png" "results/tables/contingency_table.csv" "results/tables/level_table.csv"
```
```
Rscript scripts/03_stat_analysis.R "results/tables/contingency_table.csv" "results/models/chi_squared_results.rds"
```
```
quarto render report/test-with-bib.qmd --to pdf
```

### Clean up

To shut down the container and clean up the resources, type `Cntrl` + `C` in the terminal where you launched the container, and then type `docker compose rm`

## Licenses
- MIT license
- Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0) license