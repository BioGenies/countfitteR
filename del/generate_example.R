load("healthy_list.RData")

pat67 <- healthy_list_fitc[37L:42]

max_len <- max(lengths(pat67))

write.csv(do.call(cbind, lapply(pat67, function(i) c(i, rep(NA, max_len - length(i))))), file = "example_counts.csv", 
    row.names = FALSE)
