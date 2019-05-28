# This file is for experimental / temporary analyses
# CAUTION: Anything in here can be overwritten or deleted
# without notice, so don't leave anything important in here!

# -----------------------------------------------------------------------------
# Setup

library(tidyverse)
library(rvest)
library(here)
options(dplyr.width = Inf) # Option to preview all columns in a data frame
source(here('code', 'functions.R'))

# -----------------------------------------------------------------------------
# Set the date and paths to the scraped data

paths <- getPaths('2019-05-16')


