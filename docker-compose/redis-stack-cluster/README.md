# 创建集群
docker exec 进入任一节点执行命令
redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002
