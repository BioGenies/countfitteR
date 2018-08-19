
invlogit <- function(x) {
  1/(1 + exp(-x))
}


no_fit <- function() {
  list(fit = NA,
       coefficients = c(lambda = NA),
       confint = matrix(c(NA, NA), ncol = 2, dimnames = list("lambda", c("lower", "upper")))
  )
}


nice_model_names <- c(pois = "Poisson", nb = "NB", zip = "ZIP", zinb = "ZINB")


# summary counts -----------------------------------------

summary_counts <- function(count_list) {
  summaries <- data.frame(vapply(c(mean, median, sd, mad, max, min, length), function(single_fun)
    vapply(count_list, single_fun, 0),
    rep(0, length(count_list))))
  colnames(summaries) <- c("mean", "median", "sd", "mad", "max", "min", "length")
  cbind(name = names(count_list), summaries)
}

# fast_tabulate (helper function) ---------------------------------------------------------
# x is a vector of counts

fast_tabulate <- function(x) {
  # + 1, since we also count zeros
  tabs <- tabulate(x + 1)
  data.frame(x = 0L:(length(tabs) - 1), n = tabs)
}

get_occs <- function(count_list)
  do.call(rbind, lapply(names(count_list), function(single_count_name)
    occs <- data.frame(count = single_count_name, fast_tabulate(count_list[[single_count_name]]))
  ))

plot_occs <- function(occs)
  ggplot2::ggplot(occs, ggplot2::aes(x = x, y = n, label = n)) +
  ggplot2::geom_bar(stat = "identity") +
  ggplot2::geom_text(vjust = -0.25) +
  ggplot2::scale_y_continuous("Frequency", limits = c(0, max(occs[["n"]]*1.2))) +
  ggplot2::scale_x_continuous("Count") +
  ggplot2::facet_wrap(~ count, ncol = 1) 


