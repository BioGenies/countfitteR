app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$snapshot()
app$setInputs(csv_type = "csv2")
app$setInputs(header = FALSE)
app$snapshot()
app$setInputs(navbar = "Edit input data")
app$setInputs(navbar = "Summary")
# Input 'input_data_summary_rows_current' was set, but doesn't have an input binding.
# Input 'input_data_summary_rows_all' was set, but doesn't have an input binding.
app$setInputs(navbar = "Distribution")
# Input 'input_data_distr_tab_rows_current' was set, but doesn't have an input binding.
# Input 'input_data_distr_tab_rows_all' was set, but doesn't have an input binding.
app$setInputs(navbar = "Mean value (&lambda;) estimates")
# Input 'fit_tab_rows_current' was set, but doesn't have an input binding.
# Input 'fit_tab_rows_all' was set, but doesn't have an input binding.
app$setInputs(navbar = "Coefficients")
# Input 'coef_tab_rows_current' was set, but doesn't have an input binding.
# Input 'coef_tab_rows_all' was set, but doesn't have an input binding.
app$setInputs(navbar = "Decision")
app$snapshot()
app$setInputs(navbar = "Compare distributions")
# Input 'cmp_sep_tab_rows_current' was set, but doesn't have an input binding.
# Input 'cmp_sep_tab_rows_all' was set, but doesn't have an input binding.
app$setInputs(navbar = "Settings")
app$snapshot()
app$setInputs(chosen_models = c("pois", "nb", "zip"))
app$setInputs(chosen_models = c("pois", "zip"))
app$setInputs(conf_level = 0.94)
app$setInputs(conf_level = 0.93)
app$setInputs(conf_level = 0.92)
app$setInputs(conf_level = 0.91)
app$setInputs(conf_level = 0.9)
app$setInputs(sep_exp = FALSE)
app$snapshot()
app$setInputs(navbar = "About")
app$setInputs(navbar = "Help")
app$snapshot()
app$setInputs(navbar = "Save report")
app$setInputs(navbar = "Compare distributions")
# Input 'cmp_sep_tab_rows_current' was set, but doesn't have an input binding.
# Input 'cmp_sep_tab_rows_all' was set, but doesn't have an input binding.
app$snapshot()
