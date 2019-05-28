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

# -----------------------------------------------------------------------------
# View summary of the sales data

# Read in the sales data
data = read_csv(paths$data)

