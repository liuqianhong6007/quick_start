#!/bin/bash

function start()
{
	container_id=$(docker ps -a --filter "name=easyconnect" --format "{{json .ID}}")
	if [ -z  "$container_id" ];then
        	# 5901 端口是给 vnc clienttt 使用
        	# 1080 端口是 socket5 代理端口
        	# 8888 端口是 http 代理端口
        	docker run -d --name easyconnect --device /dev/net/tun --cap-add NET_ADMIN -ti -e PASSWORD=xxxx -e URLWIN=1 -v $HOME/.ecdata:/root -p 127.0.0.1:5901:5901 -p 127.0.0.1:7891:1080 -p 127.0.0.1:7890:8888 hagb/docker-easyconnect:7.6.7
 	fi
}

function stop()
{
	docker stop easyconnect
	docker rm easyconnect
}

function restart()
{
	container_id=$(docker ps -a --filter "name=easyconnect" --format "{{json .ID}}")
	if [ ! -z  "$container_id" ];then
        	stop
	fi
	start;
}

command=$1
case "$command" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		restart
		;;
	*)
		echo "command: ./easyconnect [start|stop|restart]"
esac
