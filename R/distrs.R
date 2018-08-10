#' @title Zero-inflated Poisson distrbution
#'
#' @name zip
#' @rdname zip
#' @description  Density and random generation for the zero inflated Poisson distribution.
#' @param x vector of (non-negative integer) quantiles.
#' @param lambda vector of (non-negative) means.
#' @param p probability of zero
#' @examples
#' df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
#' compare_fit(df, fitlist = fit_counts(df, model = "all"))
#' @seealso Poisson distribution: 
NULL

#' @rdname zip
#' @export
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

#' @rdname zip
#' @export
rZIP <- function(n, lambda, p) {
  stats::rpois(n, lambda) * stats::rbinom(n, 1, p)
}


rZINB <- function(n, size, lambda, p) {
  stats::rnbinom(n, size = size, mu = lambda) * stats::rbinom(n, 1, p)
}


dZINB <- function(x, size, lambda, p) {
  (1 - p) * (x == 0) + p * stats::dnbinom(x, size = size, mu = lambda)
}
