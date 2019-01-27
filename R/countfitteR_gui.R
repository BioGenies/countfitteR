#' countfitteR Graphical User Interface
#'
#' @description Launches graphical user interface that analyses given count data and
#' chooses the best performing distribution model.
#' @name countfitteR_gui
#' @section Warning: Any ad-blocking software may cause malfunctions.
#' @keywords count Poisson zero-inflated
#' @export countfitteR_gui
#' @author Jaroslaw Chilimoniuk, Stefan Roediger, Michal Burdukiewcz
#' @examples 
#' if(interactive()){ 
#' countfitteR_gui()
#' }}
#' \donttest{
#' countfitteR_gui()
#' }

countfitteR_gui <- function(){
  shiny::runApp(system.file("countfitteR", package = "countfitteR"))
  # runApp("./inst/countfitteR/")
}
NULL