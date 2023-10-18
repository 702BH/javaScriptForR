# app.R
library(shiny)

boxxy <- function(title, value, color = "#ef476f"){
  list(title = title, value = value, color = color)
}

boxxyOutput <- function(id){
  # the HTML output
  el <- tags$div(
    id = id, class = "boxxy",
    h1(
      id = sprintf("%s-boxxy-value", id),
      class = "boxxy-value"
    ),
    p(
      id = sprintf("%s-boxxy-title", id),
      class = "boxxy-title"
    )
  )
  
  path <- normalizePath("assets")
  
  deps <- list(
    htmltools::htmlDependency(
      name = "boxxy",
      version = "1.0.0",
      src = c(file = path),
      script = c("countup.js", "binding.js"),
      stylesheet = "style.css"
    )
  )
  
  htmltools::attachDependencies(el, deps)
}

renderBoxxy <- function(expr, env = parent.frame(),
                        quoted = FALSE){
  
  # Convert the expression + environment into a function
  func <- shiny::exprToFunction(expr, env, quoted)
  
  function(){
    func()
  }
  
}