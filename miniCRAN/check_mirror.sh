#!/bin/sh
docker run -it --rm --network minicran_default rocker/r-base R -e 'available.packages("nginx:80/src/contrib")[, c("Package", "Version")]'

#curl localhost:8080/src/contrib/PACKAGES

