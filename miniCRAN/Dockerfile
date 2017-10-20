FROM rocker/r-base

LABEL maintainer="<crazycapivara@gmail.com>"

RUN apt-get update && apt-get install -y libcurl4-gnutls-dev libssl-dev libxml2-dev

RUN install2.r miniCRAN

