library(shiny)
library(DT)


happy <- read.csv("../Data/happiness2017.csv")
vars  <- names(happy)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("App-Template"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            
        # <--- here comes your input ---> #  
        selectInput("var1", "Variable 1", choices = vars, selected = vars[2]),
        selectInput("var2", "Variable 2", choices = vars, selected = vars[3]),
        numericInput("k", "# Cluster"   , value   = 3, min = 1, max = 9)

        ),

        # Show a plot of the generated distribution
        mainPanel(
            
        # <--- here comes your output ---> # 
        plotOutput("kmeans_plot"),
        verbatimTextOutput("results"),
        dataTableOutput("raw_data")
            
        ) # end mainPanel
    )# end sidebarLayout
)# end fluidPage



server <- function(input, output) {
    
    
    
    # Combine the selected variables into a new data frame
    data <- reactive({
        happy[, c(input$var1, input$var2)]
    })
    
    clusters <- reactive({
        kmeans(x = data(),centers = input$k)
    })
    
    
    output$raw_data <- renderDataTable({
        happy
    })
    
    output$results <- renderPrint({
        clusters()
    })
    
    output$kmeans_plot <- renderPlot({
        
        kmeans <- clusters()
        temp   <- data()
        
        
        temp$cluster <-  factor(kmeans$cluster)
        
        temp %>% 
            group_by(cluster) %>% 
            mutate(x_mean = mean(Happiness.Rank))
        
        
        ggplot(temp,aes_string(x = "Happiness.Rank", y = "Happiness.Score", color = "cluster")) +
            geom_point()
        
        
        palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
        
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
