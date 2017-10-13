FROM rocker/rstudio

LABEL maintainer="crazycapivara@gmail.com"

RUN install2.r rmarkdown formatR bookdown

VOLUME ["/home/rstudio/public"]

RUN chown -R rstudio:rstudio /home/rstudio/public

