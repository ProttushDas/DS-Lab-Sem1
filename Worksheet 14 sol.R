library(ggplot2)
library(gapminder)
library(shiny)
library(tidyverse)
setwd("C:/Users/MTH/Downloads/worksheet-14-ProttushDas-main")
gapminder <- read.csv("gapminder.csv")


# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Gapminder Data"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(
      # Input: Continent checkboxes ----
      # Note: Changes made to the caption in the textInput control
      # are updated in the output area immediately as you type
      checkboxGroupInput(inputId = "continents",
                    label = "Choose which continents",
                    choices = unique(gapminder$continent),
                    select = c("Asia, Europe")),
      
      # Input: Year interval ----
      sliderInput("years.range", 
                  "Select Years",
                  min = min(gapminder$year), 
                  max = max(gapminder$year),
                  value = range(gapminder$year)),
      
      # Input: Country ----
      selectInput(inputId = "country",
                  label = "Select Country for Comparison",
                  choices = unique(gapminder$country))
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("Life Expectancy and GDP Analysis", container = span)),
      
      # Output: HTML plot with requested number of observations ----
      plotOutput("bubble"),
      plotOutput("line")
    )
  )
)

server <- function(input, output)
{
  cont <- reactive({
    input$years.range
  })
  
  
}

      
