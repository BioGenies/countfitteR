#' Fit counts to distributions
#'
#' @name fit_counts
#' @param counts_list A \code{list} of count data. Each count should be in 
#' separate column, rows should represent
#' values of that counts.
#' @param separate \code{logical}. If \code{TRUE}, each count is separately 
#' fitted to the model. If \code{FALSE}, all counts are fitted to the same models 
#' having the count name as the independent variable.
#' @param model single \code{character}: \code{"pois"}, \code{"nb"},
#' \code{"zinb"}, \code{"zip"}, \code{"all"}. If \code{"all"}, all possible model 
#' are fitted.
#' @param level Confidence level, default is 0.95.
#' @param ... Dots parameters are ignored.
#' @return The list of fitted models. Names are names of original counts, an underline
#' and a name of model used.
#' confint is a \code{matrix} with the number of rows equal to the number of
#' parameters. Rownames are names of parameters. The columns contain respectively
#' lower and upper confidence intervals.
#' @examples 
#' df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
#' fit_counts(df, model = "pois") 
#' @export

fit_counts <- function(counts_list, separate = TRUE, model, level = 0.95, ...) {

  all_models <- c("pois", "zip", "nb", "zinb")
  if(any(!(model %in% c(all_models, "all")))) {
    stop('No existing model identified. Please use "all", "pois", "zip", "nb" or "zinb".')
  }
  checked_model <- if("all" %in% model) {
    c("pois", "zip", "nb", "zinb")
  } else {
      model
  }

  if(separate) {
    fit_data <- counts_list
    fit_function <- fit_counts_separate
  } else {
    fit_data <- do.call(rbind, lapply(names(counts_list), function(single_name)
      data.frame(count_name = single_name, value = counts_list[[single_name]])))
    fit_function <- fit_counts_whole
  }
  if(length(checked_model) > 1) {
    all_fits <- unlist(lapply(checked_model, function(single_model)
      fit_function(fit_data, model = single_model, level = level)
    ), recursive = FALSE)

    names(all_fits) <- as.vector(vapply(checked_model, function(single_name)
      paste0(names(counts_list), "_", single_name), rep("a", length(counts_list))))
  } else {
    all_fits <- fit_function(fit_data, model = checked_model, level = level, ...)
    names(all_fits) <- paste0(names(counts_list), "_", checked_model)
  }

  all_fits
}

