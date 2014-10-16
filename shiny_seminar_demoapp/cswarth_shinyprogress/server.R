library(shiny)

## The progressbar is included in the shinyIncubator package.
## To install, install the devtools package if necessary
## (install.packages("devtools")) and run:
## devtools::install_github("shiny-incubator", "rstudio")

library(shinyIncubator)


# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output, session) {
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  output$distPlot <- renderPlot({
    withProgress(session, min=1, max=15, {
      setProgress(message = 'Calculation in progress',
                  detail = 'This may take a while...')
      for (i in 1:15) {
        setProgress(value = i)
        Sys.sleep(0.5)
      }
    })
    # generate an rnorm distribution and plot it
    dist <- rnorm(input$obs)
    hist(dist)
  })
})