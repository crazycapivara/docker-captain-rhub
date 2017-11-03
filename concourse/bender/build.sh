#!/bin/sh
set -e -x

install2.r magrittr

Rscript -e "library(magrittr);iris %>% head() %>% print()"

