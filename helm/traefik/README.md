# 安装 traefik

```
helm repo add traefik https://helm.traefik.io/traefik
helm repo update
kubectl create ns traefik
helm install --namespace=traefik traefik traefik/traefik
```

# 暴露 dashboard

```
kubectl apply -f dashboard.yaml
```

# 访问

```
# 查看暴露的端口,如果类型为 LoadBalance, 则 80 对应的端口为映射出来的端口
kubectl get svc -n traefik

curl http://traefik.localhost:{port}/dashboard/
```
