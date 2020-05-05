# Workshop: Modern R

This repository contains the materials for the workshop **Modern R** at the SMiP graduate school in Mannheim, Germany. 

The workshop consits of three parts:

- Introduction to `R Markdown`
- Introduction to writing APA conform articles with the `papaja`-package
- Introduction to `Shiny`


Packages used:

```r
wanted.packages <- c("ggplot2","dplyr","shiny","gganimate","plotly","kableExtra","DT","broom","rsconnect")
  
new.packages <- wanted.packages[!(wanted.packages %in% installed.packages()[,"Package"])]
  
 # installe the not yet installed but required packages and load them
if(length(new.packages)) install.packages(new.packages,dependencies = TRUE)
sapply(wanted.packages, require, character.only = TRUE)
```

