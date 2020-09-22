require(shiny)
require(markdown)

shinyUI(fluidPage(
    sidebarLayout(
      sidebarPanel(
        fileInput("forecast", "Choose Forecast File",multiple = FALSE,accept = c(".csv")),
        hr(),
        selectInput("target","Target", choices = 'NA'),
        shinyWidgets::pickerInput("abbreviation","Location",choices = 'NA', options = list(`actions-box` = TRUE), multiple = TRUE),
        shinyWidgets::pickerInput("county","County", choices = 'NA', options = list(`actions-box` = TRUE), multiple = TRUE),
        selectInput("sources","Truth sources", c("JHU-CSSE","USAFacts","NYTimes"), selected = "JHU-CSSE", multiple = TRUE),
        dateRangeInput("dates","Date range", start = "2020-03-01", end =  Sys.Date())
      ), 
      
      mainPanel(
        plotOutput("latest_plot")
      )  
    )
  )
)