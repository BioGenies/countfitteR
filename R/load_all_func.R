#' Loads all important functions
#'
#' @name load_all_func

functions <- c('compare_fit.R', 'distrs.R',
               'fit_counts.R', 'fit_counts_separate.R', 'fit_counts_whole.R',
               'fitlist.R', 'ggtheme.R', 'process_counts.R',
               'utils.R', 'zeroinfl2.R')

sapply(functions, function(i) source(paste0("./R/", i)))
