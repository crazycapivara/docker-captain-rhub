#!/bin/sh
docker run -d --name gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v `pwd`/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:latest
docker exec -it gitlab-runner gitlab-runner register

