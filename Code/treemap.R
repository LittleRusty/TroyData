library(plotly)
library(dplyr)
budgetData <- read.csv("Data/costs.csv")

budgetDescriptionCol=budgetData$Description
budgetParentCol=budgetData$Parent

descriptionSubset <- budgetDescriptionCol[1:103]
parentSubset <- budgetParentCol[1:103]


fig <- plot_ly(
  type="treemap",
  labels=descriptionSubset,
  parents=parentSubset,
)
fig




