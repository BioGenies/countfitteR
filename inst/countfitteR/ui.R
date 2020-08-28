library(shiny)
library(shinythemes)
source("./utils.R")

shinyUI(navbarPage(title = "countfitteR",
                   #theme = shinytheme("cerulean"),
                   theme = "www/shiny_paper.css",
                   id = "navbar", windowTitle = "countfitteR", collapsible=TRUE,
                   tabPanel("Data upload",
                            includeMarkdown("readmes/data_upload/1.md"),
                            fluidRow(column(3, fileInput("input_file", "Choose CSV File with count data:",
                                                         accept=c("text/csv", "text/comma-separated-values,text/plain", ".csv"))),
                                     column(3, checkboxInput("header", "Header", TRUE)),
                                     column(2, radioButtons("csv_type", "Type of csv file",
                                                            c("Dec: dot (.), Sep: comma (;)" = "csv1",
                                                              "Dec: comma (,), Sep: semicolon (;)" = "csv2")))
                            ),
                            textOutput("ncol"),
                            includeMarkdown("readmes/data_upload/2.md")
                   ),
                   navbarMenu("Count data",
                              tabPanel("Summary",
                                       includeMarkdown("readmes/count_data/2.md"),
                                       DT::dataTableOutput("input_data_summary")
                              ),
                              tabPanel("Distribution",
                                       includeMarkdown("readmes/count_data/3.md"),
                                       fluidRow(column(3, downloadButton("input_data_distr_plot_db",
                                                                         "Save chart (.svg)"))),
                                       withCustomSpinner(uiOutput("input_data_distr_plot_ui")),
                                       includeMarkdown("readmes/count_data/4.md"),
                                       dataTableWithSpinner("input_data_distr_tab")
                              )
                   ),
                   navbarMenu("Fitted models",
                              tabPanel(HTML("Mean value (&lambda;) estimates"),
                                       includeMarkdown("readmes/mean_value/1.md"),
                                       fluidRow(column(3, downloadButton("fit_plot_db", "Save chart (.svg)"))),
                                       plotWithSpinner("fit_plot"),
                                       includeMarkdown("readmes/mean_value/2.md"),
                                       dataTableWithSpinner("fit_tab")
                              ),
                              tabPanel("Coefficients",
                                       includeMarkdown("readmes/mean_value/3.md"),
                                       DT::dataTableOutput("coef_tab")),
                              tabPanel("Decision",
                                       uiOutput("model_decision"))
                   ),
                   tabPanel("Compare distributions",
                            includeMarkdown("readmes/cmp_distr/1.md"),
                            fluidRow(column(3, downloadButton("cmp_plot_db", "Save chart (.svg)"))),
                            withCustomSpinner(uiOutput("cmp_plot_ui")),
                            dataTableWithSpinner("cmp_sep_tab")
                   ),
                   tabPanel("Save report",
                            checkboxInput("mean_value_rep", "Mean value estimates",
                                          value = TRUE),
                            checkboxInput("coef_rep", "Coefficients",
                                          value = TRUE),
                            checkboxInput("decision_rep", "Decision",
                                          value = TRUE),
                            checkboxInput("cmp_distr_rep", "Compare distributions",
                                          value = TRUE),
                            p("Be patient. The generation of the report may take few minutes."),
                            downloadButton("countfitteR_report_download",
                                           "Save report")),
                   tabPanel("Settings",
                            includeMarkdown("readmes/settings/1.md"),
                            fluidRow(column(3, checkboxInput("sep_exp", "Separate experiments:", TRUE)),
                                     column(2, numericInput("conf_level", "Confidence level:", 0.95,
                                                            min = 0, max = 1, step = 0.01))
                            ),
                            fluidRow(column(3, checkboxGroupInput("chosen_models", "Count distributions",
                                                                  choices = c("Poisson" = "pois",
                                                                              "NB" = "nb",
                                                                              "ZIP" = "zip",
                                                                              "ZINB" = "zinb"),
                                                                  selected = c("pois", "nb", "zip", "zinb")
                            )))),
                   tabPanel("About",
                            includeMarkdown("readmes/about.md")),
                   tabPanel("Help",
                            includeHTML("readmes/manual.html"))

))
