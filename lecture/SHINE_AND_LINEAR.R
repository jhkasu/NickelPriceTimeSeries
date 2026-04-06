# have scatter plot Volume ~ Girth
# then find linear regression line

library(shiny)

ui <- fluidPage(
  titlePanel("Scatter Plot: Volume vs Girth"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 20),
      
      sliderInput(inputId = "bw_adjust",
                  label = "Bandwidth adjust:",
                  min = 0.1,
                  max = 2,
                  value = 1,
                  step = 0.2),
      
      checkboxInput("show_lm", "Show Regression Line"),
      
      selectInput('t', 'Example',
                  choices = c(10, 20, 30),
                  selected = 20)
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'darkgray', probability = TRUE,
         border = 'white', xlab = 'waiting time to next eruption',
         main = 'Histogram of waiting times')
    
    if (input$p) {
      dens <- density(x, kernel = 'gaussian', adjust = input$bw_adjust)
      lines(dens, col = 'blue', lwd = 2)
    }
  })
}

shinyApp(ui = ui, server = server)
