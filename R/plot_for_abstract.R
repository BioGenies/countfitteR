source("./R/load_all.R")
library(dplyr)
library(reshape2)

size_mod <- 1

abstr_theme <- theme(
  axis.text = element_text(size=13 + size_mod),
  axis.title.x = element_text(size=14 + size_mod, vjust = -1),
  axis.title.y = element_text(size=14 + size_mod, vjust = 1),

  legend.background = element_rect(fill = "NA"),
  legend.key = element_rect(fill = "NA", color = "NA", size = 0.5),
  legend.position = "bottom",
  #uncomment for publications
  #legend.key.size = unit(0.1, "inches"),
  #legend.margin = unit(-0.25, "lines"),
  legend.text = element_text(size=13 + size_mod),
  legend.title = element_text(size=14 + size_mod),

  panel.grid.major = element_line(color=NA, linetype = "dashed", size = 0.5),
  # panel.grid.major = element_line(color=NA, linetype = "dashed", size = 0.5),
  panel.background = element_rect(fill = "transparent", color = "black"),

  plot.background=element_rect(fill = "transparent",
                               color = "transparent"),
  #uncomment for publications
  #plot.margin = unit(rep(0.02, 4), "inches"),
  plot.title = element_text(size=20 + size_mod),

  strip.background = element_rect(fill = "NA", color = "NA"),
  strip.text = element_text(size=13 + size_mod, face = "bold")
)



set.seed(1)
plot_sim <- list(C1 = rnbinom(600, size = 0.5, mu = 2))

cmp_dat <- compare_fit(plot_sim, fit_counts(plot_sim, separate = TRUE, model = "all")[c(1, 3)]) %>%
  mutate(model = factor(model, levels = rev(levels(model)), labels = c("Poisson\n(low BIC)",
                                                                       "Negative Binomial\n(high BIC)"))) %>%
  melt(measure.vars = c("n", "value"), variable.name = "distr") %>%
  mutate(distr = factor(distr, labels = c("Empirical\ndistribution", "Theoretical\ndistribution")))



png("abstract_BIC.png", height = 480, width = 480)
ggplot(cmp_dat, aes(x = x, y = value, fill = distr)) +
  geom_bar(stat = "identity", color = "black", position = "dodge") +
  facet_wrap( ~ model, ncol = 1) +
  scale_y_continuous("n") +
  scale_fill_manual("", values = c("cadetblue", "orangered")) +
  abstr_theme
dev.off()

