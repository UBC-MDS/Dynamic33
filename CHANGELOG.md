# Issues from peer reviews (Fang, Ziming)
https://github.com/UBC-MDS/data-analysis-review-2024/issues/26#issuecomment-2532688146

## Improvement items for this URL :
- Maybe authors names can be added to the final report.  
   **Solved**: The authors names has been added: https://github.com/UBC-MDS/Dynamic33/commit/0b05023279301b4ecbc18b61be05a95d8b213e23
- Seems there're only 2 steps of data validation -- null check and distinct value check. I guess there should be 11 steps expected.  
   **Working on**:
- Maybe original environment.yml and lockdown file should also be attached.  
   **Not applicable**: For R project, environment.yml is not required (as it’s specific to Conda). Instead, we have a renv.lock file, which is already included in the container.

# Issues from peer reviews (Akuja, Gilbert)
https://github.com/UBC-MDS/data-analysis-review-2024/issues/26#issuecomment-2533503286

## Improvement items for this URL :
- The report doesn't include the name of the authors specifically but the group number. The team should state the name of each group member in the report.  
   **Solved**: The authors names has been added: https://github.com/UBC-MDS/Dynamic33/commit/0b05023279301b4ecbc18b61be05a95d8b213e23
- There are very few data validation checks performed on the data. There were supposed to be 11 checks in total. The team can add a few more data validation codes.  
   **Working on**: 
- I would suggest not using abbreviations such as a.k.a. in official reporting.  
   **Solved**: Replaced informal abbreviations like "a.k.a." with "also known as.": https://github.com/UBC-MDS/Dynamic33/commit/6acb477b735dae690323e9a675e27b16bfad91b9 (made commit together with citation link)
- The team can also include a link to the Chi-squared test, incase someone wants to gain more insights on what the test does other than what has been described by the authors.  
   **Solved**: Added a citation link regarding how to use Chi-squared test in R: https://github.com/UBC-MDS/Dynamic33/commit/6acb477b735dae690323e9a675e27b16bfad91b9
- The team should also state the Null and Alternative hypothesis clearly. If possible have a table on the report that shows the result of the test. This will make it easy for reader of the report to know why you came to the conclusion.  
   **Solved**: Added clear hypothesis statements to our analysis, including both null and alternative hypothesis: https://github.com/UBC-MDS/Dynamic33/commit/70959bd496cf47e866d3e49b45c0fbacb5546b04. For the result part, we already included a clear statement regarding our test statistic and p-value.
- Please include the environment.yaml file and instructions of how to create the environment in the README incase a person wants to use a local environment.  
   **Not applicable**: For R project, environment.yml is not required (as it’s specific to Conda). Instead, we have a renv.lock file, which is already included in the container.

# Issues from peer reviews (Ikhabi, Sienko)
https://github.com/UBC-MDS/data-analysis-review-2024/issues/26#issuecomment-2537388923

## Improvement items for this URL :
- It would be convenient for someone using the project to download an already built image. Please build the docker image so that it can be downloaded from DockerHub.  
   **Solved**: We actually provide both options, both a pre-built image for convenient setup, and the command to build the docker image, so that users can build the image on their own to ensure compatibility with specific system. 
- Running the Rscript commands manually is tedious and prone to error. Please wrap the steps into one script, if possible, to make it more efficient.  
   **Solved**: We are creating a Makefile this week, so that all the steps will be in one script and become more efficient.
- For the final report, please indicate the report authors (names) instead of the group.  
   **Solved**: The authors names has been added: https://github.com/UBC-MDS/Dynamic33/commit/0b05023279301b4ecbc18b61be05a95d8b213e23
- Finally, please include a version of the final report in PDF format.  
   **Not applicable**: We already provided a HTML-rendered report, as well as a HTML link to our final report in README

# Issues solved after Gradescope marking from  Milestone-1 
https://github.com/UBC-MDS/vancouver-tree-height-geo-group-33/issues/48#issue-2739389047

## Improvement items for this URL :
- Summary- Does not clearly report the major findings.
   **Solved**: Added more description to the summary of the report focusing on major findings: https://github.com/UBC-MDS/vancouver-tree-height-geo-group-33/commit/1eca62969364dfbfa8279281b3c6c6ceb9abb57d
-  Methods- The data should be reproducibly downloaded from it's source using code in the analysis code document, and a copy saved in the data directory (and ideally in the data/raw subdirectory).
   **Not applicable**: The data is already stored in the data folder. As this project does not involve additional processing, a separate data/raw subdirectory is not necessary.
- Reproducibility- Usage documentation could be improved for clarity (i.e., it is not explicitly clear to the user how to use the project, or some of the wording is confusing, some guessing and/or trial and error had to be performed to run the project).
   **Solved**: The steps to run the project has been added- https://github.com/UBC-MDS/vancouver-tree-height-geo-group-33/commit/26f97fecf020bc922b2082666564c2a46fb4f35d 
               The steps to run thr analysis has been added- https://github.com/UBC-MDS/vancouver-tree-height-geo-group-33/commit/71612e0c58644c3bb8c2ba564e126ddffd7363f1
- Organisation and structure- The analysis notebook (.ipynb or .Qmd or *Rmd) should be in a sub-directory called something sensible, such as analysis, src, notebooks, docs, etc, to aid in the discoverability of this file, and related ones. Having too many files in the project root makes the project organization less understandable and can lead to longer activation times to productivity for collaborators (including future you!).
   **Solved**: We have sub directory for our all files according to the file structure , like our .qmd file is in the report folder , our all scripts are under script folder. Link to the repository- https://github.com/UBC-MDS/vancouver-tree-height-geo-group-33 
- Readme- Summary in README should include high-level interpretation of analysis findings, as well 1-2 sentences on what they might mean (at least at a high-level).
   **Solved**: Summary section has been updated with detailed explaination of analysis findings- https://github.com/UBC-MDS/vancouver-tree-height-geo-group-33/commit/8bd20be45f2e5d699f0b6ac3d24faf9d78f3aff4
- README should include include instructions on how to run the analysis.
   **Solved**: Instructions on how to run analysis has been added: The steps to run the analysis has been added- https://github.com/UBC-MDS/vancouver-tree-height-geo-group-33/commit/71612e0c58644c3bb8c2ba564e126ddffd7363f1

# Issues solved after Gradescope marking from Milestone-2 
https://github.com/UBC-MDS/vancouver-tree-height-geo-group-33/issues/46

## Improvement items for this URL :
No software or packages versions are not pinned in the environment specification file(s). None of the package versions are pinned down in any kind of format like yaml file or Dockerfile
- docker-compose.yml- Tag is missing to specify which version of the image to use

- Reproducibility- Could not reproducibly run the analysis because one package was missing from the provided computational environment.

- Reproducibility- Had to change something in the computational environment files to run the analysis

- Reproducibility- Latest tag was used for docker. This is not ideal because if the user has latest locally, but there is a newer version on the container registry, then Docker will not pull it.

- Reproducibility- Your instructions points to building the "latest" version of the image, this happens when you dont specify its tag and take the default which is latest. Then, when opened the docker container, it requires installation of several latex packages, which should be completed before hand as well

- Environment specification files- None of the package versions are pinned down in any kind of format like yaml file or Dockerfile