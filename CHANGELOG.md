# Issues from peer reviews (Fang, Ziming)
https://github.com/UBC-MDS/data-analysis-review-2024/issues/26#issuecomment-2532688146

## Improvement items for this URL :
- Maybe authors names can be added to the final report.  
   **Solved**: The authors names has been added: https://github.com/UBC-MDS/Dynamic33/commit/0b05023279301b4ecbc18b61be05a95d8b213e23
- Seems there're only 2 steps of data validation -- null check and distinct value check. I guess there should be 11 steps expected.  
   **Working on**:
- Maybe original environment.yml and lockdown file should also be attached.  
   **Not applicable**: For R project both the files are not required

# Issues from peer reviews (Akuja, Gilbert)
https://github.com/UBC-MDS/data-analysis-review-2024/issues/26#issuecomment-2533503286

## Improvement items for this URL :
- The report doesn't include the name of the authors specifically but the group number. The team should state the name of each group member in the report.  
   **Solved**: The authors names has been added: https://github.com/UBC-MDS/Dynamic33/commit/0b05023279301b4ecbc18b61be05a95d8b213e23
- There are very few data validation checks performed on the data. There were supposed to be 11 checks in total. The team can add a few more data validation codes.  
   **Working on**: 
- There are a few typos such as Latex not rendering properly and hence the text appears in the wrong format. Additionally, in official reporting , the team could avoid using abbreviations such as a.k.a.  
   **Working on**: For the typos, Replaced informal abbreviations like "a.k.a." with "also known as." 
- The team can also include a link to the Chi-squared test, incase someone wants to gain more insights on what the test does other than what has been described by the authors.  
   **Solved**: Added a citation link regarding how to use Chi-squared test in R: https://github.com/UBC-MDS/Dynamic33/commit/6acb477b735dae690323e9a675e27b16bfad91b9
- The team should also state the Null and Alternative hypothesis clearly. If possible have a table on the report that shows the result of the test. This will make it easy for reader of the report to know why you came to the conclusion.  
   **Solved**: Added clear hypothesis statements to our analysis, including both null and alternative hypothesis: https://github.com/UBC-MDS/Dynamic33/commit/70959bd496cf47e866d3e49b45c0fbacb5546b04. For the result part, we already included a clear statement regarding our test statistic and p-value.
- Please include the environment.yaml file and instructions of how to create the environment in the README incase a person wants to use a local environment.  
   **Not applicable**: For R project, the environment.yaml file are not required

# Issues from peer reviews (Ikhabi, Sienko)
https://github.com/UBC-MDS/data-analysis-review-2024/issues/26#issuecomment-2537388923

## Improvement items for this URL :
- It would be convenient for someone using the project to download an already built image. Please build the docker image so that it can be downloaded from DockerHub.  
   **Solved**: We already completed this, and please refer to the README usage section
- Running the Rscript commands manually is tedious and prone to error. Please wrap the steps into one script, if possible, to make it more efficient.  
   **Solved**: We are creating a Makefile this week, so that all the steps will be in one script and become more efficient.
- For the final report, please indicate the report authors (names) instead of the group.  
   **Solved**: The authors names has been added: https://github.com/UBC-MDS/Dynamic33/commit/0b05023279301b4ecbc18b61be05a95d8b213e23
- Finally, please include a version of the final report in PDF format.  
   **Not applicable**: We already provided a HTML-rendered report, as well as a HTML link to our final report in README