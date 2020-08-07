
get_count_names <- function(fitlist) {
  model_names <- strsplit(names(fitlist), "_")
  vapply(model_names, function(single_name) paste0(single_name[-length(single_name)], collapse = "_"), "a")
}

#' @title Summary of estimates
#'
#' @name summary_fitlist
#' @description Counts are fitted to model(s) using the count name as the explanatory variable.
#' Estimates are presented in the table below along with the BIC values of their models.
#' Estimated coefficients of models (\code{lambda} for all distributions, \code{theta} for NB and ZINB, 
#' \code{r} for ZIP and ZINB).
#' @inheritParams compare_fit
#' @return Data frame with summarised results of all distribution models. 
#' \itemize{
#'  \item{Count: }{the name of the original count.}
#'  \item{lambda: }{\eqn{\lambda} - Poisson mean, lower and upper confidence intervals.}
#'  \item{BIC: }{Bayesian information criterion}
#'  \item{theta: }{\eqn{\theta} - dispersion parameter}
#'  \item{r: }{probability of excess zeros.}
#' }
#' @seealso \code{\link{fit_counts}}
#' @examples
#' df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
#' fc <- fit_counts(df, model = "all") 
#' summary_fitlist(fc) 
#' @export

summary_fitlist <- function(fitlist) {

  CIs <- do.call(rbind, lapply(fitlist, function(single_fit) {
    if(is.null(single_fit)) {
      c(lamba = NA, lower = NA, upper = NA)
    } else {
      single_fit[["confint"]]["lambda", ]
    }
  }))
  
  data.frame(count = get_count_names(fitlist),
             lambda = unlist(lapply(fitlist, function(single_fit) single_fit[["coefficients"]][["lambda"]])),
             CIs,
             BIC = unlist(lapply(fitlist, function(single_fit) single_fit[["BIC"]])),
             theta = unlist(lapply(fitlist, function(single_fit) single_fit[["coefficients"]]["theta"])),
             r = unlist(lapply(fitlist, function(single_fit) single_fit[["coefficients"]]["r"])),
             #model = vapply(fitlist, function(single_fit) single_fit[["model"]], "a"),
             model = nice_model_names[vapply(fitlist, function(single_fit) single_fit[["model"]], "a")], 
             row.names = NULL,
             stringsAsFactors = TRUE)
}


plot_fitlist <- function(fitlist) {
  summ <- summary_fitlist(fitlist)
  
  plot_dat <- do.call(rbind, lapply(levels(summ[["count"]]), function(single_count) {
    single_count_dat <- summ[summ[["count"]] == single_count, ]
    data.frame(single_count_dat,
               lowest_BIC = ifelse(1L:nrow(single_count_dat) == which.min(single_count_dat[["BIC"]]), TRUE, FALSE))
  }))
  
  ggplot2::ggplot(plot_dat, ggplot2::aes(x = model, y = lambda, ymax = upper, ymin = lower, color = lowest_BIC)) +
    ggplot2::geom_point() +
    ggplot2::geom_errorbar(width = 0.5) +
    ggplot2::facet_wrap(~ count) +
    ggplot2::scale_x_discrete("Model") +
    ggplot2::scale_y_continuous(expression(lambda)) +
    ggplot2::scale_color_discrete("The lowest BIC")
}

#' @title Make a decision based on the BIC value
#'
#' @name decide
#' @description Select the most appropriate distribution for the count data in the html-friendly format.
#' @param summary_fit a result of the \code{\link{summary_fitlist}} function.
#' @inheritParams fit_counts
#' @seealso \code{\link{fit_counts}}
#' @examples
#' df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
#' fc <- fit_counts(df, model = "all") 
#' summ <- summary_fitlist(fc) 
#' decide(summ, separate = FALSE)
#' @export
decide <- function(summary_fit, separate) {
  if (separate) {
    paste0(vapply(levels(summary_fit[["count"]]), function(single_count) {
      dat <- summary_fit[summary_fit[["count"]] == single_count, ]
      paste0("Count name: ", single_count, "<br/>",
             decide_single(dat[["BIC"]], dat[["model"]]))
    }, "a"), collapse = "<br/><br/>")
  } else {
    decide_single(unique(summary_fit[["BIC"]]), unique(summary_fit[["model"]]))
  }
}


decide_single <- function(BICs, model_names) {
  res <- paste0("The most appropriate model (model with the lowest BIC value): ",
                as.character(model_names[which.min(BICs)]), ".<br/>")
  if(length(BICs) > 1)
    res <- paste0(res, "The evidence that the model with the lowest BIC value
                  is the most appropriate: ", assess_difference(BICs), ".<br/>")
  res
}


assess_difference <- function(BICs) {
  BIC_difference <- min(BICs[-which.min(BICs)] - min(BICs))
  id <- as.numeric(cut(BIC_difference, c(0, 3.2, 10, 100, max(BIC_difference))))
  BIC_descriptions <- c("negligible", "substantial", "strong", "decisive")[id]
  BIC_descriptions[is.na(BIC_descriptions)] <- "unknown (no convergence)"
  BIC_descriptions
}

nice_model_names <- c(pois = "Poisson", nb = "NB", zip = "ZIP", zinb = "ZINB")
