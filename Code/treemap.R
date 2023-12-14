library(plotly)
library(dplyr)
library(shiny)
budgetData <- read.csv("Data/costs.csv")

# Define UI
ui <- fluidPage(
  titlePanel("Budget Treemap"),
  mainPanel(
    plotlyOutput("treemapPlot")
  )
)

# Define server
server <- function(input, output) {
  # Subset the data
  descriptionSubset <- budgetData$Description[1:103]
  parentSubset <- budgetData$Parent[1:103]
  
  # Render the treemap plot
  output$treemapPlot <- renderPlotly({
    fig <- plot_ly(
      type = "treemap",
      labels = descriptionSubset,
      parents = parentSubset
    )
    fig
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)

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




