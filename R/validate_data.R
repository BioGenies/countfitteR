#' @title Validate data
#'
#' @description Validates count data.
#' @param x \code{data.frame} or \code{matrix}. 
#' @examples
#' data(case_study)
#' process_counts(case_study)
#' @details Errors if \code{x} has negative values or non-numeric 
#' values, otherwise \code{TRUE}.
#' @return An input object.
#' @export
validate_counts <- function(x) {
  res <- any(apply(x, 2, function(i) any(i >= 0, na.rm = TRUE)) & 
        apply(x, 2, function(i) any(is.numeric(i), na.rm = TRUE)))
  
  if(!res)
    stop("Please supply count data.")
  
  res
}