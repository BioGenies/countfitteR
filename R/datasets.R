#' @name sim_dat
#' @title Data created from simulation of NB Poiss
#' @docType data
#' @usage sim_dat
#' @keywords datasets
#' @examples 
#' # code used to generate the data
#' # be warned: the simulations will take some time
#' \dontrun{
#' library(dplyr)
#' set.seed(15390)
#' sim_dat <- do.call(rbind, lapply(10^(-3L:2), function(single_theta)
#'   do.call(rbind, lapply(1L:10/2, function(single_lambda) 
#'     do.call(rbind, lapply(1L:100, function(single_rep) {
#'       
#'       foci <- lapply(1L:10, function(dummy) rnbinom(600, size = single_theta, mu = single_lambda))
#'       names(foci) <- paste0("C", 1L:10)
#'       
#'       fit_counts(foci, separate = TRUE, model = "all") %>%
#'         summary_fitlist %>% 
#'         mutate(between = single_lambda < upper & single_lambda > lower) %>%
#'         group_by(model) %>% 
#'         summarize(prop = mean(between)) %>%
#'         mutate(replicate = single_rep, lambda = single_lambda, theta = single_theta)
#'     }))
#'   ))
#' ))
#' }
NULL

#' @name foci_count_APC
#' @title foci counts with APC dye
#' @description example data extracted from Aklides system. Counts with only APC fluorescent dye were merged.
#' @docType data
#' @usage foci_count_APC
#' @keywords datasets
NULL

#' @name foci_count_FITC
#' @title foci counts with FITC dye
#' @description example data extracted from Aklides system. Counts with only FITC fluorescent dye were merged.
#' @docType data
#' @usage foci_count_FITC
#' @keywords datasets
NULL

#' @name example_counts
#' @title short version of the \code{foci_counts_FITC}
#' @description shorter version of the \code{foci_count_FITC}. Used as an example in shiny app, 
#' when the user will not load his own count data.
#' @docType data
#' @usage example_counts
#' @keywords datasets
NULL

#' @name foci_count
#' @title foci count 
#' @description example data extracted from Aklides system and merged into one file. Counts in this file will not fit properly, 
#' due to the fact that we integrated into the file counts with two different fluorescent dyes used. 
#' @docType data
#' @usage foci_count_merged
#' @keywords datasets
NULL
