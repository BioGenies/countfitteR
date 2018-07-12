library(shiny)
# must use development DT devtools::install_github('rstudio/DT')
library(DT)
library(reshape2)
library(rhandsontable)
library(rmarkdown)
library(pscl)

lolo <- getwd()
print(lolo)
setwd("../")
lolo <- getwd()
print(lolo)
source("./R/load_all_func.R")

options(DT.options = list(dom = "Brtip", buttons = c("copy", "csv", "excel", "print")))

my_DT <- function(x) datatable(x, escape = FALSE, extensions = "Buttons", filter = "top", rownames = FALSE)


shinyServer(function(input, output) {

    raw_counts <- reactive({
        # if there is no data, example is loaded
        if (is.null(input[["input_file"]])) {
            dat <- read.csv("./data/example_counts.csv", check.names = FALSE)
        } else {
            dat <- switch(input[["csv_type"]], csv1 = read.csv(input[["input_file"]][["datapath"]], header = input[["header"]],
                check.names = FALSE), csv2 = read.csv2(input[["input_file"]][["datapath"]], header = input[["header"]],
                check.names = FALSE))
            if (!input[["header"]])
                colnames(dat) <- paste0("C", 1L:ncol(dat))

        }

        if (!is.null(input[["hot_counts"]]))
            dat <- hot_to_r(input[["hot_counts"]])

        dat
    })

    output[["hot_counts"]] = rhandsontable::renderRHandsontable({
      rhandsontable::rhandsontable(raw_counts(), readOnly = FALSE, selectCallback = TRUE)
    })

    processed_counts <- reactive({
        process_counts(raw_counts())
    })

    occs <- reactive({
        get_occs(processed_counts())
    })

    fits <- reactive({
        fit_counts(processed_counts(), separate = input[["sep_exp"]], model = input[["chosen_models"]], level = input[["conf_level"]])
    })

    compared_fits <- reactive({
        compare_fit(processed_counts(), fits())
    })

    summarized_fits <- reactive({
        summary_fitlist(fits())
    })


    output[["input_data"]] <- DT::renderDataTable({
        my_DT(raw_counts())
    })

    output[["input_data_summary"]] <- DT::renderDataTable({
        summ <- summary_counts(processed_counts())
        formatRound(my_DT(summ), c(2, 4, 5), digits = 4)
    })

    output$downloadData <- downloadHandler(
      filename = function() {
        paste("input_data_summary", ".csv", sep = "")
      },
      content = function(file) {
        write.csv(formatRound(my_DT(summ), c(2, 4, 5), digits = 4), file, row.names = FALSE)
      }
    )


    output[["input_data_distr_tab"]] <- DT::renderDataTable({
        dat <- dcast(occs(), x ~ count, value.var = "n")
        colnames(dat)[1] <- "Count"
        my_DT(dat)
    })

    output[["input_data_distr_plot"]] <- renderPlot({
        plot_occs(occs())
    })

    output[["input_data_distr_plot_ui"]] <- renderUI({
        plotOutput("input_data_distr_plot", height = 260 + 70 * length(processed_counts()))
    })

    output[["input_data_distr_plot_db"]] <- downloadHandler("distr_barplot.svg", content = function(file) {
        ggsave(file, plot_occs(occs()), device = svg, height = 260 + 70 * length(processed_counts()), width = 297,
            units = "mm")
    })
    # mean values ----------------------------
    output[["fit_plot"]] <- renderPlot({
        plot_fitlist(fits())
      # print(fits())
    })

    output[["model_decision"]] <- renderUI({
        HTML(decide(summarized_fits(), input[["sep_exp"]]))
    })

    output[["fit_plot_db"]] <- downloadHandler("fit_CI.svg", content = function(file) {
        ggsave(file, plot_fitlist(fits()), device = svg, height = 297, width = 297, units = "mm")
    })

    output[["fit_tab"]] <- DT::renderDataTable({
        # my_DT(summary_fitlist(fits()))
        dat <- summarized_fits()[, c("count", "lambda", "lower", "upper", "BIC", "model")]
        formatRound(my_DT(dat), 2L:5, digits = 4)
    })

    output[["coef_tab"]] <- DT::renderDataTable({
        # my_DT(summary_fitlist(fits()))
        dat <- summarized_fits()[, c("count", "lambda", "theta", "r", "model")]
        formatRound(my_DT(dat), 2L:4, digits = 4)
    })

    # compare distrs ----------------------------
    output[["cmp_plot"]] <- renderPlot({
        plot_fitcmp(compared_fits())
    })

    output[["cmp_plot_db"]] <- downloadHandler("cmp.svg", content = function(file) {
        ggsave(file, plot_fitcmp(compared_fits()), device = svg, height = 297, width = 297, units = "mm")
    })

    output[["cmp_sep_tab"]] <- DT::renderDataTable({
        comp <- compared_fits()
        formatRound(my_DT(comp), c(2, 4, 5), digits = 4)
    })

    output[["countfitteR_report_download"]] <- downloadHandler(filename = "countfitter_report.html", content = function(file) {
        knitr::knit(input = "./inst/countfitteR/report/countfitter_report.Rmd", output = "countfitter_report.md", quiet = TRUE)
        on.exit(unlink(c("countfitter_report.md", "figure"), recursive = TRUE))
        markdown::markdownToHTML("countfitter_report.md", file, stylesheet = "./inst/countfitteR/report/report.css", options = c("toc", markdown::markdownHTMLOptions(TRUE)))
    })

})
