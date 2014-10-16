
library(shiny)
## The progressbar is included in the shinyIncubator package.
## To install, install the devtools package if necessary
## (install.packages("devtools")) and run:
## devtools::install_github("shiny-incubator", "rstudio")

library(shinyIncubator)

## Define UI for application that plots random distributions 
shinyUI(
  pageWithSidebar(
    
    ## Application title
    headerPanel("Hello Shiny!"),
    
    ## Sidebar with a slider input for number of observations
    sidebarPanel(
      ## Initialize progress indicator
      progressInit(),
      
      sliderInput("obs", 
                  "Number of observations:", 
                  min = 1,
                  max = 1000, 
                  value = 500)
    ),
    
    ## Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  ) ## end-pagewithsidebar
) ## end-shinyui
