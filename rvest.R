# Some common functions for scraping with the rvest library

library(tidyverse)
library(rvest)

# Get the html node set
html = read_html(url)

# Common text manipulation
str_to_lower()
str_replace('textToReplace', '-')
str_split('textToSplitOn', simplify=T)

# Use '.' to find elements
html_nodes('div._fi350k')
html_nodes('h4.heading-2')

# Common elements
html_nodes('a')
html_attr('href')

# Find tables
tables = read_html(url) %>%
    html_nodes('table') %>%
    html_table(header=T, trim=T)
