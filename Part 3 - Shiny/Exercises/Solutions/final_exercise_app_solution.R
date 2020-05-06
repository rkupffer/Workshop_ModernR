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
            tabsetPanel(
                tabPanel("K Means Results", 
                    h2("Plot"), 
                    plotOutput("kmeans_plot"),
                    h2("Results"),
                    verbatimTextOutput("results")
                ),
                tabPanel("Raw Data",
                    dataTableOutput("raw_data")
                )
            ) # tabpanel
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
    
        
        ggplot(temp,aes_string(x = input$var1, y = input$var2, color = "cluster")) +
            geom_point() +
            geom_point(data=data.frame(kmeans$centers),
                       color = "black",
                       shape = 4,
                       size  = 4) +
            theme_bw()
        
        
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
