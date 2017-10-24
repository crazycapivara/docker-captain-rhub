library(cranlogs)
library(mongolite)

argv <- commandArgs(TRUE)

# get logs
cat("Fetch logs\n")
pkgs <- c("shiny", "shinydashboard", "rmarkdown", "leaflet")
if(!is.na(argv[1])) {
  pkgs <- argv[1]
}
print(pkgs)
logs <- cran_downloads(pkgs, when = "last-month")
print(tail(logs))

# write logs to db
db <- "rstudio"
collection <- "cranlogs"

cat("insert data\n")
conn <- mongo(collection, db = db, url="mongodb://mongodb")
#conn$count()
eat_msg <- conn$insert(logs)
cat("done\n")
