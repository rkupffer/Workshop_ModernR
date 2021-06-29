# Workshop: Modern R

This repository contains the materials for the workshop **Modern R** at the SMiP graduate school in Mannheim, Germany. 

The workshop consists of three parts:

- Introduction to `R Markdown`
- Writing APA conform manuscripts with the [`papaja`](https://github.com/crsh/papaja) package
- Building interactive web applications in R with `Shiny`


The following code can be used to install the packages used in this workshop:

```r
wanted.packages <- c("tidyverse","ggplot2","devtools","shiny","gganimate","plotly","kableExtra",
"DT","broom","rsconnect")
  
# Check what packages need to be installed
new.packages <- wanted.packages[!(wanted.packages %in% installed.packages()[,"Package"])]
  
 # install the not yet installed but required packages and load them
if(length(new.packages)) install.packages(new.packages,dependencies = TRUE)
sapply(wanted.packages, require, character.only = TRUE)
```

You also need to install the [papaja-package](https://github.com/crsh/papaja) and a `TeX` distribution (e.g., MikTeX for Windows, MacTeX for Mac, or TeX Live for Linux) to create .pdf documents. 

 If you did install LaTeX before or already created some .pdf documents with R Markdown, you are good to go.   If you have not installed LaTeX before, I recommend installing TinyTeX (https://yihui.name/tinytex/), which is a light and easy-to-maintain LaTeX distribution for R Markdown.

TinyTex can be installed from within R as follows.

```r
if(!"tinytex" %in% rownames(installed.packages())) install.packages("tinytex")

tinytex::install_tinytex()
```



**Note:** The workshop is based on R Version 4.1.0 and RStudio Version 1.4.1717


Package versions I used:
```r
R version 4.1.0 (2021-05-18)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19042)

Matrix products: default

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] DT_0.18           dplyr_1.0.6       plotly_4.9.4.1    ggplot2_3.3.4     shiny_1.6.0      
[6] papaja_0.1.0.9997 tinylabels_0.2.1 

loaded via a namespace (and not attached):
 [1] tidyselect_1.1.1   xfun_0.24          bslib_0.2.5.1      purrr_0.3.4        colorspace_2.0-1  
 [6] vctrs_0.3.8        generics_0.1.0     viridisLite_0.4.0  htmltools_0.5.1.1  yaml_2.2.1        
[11] utf8_1.2.1         rlang_0.4.11       jquerylib_0.1.4    later_1.2.0        pillar_1.6.1      
[16] glue_1.4.2         withr_2.4.2        DBI_1.1.1          RColorBrewer_1.1-2 lifecycle_1.0.0   
[21] munsell_0.5.0      gtable_0.3.0       htmlwidgets_1.5.3  evaluate_0.14      labeling_0.4.2    
[26] knitr_1.33         fastmap_1.1.0      crosstalk_1.1.1    httpuv_1.6.1       markdown_1.1      
[31] fansi_0.5.0        Rcpp_1.0.6         xtable_1.8-4       promises_1.2.0.1   scales_1.1.1      
[36] cachem_1.0.5       jsonlite_1.7.2     farver_2.1.0       mime_0.10          digest_0.6.27     
[41] xaringan_0.22      grid_4.1.0         cli_2.5.0          tools_4.1.0        magrittr_2.0.1    
[46] sass_0.4.0         lazyeval_0.2.2     tibble_3.1.2       tidyr_1.1.3        crayon_1.4.1      
[51] pkgconfig_2.0.3    ellipsis_0.3.2     rsconnect_0.8.18   data.table_1.14.0  rstudioapi_0.13   
[56] assertthat_0.2.1   rmarkdown_2.9      httr_1.4.2         R6_2.5.0           compiler_4.1.0  
```