# #epiR::epi.bohning
# 
# x <- rZIP(10000, 2, 0.4)
# x <- rpois(1000, 2)
# 
# # data from boehning 
# x <- data.frame(deaths = 0L:14, freq = c(1, 4, 15, 31, 39, 55, 54, 49, 47, 31, 16, 9, 8, 4, 3)) %>%
#   apply(1, function(i) rep(i[1], i[2])) %>%
#   unlist(use.names = FALSE)
# 
# var(x) - mean(x)
# stat <- sqrt((length(x) - 1)/2) * (var(x)/mean(x) - 1)
# dchisq(stat, length(x) - 1)
