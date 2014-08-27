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
---

## Objectives

Introduce interactive web applications using R shiny and discuss existing projects

- application hosted on [external server](http://oecd-icio.cloudapp.net:3838)
- applications hosted on [internal server](http://10.101.26.220:3838/industry) (only available from OECD network)

Applications require a modern browser (e.g. Mozilla Firefox or Google Chrome)

--- .class #id 

## Motivation

- the interface between statistics and analysis
- what makes shiny different from [Tableau](http://www.tableausoftware.com)
- too much data: benefits of dynamic charts in reports
- rapid prototyping with R: availability of routines
- server hosting for external communication

--- .class #id 

## Applied example: indicator calculation

- pre-calculation vs. on-demand calculation
- client-side interactivity with javascript: [rCharts](http://rcharts.io/gallery/)
- see example [STAN > STAN Indicators](http://10.101.26.220:3838/industry) (only available from OECD network)

--- .class #id 

## Applied example: SDMX

- connecting to Java library from R
- obtain data flows from provider, its dimensions and select codes interacetively
- send SDMX query to retrieve values
- transform returned time series into table format, create basic plots and download information
- see example [SDMX > SDMX Browser](http://10.101.26.220:3838/industry) (only available from OECD network)

--- .class #id 

## Prerequisites

- interest in statistical programming with R
- follow first lesson of the [shiny tutorial](http://shiny.rstudio.com/tutorial)
