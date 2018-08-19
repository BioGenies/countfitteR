#' @title Process counts
#'
#' @description Counts data in table-like format ommiting NAs.
#' @param x \code{data.frame} or \code{matrix}. 
#' @examples
#' data(example_counts)
#' process_counts(example_counts)
#' @return A \code{list} of counts.
#' @export
process_counts <- function(x) {
  count_list <- lapply(1L:ncol(x), function(single_column) as.vector(na.omit(x[, single_column])))
  names(count_list) <- colnames(x)
  count_list
}

