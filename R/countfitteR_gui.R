#' countfitteR Graphical User Interface
#'
#' @description Launches graphical user interface that analyses given count data and
#' chooses the best performing distribution model.
#' @name countfitteR_gui
#' @section Warning: Any ad-blocking software may cause malfunctions.
#' @keywords count Poisson zero-inflated
#' @export countfitteR_gui
#' @author Jaroslaw Chilimoniuk, Stefan Roediger, Michal Burdukiewcz
#' @importFrom tools package_dependencies
#' @importFrom utils available.packages
#' @examples 
#' if(interactive()) { 
#'   countfitteR_gui()
#' }

countfitteR_gui <- function(){
  countfitteR_suggests <- package_dependencies("countfitteR", 
                                               which = "Suggests")[["countfitteR"]]
  
  if(!all(countfitteR_suggests %in% rownames(available.packages()))) {
    stop(paste0("The countfitteR GUI requires following packages: ", 
                paste0(countfitteR_suggests, collapse = ", ")))
  }
  runApp(system.file("countfitteR", package = "countfitteR"))
}
