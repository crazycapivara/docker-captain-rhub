#!/bin/bash
docker run -it --rm \
	-v `pwd`/book:/book \
	crazycapivara/r-base-bookdown r render_book.R

