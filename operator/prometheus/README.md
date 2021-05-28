### install prometheus operator

	kubectl apply -f operator.yaml

### create service account

	kubectl apply -f rbac.yaml

### create service monitor

	kubectl apply -f service-monitor.yaml

### create prometheus rule

	kubectl apply -f rule.yaml

### create alert manager config

	kubectl apply -f alertmanager-config.yaml

### create alert manager

	kubectl apply -f alertmanager.yaml

### create prometheus server

	kubectl apply -f prometheus-server.yaml

