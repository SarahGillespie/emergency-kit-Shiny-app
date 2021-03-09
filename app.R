################################################################################
# Creator: Sarah Gillespie
# Date: Spring 2021
# Most up-to-date version located at 
################################################################################

library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(tidyverse)
library(RCurl)

# Get the data -----------------------------------------------------------------

# Define functions -------------------------------------------------------------

# UI ---------------------------------------------------------------------------
# Define UI for application
ui <- fluidPage(

    # Application title
    titlePanel("GRE Practice Quizzes"),

    # sidebar
    sidebarLayout(
        sidebarPanel(
            # HTML formatting
            tags$div(class="header", checked=NA, 
                     tags$h2("Instructions"),
                     tags$p("add here."),
                     tags$h4("Emergency Kit Builder."),
                     tags$p("Author:  Sarah Gillespie")
                     ) # end div
        ), # end sidebar panel

     mainPanel(
         
         # enter your zip code.
         # swap to be numbers only?
         textInput("entered_zipcode", "Enter your zipcode:"),
         textOutput("text")
         
        ) # end main panel 1
     
     # mainPanel(
     #     # add links to the typical items and where to purchase.
     #     # recommend people buy locally.
     #     # this is where recommendations are made
     #     
     # ), # end main panel 1
     # 
     # mainPanel(
     #     # add links to other resources
     #     
     # ) # end main panel 1
     # 
     
    )
)# end of UI

# Sever ------------------------------------------------------------------------
server <- function(input, output, session) {

    
    output$result <- renderText({
        paste("You chose", input$entered_zipcode)
        # add zipcodes coordinates and general weather?
        # is there a way to scrape this from someone? I would rather not hardcode a CSV file of it.
        
    })
    
    
    output$text <- renderText({ input$entered_zipcode })
    
} # end of server function

# Run the application 
shinyApp(ui = ui, server = server)
