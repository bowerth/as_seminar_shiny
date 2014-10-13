---
title       : R shiny
subtitle    : OECD A/S seminar 2014
author      : Bo Werth
job         : Statistician STI/EAS
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      #
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
ext_widgets : {rCharts: [libraries/nvd3]}
---

<!-- 
## Outline

- R in the Statistical Office
- Motivation
- About Shiny
- Shiny features
- Structure of a Shiny App
 - ui.R
 - server.R
- Example apps
- Reactive programming model
- Reactive sources end endpoints
- Applied example: ratio and index calculation
- Reactive conductors
- Applied example: SDMX
-->

## R and the Statistical Office

- Visit UNIDO to discuss automatic data validation
- Design interfaces: make R functions available to economists
- `gWidgets2` by John Verzani useful but complex and rigid
- `shiny` by Joe Cheng (now RStudio) very intuitive and flexible
- first test: app to explore Paris real estate offers
- challenge: can it be used for professional tasks?
 - trade-off between convention and customisation
 - expectations to interactive tools: when do they become useful?
 - can smooth transition from statistical to analytical tasks?

--- &twocol

## Motivation

*** =left

### +
- access speed
- routine operations
- reproducibility
- available methods
- flexibility of presentation
- user empowerment

*** =right

### -
- development time
- changing requirements
- maintenance
- transparency

--- .class #id

## What is Shiny?

- Interactive web applications around your R analysis
- Zero HTML/CSS/JavaScript knowledge is required...
- ...but fully customisable and extensible with HTML/CSS/JavaScript
- Designed to integrate with existing JavaScript libraries (for visualisation)
- Uses a [reactive](http://en.wikipedia.org/wiki/Reactive_programming) programming model which allows dramatically simpler code than traditional UI or web programming
- Shiny applications are automatically "live" in the same way that spreadsheets are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser

Shiny comes in two parts:

1. the shiny R package for developing Shiny apps
2. Shiny server for deploying them

<!-- Source: https://github.com/rstudio/shiny -->

--- .class #id

## Use Cases

- Display data: show more data than can be displayed in one chart
- Explore data: change mapping of variables to visual elements
- Calculation: derive new indicators from variables in data set
- Robustness: test sensitivity of results to changes in model parameters

--- &twocol

## Structure of a Shiny App

Shiny apps have two components:

*** =left
a user-interface script

The user-interface script `ui.R` controls the layout and appearance of your app. It contains:

- layout information, e.g. default layouts, bootstrap theme, custom grid layout
- controls for `inputs` into the application, e.g. selectInput, sliderInput, numericInput
- appearance of `outputs`, e.g. text boxes, tables and plot size

*** =right
a server script

The server-side script `server.R` contains the instructions that are required to build the application. It can:

- use inputs from the ui script, e.g. for subsetting data or changing parameters
- create reactive elements that refresh when inputs change
- create `outputs` that are returned to the user interface

--- &twocol

## Reactive Sources and Endpoints

The simplest structure of a reactive program involves just a source and an endpoint:

<p style="text-align:center"><img src="assets/img/reactive_programming_model_schema_source_endpoint.png" alt="source and endpoint" style="height: 125px"/></p>

*** =left
source

the source typically is user `input` through a browser interface (item selection, type text string, button click etc.). These actions will set values that are reactive sources. Reactive sources can signal objects `downstream` that they need to re-execute.

*** =right
endpoint

reactive endpoints are accessible through the `output` object (in most cases). A reactive endpoint is usually something that appears in the user's browser window, such as a plot or a table of values. Reactive endpoints can be told to re-execute by the reactive environment, and can request `upstream` objects to execute.

--- .class #id

## Example App
### rCharts Polyplot

replication of tableau visualisation [Percentage of employed who are senior managers, by sex](http://www.oecd.org/gender/data/proportionofemployedwhoareseniormanagersbysex.htm)

- data: senior manager percentages by gender across countries
- source: International Labor Organization
- function: interactive data display with rCharts' `polycharts` binding
- reference: http://ramnathv.github.io/rChartsShiny/

Note: uses `global.R` script to load data

--- .class #id

<p style="text-align:center"><img src="assets/img/runApp_rChartsPolyplot.png" alt="rChartsPolyplot app" style="height: 550px"/></p>

--- .class #id

## Reactive programming model
### Reactive conductors

The amount of computation can be reduced by adding a reactive conductor in between the source and endpoints:

<p style="text-align:center"><img src="assets/img/reactive_programming_model_schema_conductor.png" alt="reactive conductor" style="height: 125px"/></p>

Reactive conductors are placed somewhere in between sources and endpoints on the reactive graph. They are typically used for encapsulating slow operations. Try to prevent unnecessary work, especially if the app needs to do a lot of slow computation.

http://shiny.rstudio.com/articles/reactivity-overview.html

--- .class #id

## Example App
### histogram

simple histogram with slider to change the binwidth

- data: Waiting time between eruptions and the duration of the eruption for the Old Faithful geyser in Yellowstone National Park, Wyoming, USA.
- source: Azzalini, A. and Bowman, A. W. (1990). A look at some data on the Old Faithful geyser. Applied Statistics 39, 357–365.
- function: `seq` to create histogram breaks
- reference: http://shiny.rstudio.com/tutorial/lesson1/

--- .class #id

### histogram

<p style="text-align:center"><img src="assets/img/runApp_histogram.png" alt="histogram app" style="height: 550px"/></p>

--- .class #id

## Input Controls

A range of default controls are available:

- actionButton: Action Button
- checkboxInput: A single check box
- fileInput: A file upload control wizard
- helpText: Help text that can be added to an input form
- numericInput: A field to enter numbers
- radioButtons: A set of radio buttons
- selectInput: A box with choices to select from
- sliderInput: A slider bar
- textInput: A field to enter text

http://shiny.rstudio.com/tutorial/lesson3/

--- .class #id

### Input Controls 1

<p style="text-align:center"><img src="assets/img/runApp_widgets-1.png" alt="shiny widgets 1" style="width: 950px"/></p>

--- .class #id

### Input Controls 2

<p style="text-align:center"><img src="assets/img/runApp_widgets-2.png" alt="shiny widgets 2" style="width: 950px"/></p>

--- .class #id

## Example App
### k-means

k-means clustering, "X" marking the center of the cluster, points coloured according to clusters

- data: measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris (Iris setosa, versicolor, and virginica).
- source: Anderson, Edgar (1935). The irises of the Gaspe Peninsula, Bulletin of the American Iris Society, 59, 2–5.
- function: clustering of iris data with `kmeans`
- reference: Joe Cheng on RStudio Shiny http://vimeo.com/94184686

--- .class #id

### k-means

<p style="text-align:center"><img src="assets/img/runApp_k-means.png" alt="k-means app" style="height: 550px"/></p>

--- .class #id

## Display Reactive Output

- renderPrint: print summary statistics etc.
- renderPlot: base plot or lattice graphics
- renderTable: basic table output
- renderChart: interactive [rCharts](http://rcharts.io/) using d3.js (`js`)
- renderDataTable: table with embedded controls (`js`)
- downloadHandler: trigger file download

--- .class #id

### renderPrint and renderPlot 1: ICIO Barplot by Industry
<p style="text-align:center"><img src="assets/img/runApp_industry_icioFddva_plots_barchart.png" alt="industry app" style="height: 550px"/></p>

--- .class #id

### renderPrint and renderPlot 2: ICIO Selection Matrix
<p style="text-align:center"><img src="assets/img/runApp_industry_icioFddva_plots_dimensions.png" alt="industry app" style="height: 550px"/></p>

--- .class #id

### renderPrint and renderPlot 3: STAN R&D
<p style="text-align:center"><img src="assets/img/runApp_industry_stanRnd_plots_lines.png" alt="industry app" style="height: 550px"/></p>

--- .class #id

### renderTable and renderChart: LFS Share 
<p style="text-align:center"><img src="assets/img/runApp_industry_lfsShare_nvd3charts.png" alt="industry app" style="height: 300px"/></p>
<p style="text-align:center"><img src="assets/img/runApp_industry_lfsShare_tables.png" alt="industry app" style="height: 200px"/></p>

--- .class #id

### renderDataTable: STAN Indicators
<p style="text-align:center"><img src="assets/img/runApp_industry_stanIndic_datatables.png" alt="industry app" style="height: 550px"/></p>

--- .class #id

### downloadHandler: SDMX Browser
<p style="text-align:center"><img src="assets/img/runApp_industry_sdmxBrowser_ui_download_csv.png" alt="industry app" style="height: 170px"/></p>
<p style="text-align:center"><img src="assets/img/runApp_industry_sdmxBrowser_output_excelcsv.png" alt="industry app" style="height: 300px"/></p>

--- .class #id

### downloadHandler: STAN R&D
<p style="text-align:center"><img src="assets/img/runApp_industry_stanRnd_download_plot.png" alt="industry app" style="height: 500px"/></p>

--- .class #id

## R Calculations

- shiny requires a running R session 
- creation of self-service tools for statistical analysis
- straight-forward use of functions from existing packages
- beneficial to create own package(s) from scripts early
 - development: https://github.com/hadley/devtools
 - documentation: http://r-pkgs.had.co.nz/man.html
- installation on external server from source code platforms

<p style="text-align:center;"><img src="assets/img/adv-r_binding.png" alt="function binding" style="height: 200px"/></p>

--- .class #id

## Example App
### STAN Indicators

- define formula: `IPYE = VALK / EMPN / (VALK_2005 / EMPN_2005)`
- parse formula: remove non-alphanumeric characters: `[^a-zA-Z0-9]`
- subset data to variables: `subset(data,var%in%c("VALU","EMPN","VALK"))`
- pivot with denominators: `VALU|EMPN|VALK|VALU_2005|EMPN_2005|VALK_2005`
- calculate `IPYE` according to formula

--- .class #id

### STAN Indicators

<p style="text-align:center;"><img src="assets/img/runApp_industry_stanIndic_plots_line.png" alt="industry app" style="height: 500px"/></p>

--- .class #id

## Example App
### ICIO Foreign Demand Domestic Value Added

- select dimensions
- subset data from multidimensional arrays
- perform calculations:

```
data.couX.indX <- data.conv1 * data.demand
aaa <- xB %*% data.couX.indX
aaa <- apply(aaa, 1, sum)
```

- aggregate and display results (table, barchart, map)

--- .class #id

### ICIO Foreign Demand Domestic Value Added 1

<p style="text-align:center;"><img src="assets/img/runApp_industry_icioFddva_aggregation.png" alt="industry app" style="height: 500px"/></p>

--- .class #id

### ICIO Foreign Demand Domestic Value Added 2

<p style="text-align:center;"><img src="assets/img/runApp_industry_icioFddva_edit.png" alt="industry app" style="height: 550px"/></p>

--- .class #id

## Integrating Applications
### Radiant

Perform various tasks on the same dataset
- customize UI to make best use of a single R function
- optimized outputs are returned from function calls

“There are only two hard things in Computer Science: cache invalidation and naming things.” 
Phil Karlton

Requires systematic structure:
- naming conflicts: prepend objects and functions with application id
- common data across applications: reduce memory requirements
- generalize processing and and exporting of results
- flexibly expand and shrink functionality (testing, production)

--- .class #id

### Radiant: Data

<p style="text-align:center;"><img src="assets/img/runApp_radiant_data_manage.png" alt="industry app" style="height: 500px"/></p>

--- .class #id

### Radiant: Visualize

<p style="text-align:center;"><img src="assets/img/runApp_radiant_data_visualize.png" alt="industry app" style="height: 500px"/></p>

--- .class #id

### Radiant: Report

<p style="text-align:center;"><img src="assets/img/runApp_radiant_data_report_preview.png" alt="industry app" style="height: 550px"/></p>

--- .class #id

## Advanced Example
### SDMX Browser

- connecting to Java library from R
- obtain data flows from provider, its dimensions and select codes interacetively
- send SDMX query to retrieve values
- transform returned time series into table format, create basic plots and download information

<p style="text-align:center;"><img src="assets/img/runApp_industry_sdmxBrowser_sdmxlogo.png" alt="industry app"/></p>

--- .class #id

<p style="text-align:center;"><img src="assets/img/runApp_industry_sdmxBrowser_amattioc.png" alt="industry app"/></p>

--- .class #id

<p style="text-align:center;"><img src="assets/img/runApp_industry_sdmxBrowser_sdmxHelp().png" alt="industry app"/></p>

--- .class #id

<p style="text-align:center;"><img src="assets/img/runApp_industry_sdmxBrowser_ui_flow.png" alt="industry app"/></p>

--- .class #id

### SDMX Browser: DataTables
<p style="text-align:center;"><img src="assets/img/runApp_industry_sdmxBrowser_datatables.png" alt="industry app"/></p>

--- .class #id

### SDMX Browser: Plots
<p style="text-align:center;"><img src="assets/img/runApp_industry_sdmxBrowser_plots.png" alt="industry app"/></p>

--- .class #id

## Going Public - Server Hosting

RStudio server: shinyapps.io
- free beta
- no maintenance
- good performance
- intuitive interface
- professional subscriptions coming soon

Self-hosting on cloud server: 
- Microsoft Azure (or: Amazon EC2, Google...)
- Spec: 4-core, 2GB RAM: 1300 Euros p.a.
- RedHat Server license: 500 Euros p.a.

--- .class #id

## System Architecture

<p style="text-align:center;"><img src="assets/img/architecture.svg" alt="reactive programming" style="height: 400px"/></p>

- testing environment: http://10.101.26.220:3838/industry
- production environment: http://oecd-icio.cloudapp.net:3838

--- .class #id

## More Information

Shiny Tutorial:

- http://shiny.rstudio.com/tutorial

Massive Open Online Courses:

- CS109 Data Science, School of Engineering and Applied Sciences http://cs109.github.io/2014/
- Developing Data Products by Brian Caffo, PhD, Jeff Leek, PhD, Roger D. Peng, PhD, John Hopkins University, Bloomberg School of Public Health (part of Data Science specialisation)
