#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


ui <- fluidPage(
  tags$head(
    tags$script(
      "Shiny.addCustomMessageHandler(
        'jquery-toggle', function(id){
          $('#' + id).toggle(); // id
      });"
    )
  ),
  actionButton("toggle", "Toggle text"),
  h1("This text is shown!", id = "text")

)


server <- function(input, output, session) {
  
  observeEvent(input$toggle, {
    session$sendCustomMessage('jquery-toggle', "text")
  })

}

# Run the application 
shinyApp(ui = ui, server = server)
