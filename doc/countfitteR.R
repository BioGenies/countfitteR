## ----eval=TRUE, echo=TRUE, warning=FALSE--------------------------------------
# Load countfitteR package
library(countfitteR)

# Assign the csv file to filename
data("case_study")

processed_counts <- process_counts(case_study)

fit_counts(processed_counts, model = "all")

