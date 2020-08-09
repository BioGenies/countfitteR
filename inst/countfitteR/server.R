library(shiny)
library(DT)
library(reshape2)
library(rmarkdown)
library(ggplot2)
library(MASS)
library(countfitteR)

# load("./countfitteR/data/laf.RData")
source("./report/ggtheme.R")
data("case_study")

options(DT.options = list(dom = "Brtip", buttons = c("copy", "csv", "excel", "print")))

my_DT <- function(x) datatable(x, escape = FALSE, extensions = "Buttons", filter = "top", rownames = FALSE)

shinyServer(function(input, output) {
  init_data <- reactive({
    # if there is no data, case study is loaded
    if (is.null(input[["input_file"]])) {
      dat <- case_study
    } else {
      dat <- switch(input[["csv_type"]],
                    csv1 = read.csv(input[["input_file"]][["datapath"]],
                                    header = input[["header"]],
                                    check.names = FALSE),
                    csv2 = read.csv2(input[["input_file"]][["datapath"]],
                                     header = input[["header"]],
                                     check.names = FALSE))
      if (!input[["header"]])
        colnames(dat) <- paste0("C", 1L:ncol(dat))
    }
    
    if (!is.null(input[["hot_counts"]]))
      dat <- input[["hot_counts"]]
    
    dat
  })
  
  valid_data <- reactiveVal(value=NULL, label="valid_data")
  table_data <- reactiveVal(value=NULL, label="table_data")
  observeEvent(init_data, {
    valid_data(init_data())
  })
  observeEvent(init_data, {
    table_data(init_data())
  })
  
  output[["hot_counts"]] <- DT::renderDataTable({
    DT::datatable(table_data(), editable = TRUE)
  })
  
  observeEvent(input$hot_counts_cell_edit, {
    row <- input$hot_counts_cell_edit$row
    col <- input$hot_counts_cell_edit$col
    value <- input$hot_counts_cell_edit$value
    formatted_value <- abs(as.integer(value))
    
    if(is.na(formatted_value)) {
      table_data(valid_data())
      replaceData(dataTableProxy("hot_counts"), valid_data())
      showModal(modalDialog(title="validation error", "invalid cell value"))
    } else {
      modified_counts <- isolate(valid_data())
      modified_counts[row, col] <- as.integer(value)
      valid_data(modified_counts)
      
      if(value != formatted_value) {
        table_data(valid_data())
        replaceData(dataTableProxy("hot_counts"), valid_data())
        showModal(modalDialog(title="formatter",
                              paste0("the value ", value, " has been changed to ", formatted_value)))
      }
    }
  })
  
  processed_counts <- reactive({
    countfitteR:::process_counts(valid_data())
  })
  
  occs <- reactive({
    countfitteR:::get_occs(processed_counts())
  })
  
  fits <- reactive({
    countfitteR:::fit_counts(processed_counts(), separate = input[["sep_exp"]], 
                             model = input[["chosen_models"]], level = input[["conf_level"]])
  })
  
  compared_fits <- reactive({
    countfitteR:::compare_fit(processed_counts(), fits())
  })
  
  summarized_fits <- reactive({
    countfitteR:::summary_fitlist(fits())
  })
  
  output[["input_data"]] <- DT::renderDataTable({
    my_DT(raw_counts())
  })
  
  output[["input_data_summary"]] <- DT::renderDataTable({
    summ <- countfitteR:::summary_counts(processed_counts())
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
    countfitteR:::plot_occs(occs()) + cf_theme
  })
  
  output[["input_data_distr_plot_ui"]] <- renderUI({
    plotOutput("input_data_distr_plot", height = 260 + 70 * length(processed_counts()))
  })
  
  output[["input_data_distr_plot_db"]] <- downloadHandler("distr_barplot.svg", content = function(file) {
    ggsave(file, countfitteR:::plot_occs(occs()) + cf_theme, device = svg, 
           height = 260 + 70 * length(processed_counts()), width = 297,
           units = "mm")
  })
  # mean values ----------------------------
  output[["fit_plot"]] <- renderPlot({
    countfitteR:::plot_fitlist(fits()) + cf_theme
  })
  
  output[["model_decision"]] <- renderUI({
    HTML(countfitteR:::decide(summarized_fits(), input[["sep_exp"]]))
  })
  
  output[["fit_plot_db"]] <- downloadHandler("fit_CI.svg", content = function(file) {
    ggsave(file, countfitteR:::plot_fitlist(fits()) + cf_theme, device = svg, height = 297, width = 297, units = "mm")
  })
  
  fit_tab_dt <- reactive({
    # my_DT(summary_fitlist(fits()))
    dat <- summarized_fits()[, c("count", "lambda", "lower", "upper", "BIC", "model")]
    formatRound(my_DT(dat), 2L:5, digits = 4)
  })
  
  output[["fit_tab"]] <- DT::renderDataTable({
    fit_tab_dt()
  })
  
  coef_tab_dt <- reactive({
    dat <- summarized_fits()[, c("count", "lambda", "theta", "r", "model")]
    formatRound(my_DT(dat), 2L:4, digits = 4)
  })
  
  
  
  output[["coef_tab"]] <- DT::renderDataTable({
    coef_tab_dt()
  })
  
  # compare distrs ----------------------------
  output[["cmp_plot"]] <- renderPlot({
    countfitteR::plot_fitcmp(compared_fits()) + cf_theme
  })
  
  output[["cmp_plot_ui"]] <- renderUI({
    plotOutput("cmp_plot", height = 260 + 70 * length(processed_counts())) 
  })
  
  output[["cmp_plot_db"]] <- downloadHandler("cmp.svg", content = function(file) {
    ggsave(file, countfitteR:::plot_fitcmp(compared_fits()) + cf_theme, device = svg, 
           height = 297, width = 297, units = "mm")
  })
  
  
  cmp_sep_tab <- reactive({
    comp <- compared_fits()
    formatRound(my_DT(comp), c(2, 4, 5), digits = 4)
  })
  
  output[["cmp_sep_tab"]] <- DT::renderDataTable({
    cmp_sep_tab()
  })
  
  output[["countfitteR_report_download"]] <- downloadHandler(filename = "countfitter_report.html", content = function(file) {
    src <- normalizePath(".")
    
    # temporarily switch to the temp dir, in case you do not have write
    # permission to the current working directory
    owd <- setwd(tempdir())
    on.exit(setwd(owd))
    
    dir.create("readmes")
    file.copy(paste0(src, "/readmes"), getwd(), 
              recursive = TRUE)
    
    dir.create("report")
    file.copy(paste0(src, "/report"), getwd(), 
              recursive = TRUE)
    
    out <- render("./report/countfitter_report.Rmd", 
                  output_format = "html_document", file, quiet = TRUE)
    file.rename(out, file)
  })
  
})
