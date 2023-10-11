# app.R
library(shiny)

boxxy <- function(title, value, color = "#ef476f"){
  list(title = title, value = value, color = color)
}