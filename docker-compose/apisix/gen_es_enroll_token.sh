#!/bin/bash
set -x

container_name=$(docker-compose ps | grep "elasticsearch" | awk '{print $1}')

docker exec -it ${container_name} bin/elasticsearch-create-enrollment-token -s kibana
