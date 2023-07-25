#!/bin/bash
set -x

container_name=$(docker-compose ps | grep "kibana" | awk '{print $1}')

docker exec -it apisix_kibana_1 bin/kibana-verification-code
