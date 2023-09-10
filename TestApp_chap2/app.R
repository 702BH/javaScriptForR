#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# create assets directory and javascript
dir.create("assets")
writeLines("console.log('Hello JS!');", con = "assets/script.js")

# serve the files
addResourcePath(
  # will be accessible at /files
  prefix = "files",
  directoryPath = "assets"
)


# Define UI for application that draws a histogram
ui <- fluidPage(
  tags$head(
    tags$script(src = "files/script.js")
  ),
  h1("R and JavaScript")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
