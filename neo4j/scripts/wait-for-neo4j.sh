#!/bin/bash
# wait-for-neo4j.sh

set -e

host="$1"
port="$2"
shift 2
cmd="$@"

until Rscript -e "RNeo4j::startGraph('${host}:${port}/db/data', 'neo4j', 'bender')"; do
  >&2 echo "neo4j is unavailable - sleeping"
  sleep 2
done

>&2 echo "neo4j is up - executing command"
exec $cmd

