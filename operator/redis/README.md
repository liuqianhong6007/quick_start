### 创建 redis operator

	kubectl apply -f operator.yaml

### 创建 persistentVolume

	kubectl apply -f persistent-volume.yaml

### 创建 redis 实例

	// 单机
	kubectl apply -f redis-standalone.yaml 
	
	// 集群
	kubectl apply -f redis-cluster.yaml
