#!/bin/bash

function exec(){
  echo "$@"
  $@
  if [ $? -ne 0 ];then
    exit
  fi
}


command=$1

if [[ "x$command" = "x" || "x$command" = "x-h" ]];then
  echo "usage: ./operate.sh [start|stop|start-forward|stop-forward|clear-log]"
  exit
fi

case "$command" in
  "start")
  exec kubectl apply -f deploy.yaml
  ;;
  
  "stop")
  exec kubectl delete -f deploy.yaml
  ;;

  "start-forward")
  nohup kubectl port-forward --address localhost,10.40.3.89 svc/mysql-svc 13306:3306 >> forward.out & 
  if [ $? -eq 0 ];then
    echo $! > pid
  fi
  ;;

  "stop-forward")
  exec kill $(cat pid)
  exec rm -rf pid
  ;;

  "clear-log")
  exec rm -rf forward.out
  ;;

  *)
  echo "command not fount: $command"
esac


