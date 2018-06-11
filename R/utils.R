
invlogit <- function(x) {
  1/(1 + exp(-x))
}


no_fit <- function() {
  list(fit = NA,
       coefficients = c(lambda = NA),
       confint = matrix(c(NA, NA), ncol = 2, dimnames = list("lambda", c("lower", "upper")))
  )
}

nice_model_names <- c(pois = "Poisson", nb = "NB", zip = "ZIP", zinb = "ZINB")
