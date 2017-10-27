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
  data.frame(header = titles, link = links, stringsAsFactors = FALSE)
}

library(tm)

#* @get /rocket_science/<count>
rocket_science <- function(headers = NULL, count = 2, lang= "english") {
  if (is.null(headers)) {
    headers <- rstudio_rss_feed()$header  
  }
  docs <- Corpus(VectorSource(enc2native(headers))) %>%
    tm_map(content_transformer(tolower)) %>%
    tm_map(removePunctuation) %>%
    tm_map(removeWords, enc2native(stopwords(lang))) %>%
    tm_map(removeNumbers) %>%
    tm_map(stripWhitespace)
  tdm <- TermDocumentMatrix(docs)
  findFreqTerms(tdm, as.integer(count))
}

blog <- "https://blog.eoda.de"

eoda_blog <- function(page = 1) {
  xml <- sprintf("%s/page/%i/", blog, page) %>%
    read_html()
  items <- xml_find_all(xml, ".//article")
  xml_find_all(items, ".//header/h2") %>%
    xml_text()
}

#* @get /eoda_blog
eoda_blog_ <- function(last_page = 3) {
  lapply(1:last_page, eoda_blog) %>%
    unlist()
}

#* @get /blog_that
blog_that <- function(count = 3) {
  rocket_science(eoda_blog_(), count = count, lang = "de")  
}

