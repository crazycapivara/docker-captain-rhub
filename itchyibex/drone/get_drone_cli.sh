#!/bin/sh
curl -L https://github.com/drone/drone-cli/releases/download/v0.8.0/drone_linux_amd64.tar.gz | tar zx
install -t /usr/local/bin drone

