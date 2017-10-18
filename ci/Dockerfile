FROM rocker/r-base

LABEL maintainer="<crazycapivara@gmail.com>"

RUN install2.r testthat

ADD ./scripts /scripts

WORKDIR /scripts

CMD ["r", "run_tests.R"]

