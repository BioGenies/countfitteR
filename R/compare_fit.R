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
                                  p = 1 - single_fit[["coefficients"]][["r"]]),
           zinb = function(x) dZINB(x, size = single_fit[["coefficients"]][["theta"]],
                                    lambda = single_fit[["coefficients"]][["lambda"]],
                                    p = 1 - single_fit[["coefficients"]][["r"]])
    )
  }
}


compare_fit_single <- function(fitlist) {
  lapply(fitlist, function(single_fit)
    get_density_fun(single_fit)(occs[["x"]])
  )
}

#' @title Compare_fit
#'
#' @name compare_fit
#' @description  Function calculates distribution of each unique observation value taking in account their
#' number of occurances for each count.
#' @param count_list Table with count data. Each count should be in separate column, rows should represent
#' values of that counts.
#' @param fitlist Uses fit_count function to calculate value for each unique observation using different
#' distribution models.
#' @return Data table with distribution values for each unique observation in count.
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
#' @description Creates a plot from counts name and distribution values of each unique observation, which allows to compare
#' all the distributions and find the most suitable.
#' @param fitcmp You need to input data frame that is created by compare_fit function.
#' @export

plot_fitcmp <- function(fitcmp) {
  ggplot2::ggplot(fitcmp, aes(x = x, y = value)) +
    ggplot2::geom_bar(stat = "identity", fill = NA, color = "black") +
    ggplot2::facet_grid(model ~ count) +
    ggplot2::geom_point(aes(x = x, y = n, color = "red")) +
    ggplot2::scale_color_discrete(guide = FALSE) +
    my_theme
}
