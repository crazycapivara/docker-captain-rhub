#!/bin/sh
docker run -d --name tensor_flow -p 8686:8787 -v `pwd`/scripts:/home/rstudio/scripts earthlab/r-tensorflow

