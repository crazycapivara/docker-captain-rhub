#!/bin/bash
docker run --rm \
	-v `pwd`/book:/book \
	crazycapivara/r-base-bookdown r render_book.R

