
fit_pois_whole <- function(x, level, ...) {
  fit <- glm(value ~ count_name - 1, data = x, family = poisson(link = "log"), ...)
  summ <- summary(fit)

  coefs <- exp(summ[["coefficients"]][, "Estimate"])
  names(coefs) <- sub("count_name", "", names(coefs))

  confint_raw <- exp(suppressMessages(confint(fit, level =  level)))
  rownames(confint_raw) <- names(coefs)

  list(fit = fit,
       coefficients = lapply(coefs, function(single_coef) c(lambda = single_coef)),
       confint = lapply(1L:nrow(confint_raw),
                        function(single_row)
                          matrix(confint_raw[single_row, ], ncol = 2, dimnames = list("lambda", c("lower", "upper"))))
  )
}


fit_nb_whole <- function(x, level, ...) {
  fit <- MASS::glm.nb(value ~ count_name - 1, data = x, ...)
  # the data is required for BIC computation
  fit[["data"]] <- x
  summ <- summary(fit)

  coefs <- exp(summ[["coefficients"]][, "Estimate"])
  names(coefs) <- sub("count_name", "", names(coefs))

  confint_raw <- exp(suppressMessages(confint(fit, level =  level)))
  rownames(confint_raw) <- names(coefs)

  list(fit = fit,
       coefficients = lapply(coefs, function(single_coef) c(lambda = single_coef, theta = summ[["theta"]])),
       confint = lapply(1L:nrow(confint_raw),
                        function(single_row)
                          matrix(confint_raw[single_row, ], ncol = 2, dimnames = list("lambda", c("lower", "upper"))))
  )
}


fit_zip_whole <- function(x, level, ...) {
  fit <- zeroinfl2(value ~ count_name - 1, data = x, dist = "poisson", ...)
  summ <- summary(fit)

  lambdas <- unname(exp(summ[["coefficients"]][["count"]][, "Estimate"]))
  rs <- unname(invlogit(summ[["coefficients"]][["zero"]][, "Estimate"]))
  confint_raw <- suppressMessages(confint(fit, level =  level))

  coefs <- lapply(1L:length(lambdas), function(single_coef)
    c(lambda = lambdas[single_coef], r = rs[single_coef])
  )
  names(coefs) <- sub("count_name", "", names(summ[["coefficients"]][["count"]][, "Estimate"]))

  list(fit = fit,
       coefficients = coefs,
       confint = lapply(1L:(nrow(confint_raw)/2), function(single_confint)
         transform_zi_confint(confint_raw[c(single_confint + c(0, 6)), ]))
  )
}


fit_zinb_whole <- function(x, level, ...) {
  fit <- zeroinfl2(value ~ count_name - 1, data = x, dist = "negbin", ...)
  summ <- summary(fit)

  lambdas <- unname(exp(summ[["coefficients"]][["count"]][-nrow(summ[["coefficients"]][["count"]]), "Estimate"]))
  rs <- unname(invlogit(summ[["coefficients"]][["zero"]][, "Estimate"]))
  confint_raw <- suppressMessages(confint(fit, level =  level))

  coefs <- lapply(1L:length(lambdas), function(single_coef)
    c(lambda = lambdas[single_coef], theta = summ[["theta"]], r = rs[single_coef])
  )
  names(coefs) <- sub("count_name", "",
                      names(summ[["coefficients"]][["count"]][-nrow(summ[["coefficients"]][["count"]]), "Estimate"])
  )

  list(fit = fit,
       coefficients = coefs,
       confint = lapply(1L:(nrow(confint_raw)/2), function(single_confint)
         transform_zi_confint(confint_raw[c(single_confint + c(0, 6)), ]))
  )
}


fit2fitlist <- function(x, model) {
  BIC_val <- stats::AIC(x[["fit"]], k = log(sum(!is.na(x[["fit"]][["data"]][["value"]]))))

  fitlist <- lapply(1L:length(x[["coefficients"]]), function(single_count) {
    list(coefficients = x[["coefficients"]][[single_count]],
         confint = x[["confint"]][[single_count]],
         BIC = BIC_val,
         model = model)
  })
  names(fitlist) <- names(x[["coefficients"]])
  fitlist
}


fit_counts_whole <- function(x, model, level, ...) {
  tryCatch(fit2fitlist(switch(model,
                              pois = fit_pois_whole(x, level = level, ...),
                              nb = fit_nb_whole(x, level = level, ...),
                              zip = fit_zip_whole(x, level = level, ...),
                              zinb = fit_zinb_whole(x, level = level, ...)
  ), model = model), error = function(e) sapply(levels(x[["count_name"]]),
                                                # add underscore to make it like normal fits
                                                function(single_count) single_count = c(no_fit(),
                                                                                        BIC = NA,
                                                                                        model = model),
                                                simplify = FALSE))

  # list(coefficients = fitted_model[["coefficients"]],
  #      confint = fitted_model[["confint"]],
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