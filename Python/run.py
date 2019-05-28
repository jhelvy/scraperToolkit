# -*- coding: utf-8 -*-

# Set the working directory
import os
import sys
os.chdir('path-to-Scraper-folder')
# print(os.getcwd())

# Import functions, settings, and data
sys.path.insert(0, './code')
from functions import*

scraper = Scraper()
scraper.openBrowser()

# -----------------------------------------------------------------------------
# Some common methods

# Get the soup
soup = scraper.getSoup()

# Find all divs
divs = soup.find_all('div')

# Find a thing by a name
div = soup.find('div', {'id' : 'idName'})
div = soup.find('div', {'class' : 'className'})

