shinyUI(pageWithSidebar(
  headerPanel('k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(iris)),
    selectInput('ycol', 'Y Variable', names(iris), selected=names(iris)[2]),
    numericInput('clusters', 'Cluster count', 3)
    ),
  mainPanel(
    plotOutput('plot1', height=400)
    )
  ))