# START UP:

# Some websites are not easily scrape-able using the simple read_html() function. Websites might have dynamically-loaded pages that are difficult to navigate through, or some content might be loaded with Javascript that must be rendered in a browser window.

# To scrape these sites, I use the RSelenium package and Docker.

# To use Docker, first signup here: https://hub.docker.com/signup
# Then download the Docker app

# To use RSelenium, install the package: install.packages('RSelenium')

# =============================================================================
# To get the remote driver up and running, follow these steps:

# 1) Load the libraries
library(RSelenium)
library(rvest)

# 2) Run the Docker app

# 3) Once Docker is up and running, open up a Terminal window and run the
#    following commands (I commented them out for now):
# docker run -d -p 4445:4444 selenium/standalone-chrome
# docker ps

# 4) Start the Chrome driver:
remDr <- RSelenium::remoteDriver(remoteServerAddr = "localhost",
                                 port = 4445L,
                                 browserName = "chrome")
remDr$open()

# =============================================================================
# Once you've got your remote driver up and running, you can use it just like
# a web browser to navigate to pages, click on elements in the page, and
# get the source code for the page.

# For example, let's go to google's home page
remDr$navigate('https://www.google.com')

# Take a screenshot to see if the browser has navigated correctly
remDr$screenshot(display=T)

# Click on the "About" button in the top-left
aboutElement <- remDr$findElement(using = 'xpath', '//a')
aboutElement$clickElement()
# View screenshot to confirm the "About" button has been clicked
remDr$screenshot(display=T)

# Get the page source code
htmlCode <- remDr$getPageSource()[[1]]

# Parse the page source code using the rvest library
html = read_html(htmlCode)
