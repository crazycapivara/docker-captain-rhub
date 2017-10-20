FROM rocker/r-base

LABEL maintainer="crazycapivara@gmail.com"

RUN install2.r rmarkdown formatR bookdown

ADD ./book /book

WORKDIR /book

RUN apt-get update && apt-get install pandoc -y \
	&& rm -rf /var/lib/apt/lists/*

