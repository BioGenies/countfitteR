#' Function that creates a list of fitted models
#'
#' @name fit_counts
#' @param separate \code{logical}. If \code{TRUE}, each count is separately fitted
#' to the model. If \code{FALSE}, all counts are fitted to the same models having
#' the count name as the independent variable.
#' @param model single \code{character}: \code{"pois"}, \code{"nb"},
#' \code{"zinb"}, \code{"zip"}, \code{"all"}. If \code{"all"}, dots parameters
#' are ignored.
#' @return List of fitted models. Names are names of original counts, an underline
#' and a name of model used.
#' confint is a \code{matrix} with the number of rows equal to the number of
#' parameters. Rownames are names of parameters. The columns contain respectively
#' lower and upper confidence intervals.
#'
fit_counts <- function(counts_list, separate = TRUE, model, level = 0.95, ...) {
  # add proper name checker
  checked_model <- model

  if(length(checked_model) == 1 && checked_model == "all")
    checked_model <- c("pois", "zip", "nb", "zinb")

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
    names(all_fits) <- paste0(names(counts_list), checked_model)
  }

  all_fits
}

