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
  DTOutput("table")

)



server <- function(input, output, session) {
  
  output$table <- renderDT({
    # on click function
    onClick <- sprintf(
      "Shiny.setInputValue('clicl', '%s')",
      rownames(mtcars)
    )
    
    # button with onClick function
    button <- sprintf(
      "<a class = 'btn btn-primary' onClick = '%s'>Click me </a>",
      onClick
    )
    
    
    mtcars$button <- button
    datatable(
      mtcars,
      escape = FALSE,
      selection = "none",
      rownames = FALSE,
      style = "bootstrap"
    )
  })

}

# Run the application 
shinyApp(ui = ui, server = server)
