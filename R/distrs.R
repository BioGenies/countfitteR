
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


rZIP <- function(n, lambda, p) {
  rpois(n, lambda) * rbinom(n, 1, p)
}


rZINB <- function(n, size, lambda, p) {
  rnbinom(n, size = size, mu = lambda) * rbinom(n, 1, p)
}


dZINB <- function(x, size, lambda, p) {
  (1 - p) * (x == 0) + p * dnbinom(x, size = size, mu = lambda)
}
