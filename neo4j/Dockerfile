#FROM rocker/r-base
FROM crazycapivara/minicran

LABEL maintainer="<crazycapivara@gmail.com>"

RUN install2.r RNeo4j

ADD ./scripts /scripts

WORKDIR /scripts

