#!/bin/sh
docker run -it \
	-v `pwd`/scripts:/scripts \
	-v `pwd`/repo:/miniCRAN \
	crazycapivara/minicran r /scripts/create_repo.R
docker run -p 8080:80 \
	-v `pwd`/repo:/usr/share/nginx/html \
	nginx:alpine

