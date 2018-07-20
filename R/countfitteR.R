#' countfitteR Graphical User Interface
#'
#' Launches graphical user interface that analyses given count data and
#' chooses the best performing distribution model
#'
#' @name countfitteR_gui
#'
#' @section Warning : Any ad-blocking software may cause malfunctions.
#'
#' @keywords count Poisson zero-inflated
#'
#' @export countfitteR_gui
#'
#' @importFrom stats .getXlevels AIC binomial confint delete.response dnbinom dpois filter glm glm.fit lag logLik mad make.link median model.frame model.matrix model.response model.weights na.omit na.pass optim pnorm poisson predict printCoefmat quantile residuals sd terms update
#' @importFrom gridExtra combine
#' @importFrom utils tail

#' @author Jaroslaw Chilimoniuk, Stefan Roediger, Michal Burdukiewcz
#' @docType package
#' @name countfitteR-package
#' @aliases countfitteR
#'  @examples \dontrun{ 
#'  countfitteR_gui()
#'  }

library(shiny)
countfitteR_gui <- function(){
  shiny::runApp(system.file("countfitteR", package = "countfitteR"))
  # runApp("./inst/countfitteR/")
  }

NULL