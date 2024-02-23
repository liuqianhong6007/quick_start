# 创建集群
docker exec 进入任一节点执行命令
redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002

# 注意
redis-cluster 要求使用 network mode: host，但 host 只能在 linux 下起作用
