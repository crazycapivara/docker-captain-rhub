#!/bin/sh
docker run -it --rm --network minicran_default rocker/r-base R -e 'available.packages("nginx:80/src/contrib")[, c("Package", "Version")]'

