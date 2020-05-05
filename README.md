# Workshop: Modern R

This repository contains the materials for the workshop **Modern R** at the SMiP graduate school in Mannheim, Germany. 

The workshop consists of three parts:

- Introduction to `R Markdown`
- Writing APA conform manuscripts with the `papaja` package
- Building interactive web applications in R with `Shiny`


The following code can be used to install the packages used in this workshop:

```r
wanted.packages <- c("ggplot2","devtools","dplyr","shiny","gganimate","plotly","kableExtra","DT","broom","rsconnect")
  
# Check what packages need to be installed
new.packages <- wanted.packages[!(wanted.packages %in% installed.packages()[,"Package"])]
  
 # install the not yet installed but required packages and load them
if(length(new.packages)) install.packages(new.packages,dependencies = TRUE)
sapply(wanted.packages, require, character.only = TRUE)
```

In addition, you need a `TeX` distribution (e.g., MikTeX for Windows, MacTeX for Mac, or TeX Live for Linux) to create .pdf documents. If you did install LaTeX before or already created some .pdf documents with R Markdown, you are good to go.   If you have not installed LaTeX before, I recommend installing TinyTeX (https://yihui.name/tinytex/), which is a light and easy-to-maintain LaTeX distribution for R Markdown.

TinyTex can be installed from within R as follows.

```r
if(!"tinytex" %in% rownames(installed.packages())) install.packages("tinytex")

tinytex::install_tinytex()
```

**Note:** The workshop is based on R 3.6.0. I can not guarantee that all packages still work with the newest R 4.0

