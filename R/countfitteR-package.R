if(getRversion() >= "2.15.1")  utils::globalVariables(c("x", "value", "n", "model", "lambda",
                                                        "upper", "lower", "lowest_BIC", "occs"))


#' countfitteR - a framework for fitting count distributions in R
#' 
#' @description The \code{countfitteR} package is a toolbox for the analysis of
#' count data.
#' 
#' @section Acknowledgements:
#' countfitteR is a wrapper around existing count models in R. To standardize error messages 
#' and ease up the integration, we slightly modified the \code{\link[pscl]{zeroinfl}} 
#' function by Achim Zeileis.
#' 
#' @importFrom stats .getXlevels AIC binomial confint delete.response dnbinom dpois filter 
#' glm glm.fit lag logLik mad make.link median model.frame model.matrix model.response 
#' model.weights na.omit na.pass optim pnorm poisson predict printCoefmat quantile residuals 
#' sd terms update
#' @importFrom gridExtra combine
#' @importFrom utils tail
#' @importFrom ggplot2 ggplot aes geom_bar facet_grid geom_point scale_color_discrete
#' @importFrom shiny runApp
#' @importFrom MASS glm.nb
#' @author Jaroslaw Chilimoniuk, Stefan Roediger, Michal Burdukiewcz
#' @docType package
#' @name countfitteR-package
#' @aliases countfitteR
NULL