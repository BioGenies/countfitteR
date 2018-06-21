#' countfitteR Graphical User Interface
#'
#' Launches graphical user interface that analyses given count data and
#' chooses the best performing distribution model
#'
#' @name countfitteR_gui
#'
#' @section Warning : Any ad-blocking software may cause malfunctions.
#'
#' @keywords
#'
#' @export countfitteR_gui
#'
#' @examples
#' countfitter_gui()

countfitteR_gui <- function(){
  runApp(system.file("countfitteR", package = "countfitteR"))
  # runApp("./inst/countfitteR/")
  }
