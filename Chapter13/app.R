#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shiny::addResourcePath("www", "www")


ui <- fluidPage(
  # import dependencies
  tags$head(
    tags$link(href = "www/style.css", rel = "stylesheet"),
    tags$script(src = "www/script.js")
  ),
  #gif indicator
  tags$img(src = "www/typing.gif", id = "loading"),
  plotOutput("plot"),
  actionButton("render", "render")

)


server <- function(input, output) {
  output$plot <- renderPlot({
    input$render # redraw on click
    
    # simulate time consuming computations
    Sys.sleep(2)
    plot(cars)
  })

  
}

# Run the application 
shinyApp(ui = ui, server = server)
