library(cranlogs)
library(mongolite)

# get logs
pkgs <- c("shiny", "shinydashboard", "rmarkdown", "leaflet")
logs <- cran_downloads(pkgs, when = "last-month")

# write logs to db
db <- "rstudio"
collection <- "cranlogs"

conn <- mongo(collection, db = db, url="mongodb://mongodb")
conn$count()
conn$insert(logs)

