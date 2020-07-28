library(shinyWidgets)
library(shiny)
library(shinythemes)

withCustomSpinner <- function(widget) {
  shinycssloaders::withSpinner(widget)
}

plotWithSpinner <- function(plotId, ...) {
  withCustomSpinner(plotOutput(plotId), ...)
}

dataTableWithSpinner <- function(dataTableId, ...) {
  withCustomSpinner(DT::dataTableOutput(dataTableId), ...)
}