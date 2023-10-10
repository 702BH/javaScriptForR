#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)



ui <- fluidPage(
  DTOutput("table"),
  strong("Clicked Model:"),
  verbatimTextOutput("model")

)



server <- function(input, output, session) {
  
  output$table <- renderDT({
    # on click function
    onclick <- paste0("Shiny.setInputValue('click', '", rownames(mtcars), "')")
    
    # button with onClick function
    button <- paste0("<a class='btn btn-primary' onClick=\"", onclick, "\">Click me</a>")
    
    # add button to data.frame
    mtcars$button <- button
    
    datatable(
      mtcars, 
      escape = FALSE, 
      selection = "none", 
      rownames = FALSE, 
      style = "bootstrap"
    )
  })
  
  output$model <- renderPrint({
    print(input$click)
  })

}

# Run the application 
shinyApp(ui = ui, server = server)
