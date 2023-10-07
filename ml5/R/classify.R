# R.classify.R
#' @export
classify <- function(
    id,
    session = shiny::getDefaultReactiveDomain()
){
  session$sendCustomMessage("ml5-classify", id)
}
