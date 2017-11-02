#!/bin/sh
docker run --rm -it -v `pwd`/scripts:/scripts julia julia /scripts/random.jl
docker run --rm -it -v `pwd`/scripts:/scripts rocker/r-base r /scripts/multiply.R
docker run --rm -it -v `pwd`/scripts:/scripts continuumio/miniconda3 python /scripts/print_that.py

