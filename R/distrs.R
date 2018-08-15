#' @title Zero-inflated Poisson distrbution
#'
#' @name zip
#' @rdname zip
#' @aliases ZIP
#' @description  Density and random generation for the zero inflated Poisson distribution.
#' @param x vector of (non-negative integer) quantiles.
#' @param lambda vector of (non-negative) means.
#' @param r probability of excess zeros.
#' @param n number of random values to return.
#' @examples
#' rZIP(15, 1.9, 0.9)
#' @seealso Poisson distribution: \code{\link[stats]{Poisson}}.
NULL

#' @rdname zip
#' @export
dZIP <- function(x, lambda, r) {
  if(r > (1 - exp(-lambda))^-1)
    stop("Probability distribution no longer valid.")
  sapply(x, function(ith_x) {
    if(ith_x == 0) {
      (1 - r) + r*exp(-lambda)
    } else {
      r * ((lambda^ith_x) * exp(-lambda))/(factorial(ith_x))
    }
  })
}

#' @rdname zip
#' @export
rZIP <- function(n, lambda, r) {
  stats::rpois(n, lambda) * stats::rbinom(n, 1, r)
}


#' @title Zero-inflated negative binomial distrbution
#'
#' @name zinb
#' @rdname zinb
#' @aliases ZINB
#' @description  Density and random generation for the zero-inflated negative binomial 
#' distribution.
#' @param x vector of (non-negative integer) quantiles.
#' @param size target for number of successful trials, or dispersion parameter (the shape 
#' parameter of the gamma mixing distribution). Must be strictly positive, need not be integer..
#' @param r probability of excess zeros.
#' @param n number of random values to return.
#' @param mu mean.
#' @examples
#' rZINB(15, 1.9, 0.9, 0.8)
#' @seealso Negative binomial distribution: \code{\link[stats]{NegBinomial}}.
NULL

#' @rdname zinb
#' @export
rZINB <- function(n, size, mu, r) {
  stats::rnbinom(n, size = size, mu = mu) * stats::rbinom(n, 1, r)
}

#' @rdname zinb
#' @export
dZINB <- function(x, size, mu, r) {
  (1 - r) * (x == 0) + r * stats::dnbinom(x, size = size, mu = mu)
}
