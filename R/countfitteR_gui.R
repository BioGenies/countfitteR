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
#' @importFrom ggplot2 ggplot geom_bar facet_grid geom_point scale_color_discrete
#' @importFrom shiny runApp
#' @importFrom tools md5sum
#' @author Jaroslaw Chilimoniuk, Stefan Roediger, Michal Burdukiewcz
#' @examples 
#' \dontrun{ 
#' library(shiny)
#' countfitteR_gui()
#' }

countfitteR_gui <- function(){
  shiny::runApp(system.file("countfitteR", package = "countfitteR"))
  # runApp("./inst/countfitteR/")
}
NULL