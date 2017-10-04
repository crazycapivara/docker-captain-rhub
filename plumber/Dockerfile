FROM rocker/r-base

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN apt-get update -qq && apt-get install -y libxml2-dev

RUN install2.r plumber xml2

ADD ./scripts/rstudio_news.R /endpoints/

EXPOSE 8000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8000, swagger = TRUE)"]
CMD ["/endpoints/rstudio_news.R"]

