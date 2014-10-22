demopath <- file.path(dbpath, "GitHub", "as_seminar_shiny", "shiny_seminar_demoapp")

shiny::runApp(file.path(demopath, "054-nvd3-line-chart-output"))

# rChartsShiny
shiny::runApp(file.path(demopath, "ramnathv_rChartsShiny"))

# bins
shiny::runApp(file.path(demopath, "histogram"))
shiny::runApp(file.path(demopath, "histogram"), display.mode='showcase')

# k-means
shiny::runApp(file.path(demopath, "jcheng_k-means"))
shiny::runApp(file.path(demopath, "jcheng_k-means"), display.mode='showcase')

shiny::runApp(file.path(demopath, "081-widgets-gallery"))



# desk: industry
shiny::runApp(file.path(dbpath, "GitHub", "desk", "inst", "industry"))

shiny::runApp(file.path(dbpath, "GitHub", "radiant", "inst", "marketing"))

shiny::runApp(file.path(dbpath, "GitHub", "estateapp"))

## shiny::runApp(file.path(demopath, "058-progress-example"))
## shiny::runApp(file.path(demopath, "cswarth_shinyprogress"))
