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

## How to Run the Analysis

1. **Clone the Repository**

Visit the [repository on GitHub](https://github.com/UBC-MDS/Dynamic33) and clone it locally:
  ```bash
   git clone [YOUR SSH URL HERE]
  ```

2. **Start the `dynamic33` Docker Image**

In your terminal, `cd` into the project directory and run
  ```bash
   docker compose up
  ```

3. **Open RStudio**

Connect to the instance of RStudio that is running in the container by visiting <http://localhost:8787/>. Log in using these credentials:
```
Username: rstudio
Password: Dynamic33
```

4. **Run the Analysis Code**

In RStudio, open `vancouver-tree-height-geo.qmd` and run all code chunks.

5. **Render the PDF**

Render the quarto document to a PDF using the `Render` button in RStudio.

## Dependencies
The following packages are required by the analysis, and all are installed in the `dynamic33` Docker image:
- tidyverse
- janitor
- ggplot2
- knitr
- stringr
- testthat

## Licenses
- MIT license
- Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0) license