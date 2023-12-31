# Chapter 11 jBox app

library(shiny)

ui <- fluidPage(
  tags$head(
    tags$script(
      src = paste0(
        "https://cdn.jsdelivr.net/gh/StephanWagner/",
        "jBox@v1.2.0/dist/jBox.all.min.js"
      )
    ),
    tags$link(
      rel = "stylesheet",
      href = paste0(
        "https://cdn.jsdelivr.net/gh/StephanWagner/",
        "jBox@v1.2.0/dist/jBox.all.min.css"
      )
    )
  ),
  tags$script(
    "Shiny.addCustomMessageHandler(
    type = 'send-notice', function(message) {
      new jBox('Notice', {
        content: message
      });
  });"
    
  )
  
)

server <- function(input, output, session) {
  
  session$sendCustomMessage(
    type = "send-notice", message = "Hi there!"
  )
  
}

shinyApp(ui, server)