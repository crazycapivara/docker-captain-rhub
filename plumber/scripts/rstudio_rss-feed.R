library(xml2)
library(magrittr)

rss_feed <- "https://blog.rstudio.com/index.xml"

#* @get /rstudio_rss_feed
rstudio_rss_feed <- function() {
  rss <- read_xml(rss_feed)
  items <- xml_find_all(rss, ".//item")
  titles <- xml_find_all(items, ".//title") %>%
    xml_text()
  links <- xml_find_all(items, ".//link") %>%
    xml_text()
  data.frame(header = titles, link = links)
}

