# vancouver-tree-height-geo-group-33

## Project Overview
This project explores the geographic distribution of tree heights across Vancouver. By analyzing tree height data, the project aims to uncover patterns, trends, and potential correlations with geographic and environmental factors.

## Contributors
- Derek Rodgers
- Gunisha Kaur
- Jessie Zhang
- Zheng He

## Summary
The analysis highlights variability in tree heights across Vancouver, driven by environmental and urban factors. It identifies patterns in tree height distributions that may inform urban planning and conservation strategies. A chi-square test revealed significant associations between tree heights and geographic contexts, emphasizing the need for targeted interventions, such as improving soil quality, enhancing irrigation, and integrating more green spaces to support tree health and growth.

## Report

The final report can be found
[here](https://ubc-mds.github.io/vancouver-tree-height-geo-group-33/report/vancouver-tree-height-geo.html).

## Dependencies
The following packages are required by the analysis, and all are installed in the `dynamic33` Docker image:
- tidyverse
- janitor
- ggplot2
- knitr
- stringr
- testthat
- docopt

## Usage

### Setup

> If you are using Windows or Mac, make sure Docker Desktop is running.

1. **Clone the Repository**

Visit the [repository on GitHub](https://github.com/UBC-MDS/Dynamic33) and clone it locally:

```bash
git clone [YOUR SSH URL HERE]
```

2. **Start the `dynamic33` Docker Image**

In your terminal, run

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

In the docker RStudio instance, open a terminal. Before running the anlysis, run this command to delete all the existing documents or products in the folder structure: 

```bash
make clean
```

Use this command to generate all necessary outputs, such as downloading the data, performing validation, EDA, statistical analysis, and creating the report:

```bash
make all
```

### Unit Tests
Run the following command to see the results of unit tests for all of the functions:

```bash
make test
```

### Clean up

To shut down the container and clean up the resources, type `Cntrl` + `C` in the terminal where you launched the container, and then type `docker compose rm`

## Developer notes

### Adding a new dependency

1. Add the dependency to the `Dockerfile` file on a new branch.

2. Re-build the Docker image locally to ensure it builds and runs properly.

3. Push the changes to GitHub. A new Docker
   image will be built and pushed to Docker Hub automatically.
   It will be tagged with the SHA for the commit that changed the file.

4. Update the `docker-compose.yml` file on your branch to use the new
   container image (make sure to update the tag specifically).

5. Send a pull request to merge the changes into the `main` branch. 

## Licenses
- MIT license
- Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0) license