#!/bin/bash
set -e

cur_dir=$(pwd)

cmd=${cur_dir}/backend

operation=$1
case ${operation} in
        start)
                ${cmd} initialize
                nohup ${cmd} serve > backend.log &
                ;;
        stop)
                ps -ef | grep "${cmd} serve" | grep -v "grep" | awk '{print $2}' | xargs kill
                ;;
        log)
                tail -f backend.log
                ;;
        *)
                ;;
esac