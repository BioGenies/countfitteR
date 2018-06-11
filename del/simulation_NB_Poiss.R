source("./R/load_all.R")

library(dplyr)
library(pbapply)

sim_dat <- do.call(rbind, pblapply(10^(-3L:2), function(single_theta) do.call(rbind, lapply(1L:10/2, function(single_lambda) do.call(rbind,
    lapply(1L:100, function(single_rep) {

        foci <- lapply(1L:10, function(dummy) rnbinom(600, size = single_theta, mu = single_lambda))
        names(foci) <- paste0("C", 1L:10)

        fit_counts(foci, separate = TRUE, model = "all") %>% summary_fitlist %>% mutate(between = single_lambda <
            upper & single_lambda > lower) %>% group_by(model) %>% summarize(prop = mean(between)) %>% mutate(replicate = single_rep,
            lambda = single_lambda, theta = single_theta)
    }))))))

save(sim_dat, file = "./data/sim_dat.RData")
