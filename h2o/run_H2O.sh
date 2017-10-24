#!/bin/sh
docker run -it --rm -v `pwd`/scripts:/scripts --network h2o_default h2o_rstudio r /scripts/use_h2o.R

