library(shiny)

ui <- fluidPage(
  titlePanel("Scatter Plot: Volume vs Girth"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxInput("show_lm", "Show Regression Line", value = TRUE),
    ),
    
    mainPanel(
      plotOutput("scatterPlot")
    )
  )
)