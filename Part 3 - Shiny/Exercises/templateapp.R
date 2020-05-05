library(shiny)
library(DT)
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("App-Template"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            
        # <--- here comes your input ---> #     

        ),

        # Show a plot of the generated distribution
        mainPanel(
            
        # <--- here comes your output ---> # 
            
           
            
        ) # end mainPanel
    )# end sidebarLayout
)# end fluidPage



server <- function(input, output) {
    

}

# Run the application 
shinyApp(ui = ui, server = server)
