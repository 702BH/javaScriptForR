#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

addResourcePath("assets", "assets")

dependency_ml5 <- htmltools::htmlDependency(
  name = "ml5",
  version = "0.4.3",
  src = c(href = "https://unpkg.com/ml5@0.4.3/dist/"),
  script = "ml5.min.js"
)


# Define UI for application that draws a histogram
ui <- fluidPage(
  dependency_ml5,
  tags$head(
    tags$script(src = "assets/classify.js")
  ),
  selectInput(
    inputId = "selectBird",
    label = "bird",
    choices = c("flamingo", "lorikeet")
  ),
  actionButton("classify", "Classify"),
  uiOutput("birdDisplay")

)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  output$birdDisplay <- renderUI({
    path <- sprintf("assets/%s.jpg", input$selectBird)
    tags$img(src = path, id = "bird")
  })
  
  observeEvent(input$classify, {
    session$sendCustomMessage("classify",list())
  })

}

# Run the application 
shinyApp(ui = ui, server = server)
