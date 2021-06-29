##### preparing for the workshop ######

# install packages ####
wanted.packages <- c("tidyverse","ggplot2","devtools","shiny","gganimate","plotly","kableExtra",
                     "DT","broom","rsconnect")

# Check what packages need to be installed
new.packages <- wanted.packages[!(wanted.packages %in% installed.packages()[,"Package"])]

# install the not yet installed but required packages and load them
if(length(new.packages)) install.packages(new.packages,dependencies = TRUE)
sapply(wanted.packages, require, character.only = TRUE)

# install papaja ####
"papaja" %in% installed.packages()[,"Package"]
# was already installed



