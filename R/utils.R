#' Inverse logistic function and no_fit function
#'
#' Inverse-logit function, transforms continuous values to the range (0, 1).
#'
#' @name utils
#' @param x A vector of continuous values
NULL

#' @rdname utils
#' @return Vector of estimated probabilities
invlogit <- function(x) {
  1/(1 + exp(-x))
}

#' @rdname utils
#' @return Computes confidence intervals for given parameters in a no_fit model
no_fit <- function() {
  list(fit = NA,
       coefficients = c(lambda = NA),
       confint = matrix(c(NA, NA), ncol = 2, dimnames = list("lambda", c("lower", "upper")))
  )
}

#' @rdname utils
nice_model_names <- c(pois = "Poisson", nb = "NB", zip = "ZIP", zinb = "ZINB")
