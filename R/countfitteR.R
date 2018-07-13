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
#' @examples countfitteR_gui()

library(shiny)
countfitteR_gui <- function(){
  shiny::runApp(system.file("countfitteR", package = "countfitteR"))
  # runApp("./inst/countfitteR/")
  }
