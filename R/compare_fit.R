# returns density function
get_density_fun <- function(single_fit) {
  if(is.na(single_fit[["coefficients"]][["lambda"]])) {
    function(x) NA
  } else {
    switch(single_fit[["model"]],
           pois = function(x) dpois(x, lambda = single_fit[["coefficients"]][["lambda"]]),
           nb = function(x) dnbinom(x, size = single_fit[["coefficients"]][["theta"]],
                                    mu = single_fit[["coefficients"]][["lambda"]]),
           zip = function(x) dZIP(x, lambda = single_fit[["coefficients"]][["lambda"]],
                                  r = 1 - single_fit[["coefficients"]][["r"]]),
           zinb = function(x) dZINB(x, size = single_fit[["coefficients"]][["theta"]],
                                    mu = single_fit[["coefficients"]][["lambda"]],
                                    r = 1 - single_fit[["coefficients"]][["r"]])
    )
  }
}


compare_fit_single <- function(fitlist) {
  lapply(fitlist, function(single_fit)
    get_density_fun(single_fit)(occs[["x"]])
  )
}

#' @title Compare distributions
#'
#' @name compare_fit
#' @description  Compare empirical distribution of counts with the distribution 
#' defined by the model fitted to counts.
#' @param count_list A \code{list} of counts. Each count should be in separate 
#' column, rows should represent values of these counts.
#' @param fitlist Uses fit_count function to calculate value for each unique 
#' observation using different
#' distribution models.
#' @examples
#' df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
#' compare_fit(df, fitlist = fit_counts(df, model = "all"))
#' @return A \code{data.frame} with distribution values for each unique count. 
#' Count is the name of the original count, model is the name of distribution 
#' model, x is unique count value, n is the frequency of unique counts, value 
#' is result of calculations made by chosen 
#' distribution model.
#' @export
#

compare_fit <- function(count_list, fitlist = fit_counts(count_list, model = "all")) {
  summ <- summary_fitlist(fitlist)

  count_ids <- lapply(names(count_list), function(single_count_name) which(summ[["count"]] == single_count_name))

  do.call(rbind, lapply(1L:length(count_list), function(single_count_id) {
    occs <- fast_tabulate(count_list[[single_count_id]])

    model_names <- unlist(lapply(as.character(summ[count_ids[[single_count_id]], "model"]),
                                 rep, times = nrow(occs)))

    cmp <- data.frame(count = names(count_list)[single_count_id], model = model_names,
                 do.call(rbind, lapply(fitlist[count_ids[[single_count_id]]], function(single_fit)
                   cbind(occs, value = get_density_fun(single_fit)(occs[["x"]]) * length(count_list[[single_count_id]]))
                 )))
    rownames(cmp) <- NULL

    cmp
  }))
}

#' @title plot_fitcmp
#'
#' @name plot_fitcmp
#' @description Compare empirical distribution of counts with the distribution defined by the model
#' fitted to counts.
#' The bar charts represent theoretical counts depending on the chosen distribution. Red dots describe
#' the real number of counts.
#' @param fitcmp You need to input data frame that is created by compare_fit function.
#' @examples 
#' df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
#' fitcmp <- compare_fit(df, fitlist = fit_counts(df, model = "all"))
#' plot_fitcmp(fitcmp)
#' @export

plot_fitcmp <- function(fitcmp) {
  ggplot2::ggplot(fitcmp, ggplot2::aes(x = x, y = value)) +
    ggplot2::geom_bar(stat = "identity", fill = NA, color = "black") +
    ggplot2::facet_grid(count ~ model) +
    ggplot2::geom_point(ggplot2::aes(x = x, y = n, color = "red")) +
    ggplot2::scale_color_discrete(guide = FALSE) 
}

fast_tabulate <- function(x) {
  # + 1, since we also count zeros
  tabs <- tabulate(x + 1)
  data.frame(x = 0L:(length(tabs) - 1), n = tabs)
}
