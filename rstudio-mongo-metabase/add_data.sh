#!/bin/sh
#docker run -it --rm -v `pwd`/scripts:/scripts --network rstudiomongometabase_default rstudiomongometabase_rstudio r /scripts/dl_stats.R
docker run -it --rm -v `pwd`/scripts:/scripts --network rstudiomongometabase_default rstudiomongometabase_rstudio Rscript /scripts/dl_stats.R $1

