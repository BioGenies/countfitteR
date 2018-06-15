#' Functons that calculate the most appropriate model and assess differences between them
#'
#' @name fitlist
NULL

#' @rdname fitlist
#' @section Function that extracts count names from file
#' @param fitlist List of fitting models created by fit2fitlist function
#' @return Count names
get_count_names <- function(fitlist) {
  model_names <- strsplit(names(fitlist), "_")
  vapply(model_names, function(single_name) paste0(single_name[-length(single_name)], collapse = "_"), "a")
}

#' @rdname fitlist
#' @param fitlist List of fitting models created by fit2fitlist function
#' @return Creates data frame
summary_fitlist <- function(fitlist) {
  CIs <- t(sapply(fitlist, function(single_fit) single_fit[["confint"]]["lambda", ]))
  data.frame(count = get_count_names(fitlist),
             lambda = unlist(lapply(fitlist, function(single_fit) single_fit[["coefficients"]][["lambda"]])),
             CIs,
             BIC = unlist(lapply(fitlist, function(single_fit) single_fit[["BIC"]])),
             theta = unlist(lapply(fitlist, function(single_fit) single_fit[["coefficients"]]["theta"])),
             r = unlist(lapply(fitlist, function(single_fit) single_fit[["coefficients"]]["r"])),
             #model = vapply(fitlist, function(single_fit) single_fit[["model"]], "a"),
             model = nice_model_names[vapply(fitlist, function(single_fit) single_fit[["model"]], "a")])
}

#' @rdname fitlist
#' @param fitlist List of fitting models created by fit2fitlist function
#' @return Creates a plot
plot_fitlist <- function(fitlist) {
  summ <- summary_fitlist(fitlist)

  plot_dat <- do.call(rbind, lapply(levels(summ[["count"]]), function(single_count) {
    single_count_dat <- summ[summ[["count"]] == single_count, ]
    data.frame(single_count_dat,
               lowest_BIC = ifelse(1L:nrow(single_count_dat) == which.min(single_count_dat[["BIC"]]), TRUE, FALSE))
  }))

  ggplot2::ggplot(plot_dat, aes(x = model, y = lambda, ymax = upper, ymin = lower, color = lowest_BIC)) +
    ggplot2::geom_point() +
    ggplot2::geom_errorbar(width = 0.5) +
    ggplot2::facet_wrap(~ count) +
    ggplot2::scale_x_discrete("Model") +
    ggplot2::scale_y_continuous(expression(lambda)) +
    ggplot2::scale_color_discrete("The lowest BIC") +
    my_theme
}

#' @rdname fitlist
#' @param summary_fit
#' @param separate \code{logical}. If \code{TRUE}, each count is separately fitted to the model
#' If \code{FALSE}, all counts are fitted to the same models having
#' the count name as the independent variable
#' @return Separates several counts
decide <- function(summary_fit, separate) {
  if (separate) {
    paste0(vapply(levels(summary_fit[["count"]]), function(single_count) {
      dat <- summary_fit[summary_fit[["count"]] == single_count, ]
      paste0("Count name:", single_count, "<br/>",
             decide_single(dat[["BIC"]], dat[["model"]]))
    }, "a"), collapse = "<br/><br/>")
  } else {
    decide_single(unique(summary_fit[["BIC"]]), unique(summary_fit[["model"]]))
  }
}

#' @rdname fitlist
#' @param BICs List of calculated BICs
#' @param model_names List of model names created by get_count_names function
#' @return Returns the most appropriate model for given data
decide_single <- function(BICs, model_names) {
  res <- paste0("The most appropriate model (model with the lowest BIC value): ",
                as.character(model_names[which.min(BICs)]), ".<br/>")
  if(length(BICs) > 1)
    res <- paste0(res, "The evidence that the model with the lowest BIC value
                  is the most appropriate: ", assess_difference(BICs), ".<br/>")
  res
}

#' @rdname fitlist
#' @param BICs List of calculated BICs
#' @return Assessed difference
assess_difference <- function(BICs) {
  BIC_difference <- min(BICs[-which.min(BICs)] - min(BICs))
  id <- as.numeric(cut(BIC_difference, c(0, 3.2, 10, 100, max(BIC_difference))))
  c("negligible", "substantial", "strong", "decisive")[id]
}
