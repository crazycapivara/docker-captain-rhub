#!/bin/sh
docker-compose up -d \
  && docker-compose scale shiny=3

