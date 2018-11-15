#' @title Process counts
#'
#' @description Converts data in a table-like formats into lists of counts.
#' @param x \code{data.frame} or \code{matrix}. 
#' @examples
#' data(case_study)
#' process_counts(case_study)
#' @details \code{case_study} does not consider \code{NA}s and \code{NaN}s effectively 
#' ommiting them (as the \code{\link[base]{is.na}} function).
#' @return A \code{list} of counts.
#' @export
process_counts <- function(x) {
  count_list <- lapply(1L:ncol(x), function(single_column) as.vector(na.omit(x[, single_column])))
  names(count_list) <- colnames(x)
  count_list
}

