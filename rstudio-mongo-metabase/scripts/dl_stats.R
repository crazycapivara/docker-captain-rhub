library(cranlogs)
library(mongolite)

# get logs
cat("Fetch logs\n")
pkgs <- c("shiny", "shinydashboard", "rmarkdown", "leaflet")
logs <- cran_downloads(pkgs, when = "last-month")
print(tail(logs))

# write logs to db
db <- "rstudio"
collection <- "cranlogs"

cat("insert data\n")
conn <- mongo(collection, db = db, url="mongodb://mongodb")
conn$count()
conn$insert(logs)
cat("done\n")
