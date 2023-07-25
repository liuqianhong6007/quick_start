#!/bin/bash
set -x

container_name=$(docker-compose ps | grep "elasticsearch" | awk '{print $1}')

docker cp ${container_name}:/usr/share/elasticsearch/config/certs/http_ca.crt . && curl --cacert http_ca.crt -u elastic https://localhost:9200
