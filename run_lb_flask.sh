#!/bin/sh
docker-compose -f docker-compose-lb-scale.yml up -d
docker-compose -f docker-compose-lb-scale.yml scale flask=3
docker logs -f dockercaptainrhub_flask_1

