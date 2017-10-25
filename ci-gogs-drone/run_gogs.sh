#!/bin/bash
docker run -d --name gogs -p 8022:22 -p 3033:3000 -v `pwd`/gogs-data:/data gogs/gogs

