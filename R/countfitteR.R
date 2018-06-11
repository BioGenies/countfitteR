#' countfitteR Graphical User Interface
#'
#' Launches graphical user interface that counts double strand breaks.
#'
#' @section Warning : Any ad-blocking software may cause malfunctions.
#'
#' @param  Location of server.R and ui.R for shiny app to run.
#'
# @keywords
#'
#' @export countfitteR_gui
#'
#' @examples
#' countfitter_gui()

countfitteR_gui <- function(){
  runApp(system.file("countfitteR", package = "countfitteR"))
  # runApp("./inst/countfitteR/")
  }
