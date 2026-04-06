library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("ANOVA Visualization with Three Groups"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("mean1", "Group 1 Mean:", min = 0, max = 100, value = 50),
      sliderInput("mean2", "Group 2 Mean:", min = 0, max = 100, value = 55),
      sliderInput("mean3", "Group 3 Mean:", min = 0, max = 100, value = 60),
      sliderInput("sd", "Standard Deviation:", min = 1, max = 20, value = 10),
      sliderInput("n", "Sample Size per Group:", min = 10, max = 100, value = 30)
    ),
    
    mainPanel(
      plotOutput("boxplot"),
      br(),
      tableOutput("anova_table")
    )
  )
)

server <- function(input, output) {
  
  generate_data <- reactive({
    set.seed(123)
    group1 <- rnorm(input$n, mean = input$mean1, sd = input$sd)
    group2 <- rnorm(input$n, mean = input$mean2, sd = input$sd)
    group3 <- rnorm(input$n, mean = input$mean3, sd = input$sd)
    
    data.frame(
      value = c(group1, group2, group3),
      group = factor(rep(c("Group 1", "Group 2", "Group 3"), each = input$n))
    )
  })
  
  output$boxplot <- renderPlot({
    df <- generate_data()
    ggplot(df, aes(x = group, y = value, fill = group)) +
      geom_boxplot() +
      theme_minimal() +
      labs(title = "Boxplots of Three Groups", x = "Group", y = "Value") +
      theme(legend.position = "none")
  })
  
  output$anova_table <- renderTable({
    df <- generate_data()
    anova_result <- aov(value ~ group, data = df)
    anova_summary <- summary(anova_result)
    
    data.frame(
      Source = c("Between Groups", "Within Groups"),
      DF = c(anova_summary[[1]]$Df[1], anova_summary[[1]]$Df[2]),
      Sum_Sq = c(anova_summary[[1]]$`Sum Sq`[1], anova_summary[[1]]$`Sum Sq`[2]),
      Mean_Sq = c(anova_summary[[1]]$`Mean Sq`[1], anova_summary[[1]]$`Mean Sq`[2]),
      F_value = c(anova_summary[[1]]$`F value`[1], NA),
      P_value = c(anova_summary[[1]]$`Pr(>F)`[1], NA)
    )
  })
}

shinyApp(ui = ui, server = server)