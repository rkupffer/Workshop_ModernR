# Workshop: Modern R

This repository contains the materials for the workshop **Modern R** at the SMiP graduate school in Mannheim, Germany. 

The workshop consits of three parts:

- Introduction to `R Markdown`
- Introduction to the `papaja`-package from Frederik Aust
- Introduction to `shiny`


Packages used:

cggplot2
dplyr

```r
wanted.packages <- packages
  
  
  new.packages <- wanted.packages[!(wanted.packages %in% installed.packages()[,"Package"])]
  
  # installed the not yet installed but required packages and load them
  
  if(length(new.packages)) install.packages(new.packages,dependencies = TRUE)
  sapply(wanted.packages, require, character.only = TRUE)
```
