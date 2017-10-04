library(xml2)
library(magrittr)

rstudio_blog <- "https://blog.rstudio.com/"

#* @get /rstudio_news
rstudio_news <- function() {
  data <- read_html(rstudio_blog)
  news <- xml_find_all(data, ".//h1")
  headers <- xml_text(news)
  links <- xml_find_all(news, ".//a") %>%
    xml_attr("href") %>%
    paste0(rstudio_blog, .)
  data.frame(header = headers, link = links)
}

