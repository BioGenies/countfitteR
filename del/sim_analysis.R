source("./R/load_all.R")
load("./data/sim_dat.RData")

library(dplyr)
library(ggplot2)

# single_theta <- 10^-3 single_lambda <- 0.5 foci <- lapply(1L:10, function(dummy) rnbinom(600, size =
# single_theta, mu = single_lambda)) names(foci) <- paste0('C', 1L:10) fit_counts(foci, separate = TRUE, model =
# 'all')

# can all models be fitted?
filter(sim_dat, !is.na(prop)) %>% group_by(theta, lambda) %>% summarize(proper_fits = length(replicate)/400) %>%
    ggplot(aes(x = factor(theta), y = factor(lambda), fill = proper_fits, label = formatC(proper_fits, digits = 2,
        format = "f"))) + geom_tile(color = "black") + geom_text(color = "floralwhite")
# no, for some combinations of theta and lambda models cannot be fitted


# the mean number of times, when lambda is between the real lambda red numbers represent number of replicates we
# consider ONLY situations, where all four models can be fitted
filter(sim_dat, !is.na(prop)) %>% group_by(theta, lambda, replicate) %>% mutate(all_models = length(prop) == 4) %>%
    filter(all_models) %>% group_by(theta, lambda) %>% mutate(fitted_reps = length(prop)) %>% group_by(theta, lambda,
    model) %>% mutate(prop = mean(prop)) %>% distinct %>% ggplot(aes(x = factor(theta), y = factor(lambda), fill = prop,
    label = formatC(fitted_reps, digits = 0, format = "f"))) + geom_tile(color = "black") + geom_text(color = "darkblue") +
    facet_wrap(~model) + scale_fill_gradient2(midpoint = 0, mid = "red", high = "yellow")


# the mean number of times, when lambda is between the real lambda red numbers represent number of replicates we
# consider ONLY situations, where all four models can be fitted
filter(sim_dat, !is.na(prop)) %>% group_by(theta, lambda, replicate) %>% group_by(theta, lambda) %>% mutate(fitted_reps = length(prop)) %>%
    group_by(theta, lambda, model) %>% mutate(prop = mean(prop)) %>% distinct %>% ggplot(aes(x = factor(theta), y = factor(lambda),
    fill = prop, label = formatC(fitted_reps, digits = 0, format = "f"))) + geom_tile(color = "black") + geom_text(color = "darkblue") +
    facet_wrap(~model) + scale_fill_gradient2(midpoint = 0, mid = "red", high = "yellow")
