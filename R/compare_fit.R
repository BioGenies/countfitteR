#' Functons that calculates and compares densities
#'
#' @name compare_fit
NULL

#' @rdname compare_fit
#' @param single_fit
#' @return Returns density function
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

#' @rdname compare_fit
#' @param fitlist
#' @return Compares density functions
compare_fit_single <- function(fitlist) {
  lapply(fitlist, function(single_fit)
    get_density_fun(single_fit)(occs[["x"]])
  )
}

#' @rdname compare_fit
#' @param count_list List created by process_counts function.
#' @param fitlist
#' @return Returns density function
#' @section Function that needs both input data and fits
# function that needs both input data and fits

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
#' @rdname compare_fit
#' @param fitcmp
#' @return Creates a plot
plot_fitcmp <- function(fitcmp) {
  ggplot2::ggplot(fitcmp, aes(x = x, y = value)) +
    ggplot2::geom_bar(stat = "identity", fill = NA, color = "black") +
    ggplot2::facet_grid(model ~ count) +
    ggplot2::geom_point(aes(x = x, y = n, color = "red")) +
    ggplot2::scale_color_discrete(guide = FALSE) +
    my_theme
}
