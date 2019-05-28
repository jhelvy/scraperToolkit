# ----------------------------------------------------------------------------
# 1)
# Functions for getting all the urls to the unique pages

getAllUrls <- function() {
    # return(allUrls %>% select(id, market, make, model, url))
}












# ----------------------------------------------------------------------------
# 2)
# Functions for scraping and locally saving all the html pages

saveAllPages <- function(allUrls, paths) {
    for (i in 1:nrow(allUrls)) {
        row  <- allUrls[i,]
        pagePath <- getPagePath(row, paths)
        # Only save the file if it's not already been saved
        if (! file.exists(pagePath)) {
            print(paste('Saving...', 'model', sep=''))
            html <- readHtml(row$url)
            write_xml(html, file=pagePath)
        }
    }
    cat('Done!')
}

getPagePath <- function(row, paths) {
    modelName <- paste(row$market, cleanText(row$make), cleanText(row$model),
                       sep='|')
    fileName  <- paste(modelName, '.html', sep='')
    pagePath  <- here('data', paths$date, 'pages', fileName)
    return(pagePath)
}











# ----------------------------------------------------------------------------
# 3)
# Functions for scraping and merging the data tables from the saved
# html pages

parseAllDfsFromPages = function(allUrls, paths) {
    # allDfs <- list()
    # for (i in 1:nrow(allUrls)) {
    #     row  <- allUrls[i,]
    #     pagePath <- getPagePath(row, paths)
    #     df <- getPageDf(pagePath)
    #     allDfs[[i]] <- df
    # }
    # saveRDS(allDfs, paths$allDfs)
}

getPageDf <- function(pagePath) {
    return(42)
}












# ----------------------------------------------------------------------------
# 4)
# Functions for merging all the parsed data frames in 'allDfs.Rds' into
# one large data frame

makeData <- function(allDfs, allUrls) {
    # salesData = do.call(rbind, allDfs)
    return(42)
}











# ----------------------------------------------------------------------------
# Other functions

# Change the default read_html to readHtml to always pause for 2 seconds
# after being called
readHtml <- function(url) {
    html <- read_html(url)
    Sys.sleep(2)
    return(html)
}

# Removes strange characters that can cause problems in file paths or urls
cleanText <- function(text) {
    text <- text %>%
        str_replace_all('ë', 'e') %>%
        str_replace_all('é', 'e') %>%
        str_replace_all('º', '_degree') %>%
        str_replace_all('&', '_and_') %>%
        str_replace_all('/', '-') %>%
        str_replace_all('’', '-')
    return(text)
}

# Sets the paths to key files based on the scraping date
getPaths <- function(date) {
    paths <- list()
    paths$date      <- date
    paths$allUrls   <- here('data', date, 'allUrls.csv')
    paths$allDfs    <- here('data', date, 'allDfs.Rds')
    paths$data      <- here('data', date, 'data.csv')
    return(paths)
}

getRawHtml = function(path){
    rawHtml = paste(readLines(path), collapse='\n')
    return(rawHtml)
}
