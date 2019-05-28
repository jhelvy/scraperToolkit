# This file gets all the unique urls to the unique pages.
# It then saves each of those pages in the "data" folder. It then parses the
# data tables from each of those pages and merges them together into a single
# data file called "data.csv"

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
# All the scraping from the web

# 1)
# Scrape and save all the urls
allUrls <- getAllUrls()
write_csv(allUrls, paths$allUrls)

# 2)
# Save each webpage as an html file
allUrls <- read_csv(paths$allUrls)
saveAllPages(allUrls, paths)

# 3)
# Parse all the tables from the saved pages as a list of data frames
allUrls <- read_csv(paths$allUrls)
parseAllDfsFromPages(allUrls, paths)

# 4)
# Merge all the parsed data frames
allUrls  <- read_csv(paths$allUrls)
allDfs   <- readRDS(paths$allDfs)
data     <- makeData(allDfs, allUrls)
write_csv(data, paths$data)
