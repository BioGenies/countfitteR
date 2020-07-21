#' @title Select the most appropriate model
#'
#' @name select_model
#' @inheritParams compare_fit
#' @return a \code{data.frame} with two columns: \code{count}
#' representing the name of the count and \code{chosen model}
#' with the model with the lowest BIC.
#' @export
#' @examples 
#' set.seed(1)
#' df <- data.frame(poisson1 = rpois(50, 2), 
#'                  poisson2 = rpois(50, 5),
#'                  zip1 = rZIP(50, 2, 0.7),
#'                  zip2 = rZIP(50, 5, 0.7))
#' fitlist_separate <- fit_counts(df, model = c("pois", "zip")) 
#' select_model(fitlist_separate)
select_model <- function(fitlist) {
  summary_models <- summary_fitlist(fitlist)
  
  do.call(rbind, lapply(unique(summary_models[["count"]]), function(ith_count) {
    part_dat <- summary_models[summary_models[["count"]] == ith_count, ]
    data.frame(count = ith_count,
               chosen_model = as.character(part_dat[which.min(part_dat[["BIC"]]), 
                                                    "model"]))
  }))
}



