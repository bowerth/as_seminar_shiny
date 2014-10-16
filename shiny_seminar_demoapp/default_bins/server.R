# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  x <- faithful[, 2] # waiting

  bins <- reactive({
    seq(min(x), max(x), length.out = input$bins + 1)
  })
  
  output$distPlot <- renderPlot({
    hist(x, breaks = bins(), col = 'darkgray', border = 'white')
  })
  
  })
