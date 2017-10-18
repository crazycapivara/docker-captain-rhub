FROM rocker/r-base

LABEL maintainer="<crazycapivara@gmail.com>"

# ... devtools deps ...
RUN apt-get update && apt-get install libcurl4-gnutls-dev libxml2-dev libssl-dev -y

RUN install2.r devtools testthat

