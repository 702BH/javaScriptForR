#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export

gio_stats <- function(g){
  path <- system.file("htmlwidgets/stats", package = "gio")

  dep <- htmltools::htmlDependency(
    name = "stats",
    version = "17",
    src = c(file=path),
    script = "stats.min.js"
  )

  g$dependencies <- append(g$dependencies, list(dep))

  g$x$stats <- TRUE


  return(g)
}


gio_style <- function(g, style = "magic"){
  g$x$style <- style
  return(g)
}

render_gio <- function(g){
  g$x$data <- g$x$data[,c("e", "v", "i")]
  return(g)
}

gio <- function(data, source, target, value, ...,
                width = NULL, height = NULL, elementId = NULL) {


  group <- NULL

  if(crosstalk::is.SharedData(data)){
    group <- data$groupName()
    data <- data$origData()
  }

  data <- dplyr::select(
    data,
    i = {{ source }},
    e = {{ target }},
    v = {{ value }}
  )


  # forward options using x
  x = list(
    configs = list(...),
    data = data,
    style = "default",
    crosstalk = list(group = group)
  )

  attr(x, 'TOJSON_ARGS') <- list(dataframe = "rows")



  # create widget
  htmlwidgets::createWidget(
    name = 'gio',
    x,
    width = width,
    height = height,
    package = 'gio',
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = "100%",
      padding=0,
      browser.fill = TRUE,
    ),
    preRenderHook = render_gio,
    dependencies = crosstalk::crosstalkLibs()
  )
}

#' Shiny bindings for gio
#'
#' Output and render functions for using gio within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a gio
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name gio-shiny
#'
#' @export
gioOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'gio', width, height, package = 'gio')
}

#' @rdname gio-shiny
#' @export
renderGio <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, gioOutput, env, quoted = TRUE)
}
