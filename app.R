library(shiny)
library(bslib)
library(rsconnect)
source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)