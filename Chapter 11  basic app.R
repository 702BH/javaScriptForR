# Chapter 11  basic app

library(shiny)

ui <- fluidPage(
  textInput("nameInput", "Your name"),
  textOutput("nameOutput")
)

server <- function(input, output){
  output$nameOutput <- renderText({
    input$nameInput
  })
}

shinyApp(ui, server)
