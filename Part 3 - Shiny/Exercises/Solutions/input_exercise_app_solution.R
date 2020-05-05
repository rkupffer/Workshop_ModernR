library(shiny)
library(plotly)
library(dplyr)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("App-Template"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            
        # <--- here comes your input ---> #     
            
            fileInput(inputId  = "dataset",
                      label    = "Choose your data set",
                      accept   = c(".csv")),
            
            sliderInput(inputId  = "year",
                        label    = "Choose the range of years to include in the plot",
                        min = 2007, max = 2017, value = c(2013, 2015), step = 1),
            
            selectInput(inputId  = "groupBY",
                        label    = "Select grouping varibale",
                        choices  = c("field","broad_field","major_field"),
                        selected = "broad_field"),
            
            numericInput(inputId = "phd_filter",
                         label   = "Top",
                         value   = 5,
                         min     = 1,
                         max     = 5),
            
            radioButtons(inputId = "palette",
                         label   = "Select your color palette",
                         choices = c("Set1","PiYG","Greys")),
            
            textInput(inputId = "title",
                      label   =  "Label your plot")
            
            
            
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
        
        # <--- here comes your output ---> # 
        plotlyOutput("coolPlot")
            
            
            
        ) # end mainPanel
    )# end sidebarLayout
)# end fluidPage



server <- function(input, output) {
    

    # <--- here goes the rest ---> # 
    output$coolPlot <- renderPlotly({  # note that we are using the plotly render/Output functions from the plotly package
        
    # Get data.frame
    phd   <- read.csv(input$dataset$datapath)  # get uploaded data.frame
    
    # Get range of years
    range_min <- min(input$year)
    range_max <- max(input$year)
    
    # Get grouping variable
    groupBY <- input$groupBY
    # groupBY <- "broad_field"
    
    
    
    
    

    # Filter and tidy df
    phdgrouped <- phd %>% 
                    mutate(group = .data[[groupBY]],
                           group_s = group%>% as.character()) %>% 
                    filter(year >= range_min & year <= range_max) %>% 
                    group_by(group,group_s,year) %>% 
                    summarize(n_phds = sum(n_phds,na.rm=TRUE))  %>% 
                    group_by(group,group_s) %>% 
                    mutate(top_n = sum(n_phds)) %>% 
                    ungroup()
    
    # Find top n fields
    top_n <-  unique(phdgrouped[,c("group_s","top_n")]) %>%
              arrange(desc(top_n)) %>%
              .$group_s %>% 
              unlist()
    
    filter_n <- top_n[1:input$phd_filter]
                    
    
    # Select top n fields only 
    phd_top_n <- phdgrouped %>%
                    filter(group_s %in% filter_n)
        
  
    # Make the plot
    p <- ggplot(phd_top_n, aes(x = factor(year), y = log(n_phds), color = group, group = group)) +
            geom_line() +
            geom_point() +
            scale_fill_brewer(palette=input$palette) +
            labs(fill = groupBY,
                 x     = "Year",
                 y     = "Nr. of PhDs",
                 title = input$title) +
            theme_bw()
        
    ggplotly(p)
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
