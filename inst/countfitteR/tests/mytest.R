app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$setInputs(navbar = "Edit input data")
app$snapshot()
app$setInputs(navbar = "Summary")
# Input 'input_data_summary_rows_current' was set, but doesn't have an input binding.
# Input 'input_data_summary_rows_all' was set, but doesn't have an input binding.
app$snapshot()
app$setInputs(navbar = "Distribution")
# Input 'input_data_distr_tab_rows_current' was set, but doesn't have an input binding.
# Input 'input_data_distr_tab_rows_all' was set, but doesn't have an input binding.
app$snapshot()
app$setInputs(navbar = "Mean value (&lambda;) estimates")
# Input 'fit_tab_rows_current' was set, but doesn't have an input binding.
# Input 'fit_tab_rows_all' was set, but doesn't have an input binding.
app$snapshot()
app$setInputs(navbar = "Coefficients")
# Input 'coef_tab_rows_current' was set, but doesn't have an input binding.
# Input 'coef_tab_rows_all' was set, but doesn't have an input binding.
app$snapshot()
app$setInputs(navbar = "Decision")
app$snapshot()
app$setInputs(navbar = "Compare distributions")
# Input 'cmp_sep_tab_rows_current' was set, but doesn't have an input binding.
# Input 'cmp_sep_tab_rows_all' was set, but doesn't have an input binding.
app$snapshot()
