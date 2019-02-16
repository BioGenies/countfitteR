
fit_pois_separate <- function(x, level, ...) {
  fit <- stats::glm(x ~ 1, family = poisson(link = "log"), ...)

  confint_raw <- exp(confint.default(fit, level =  level))
  confint <- matrix(confint_raw, ncol = 2, dimnames = list("lambda", c("lower", "upper")))

  summ <- summary(fit)

  #AER::dispersiontest(all_fits[[8]][["fit"]], alternative = "greater")[["p.value"]]

  #qcc::qcc.overdispersion.test(repeat_list[[8]])[, "p-value"]

  list(fit = fit,
       coefficients = c(lambda = exp(unname(summ[["coefficients"]][, "Estimate"]))),
       confint = confint
  )
}

fit_nb_separate <- function(x, level, ...) {
  fit <- MASS::glm.nb(x ~ 1, ...)
  summ <- summary(fit)

  confint_raw <- confint.default(fit, level =  level)
  confint <- matrix(exp(confint_raw), ncol = 2, dimnames = list("lambda", c("lower", "upper")))


  list(fit = fit,
       coefficients = c(lambda = unname(exp(summ[["coefficients"]][1])),
                        theta = unname(summ[["theta"]])),
       confint = confint
  )
}

fit_zip_separate <- function(x, level, ...) {
  fit <- zeroinfl(x ~ 1, dist = "poisson", ...)
  summ <- summary(fit)

  list(fit = fit,
       coefficients = c(lambda = unname(exp(summ[["coefficients"]][["count"]][, "Estimate"])),
                        r = unname(invlogit(summ[["coefficients"]][["zero"]][, "Estimate"]))),
       confint = transform_zi_confint(confint.default(fit, level =  level))
  )
}

fit_zinb_separate <- function(x, level, ...) {
  fit <- zeroinfl(x ~ 1, dist = "negbin", ...)
  summ <- summary(fit)

  coefs <- unname(exp(summ[["coefficients"]][["count"]][, "Estimate"]))

  list(fit = fit,
       coefficients = c(lambda = coefs[1],
                        theta = coefs[2],
                        r = unname(invlogit(summ[["coefficients"]][["zero"]][, "Estimate"]))),
       confint = transform_zi_confint(confint.default(fit, level = level))
  )
}

transform_zi_confint <- function(confint_data) {
  rownames(confint_data) <- c("lambda", "r")
  colnames(confint_data) <- c("lower", "upper")

  confint_data["lambda", ] <- exp(confint_data["lambda", ])
  confint_data["r", ] <- rev(invlogit(confint_data["r", ]))

  confint_data
}


fit_counts_separate <- function(counts_list, model, level, ...) {

  lapply(counts_list, function(x) {
    fitted_model <- tryCatch(switch(model,
                                    pois = fit_pois_separate(x, level = level, ...),
                                    nb = fit_nb_separate(x, level = level, ...),
                                    zip = fit_zip_separate(x, level = level, ...),
                                    zinb = fit_zinb_separate(x, level = level, ...)
    ), error = function(e) no_fit())

    list(coefficients = fitted_model[["coefficients"]],
         confint = fitted_model[["confint"]],
         #c(fitted_model,
         # don't compute BIC if no model is fitted
         BIC = ifelse(any(class(fitted_model[["fit"]]) %in% c("glm", "zeroinfl")),
                      stats::AIC(fitted_model[["fit"]], k = log(sum(!is.na(x)))),
                      NA),
         model = model)
  })
}

no_fit <- function() {
  list(fit = NA,
       coefficients = c(lambda = NA),
       confint = matrix(c(NA, NA), ncol = 2, dimnames = list("lambda", c("lower", "upper")))
  )
}

invlogit <- function(x) {
  1/(1 + exp(-x))
}