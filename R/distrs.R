#' Functons that create distributions
#'
#'Functions that are created are:
#'dZIP - Zero-inflated Poisson distribution
#'rZIP - Zero-inflated Poisson regression
#'rZINB - Zero-inflated negative binomial regression
#'dZINB -  Zero-inflated negative binomial distribution
#' @name distrs
#' @param x
#' @param n
#' @param lambda
#' @param p
NULL

#' @rdname distrs
#' @return Zero-inflated Poisson distribution value
dZIP <- function(x, lambda, p) {
  if(p > (1 - exp(-lambda))^-1)
    stop("Probability distribution no longer valid.")
  sapply(x, function(ith_x) {
    if(ith_x == 0) {
      (1 - p) + p*exp(-lambda)
    } else {
      p * ((lambda^ith_x) * exp(-lambda))/(factorial(ith_x))
    }
  })
}

#' @rdname distrs
#' @return Zero-inflated Poisson regression value
rZIP <- function(n, lambda, p) {
  stats::rpois(n, lambda) * stats::rbinom(n, 1, p)
}

#' @rdname distrs
#' @return Zero-inflated negative binomial regression value
rZINB <- function(n, size, lambda, p) {
  stats::rnbinom(n, size = size, mu = lambda) * stats::rbinom(n, 1, p)
}

#' @rdname distrs
#' @return Zero-inflated negative binomial distribution value
dZINB <- function(x, size, lambda, p) {
  (1 - p) * (x == 0) + p * stats::dnbinom(x, size = size, mu = lambda)
}
