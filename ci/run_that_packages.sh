#!/bin/bash
docker-compose -f docker-compose-packages.yml up
docker-compose -f docker-compose-packages.yml down --rmi local

