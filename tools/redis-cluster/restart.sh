#!/bin/bash
set -ex

# 停止 redis-server
ps -ef | grep redis-server | grep -v "grep" | awk '{print $2}' | xargs kill


# 启动 redis-server
cd 7000
rm -rf appendonlydir dump.rdb nodes.conf nohup.out
nohup redis-server ./redis.conf &
cd ..


cd 7001
rm -rf appendonlydir dump.rdb nodes.conf nohup.out
nohup redis-server ./redis.conf &
cd ..

cd 7002
rm -rf appendonlydir dump.rdb nodes.conf nohup.out
nohup redis-server ./redis.conf &
cd ..


# 组成集群（复制出去外面跑）
#redis-cli -a redispw --cluster create 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 --cluster-replicas 0

