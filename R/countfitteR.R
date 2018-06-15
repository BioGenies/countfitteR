#' countfitteR Graphical User Interface
#'
#' Launches graphical user interface that counts double strand breaks.
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
