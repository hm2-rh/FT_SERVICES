#!/bin/bash

minikube start
eval $(minikube -p minikube docker-env)

docker build -t nginx:1 Nginx/
docker build -t mysql:1 MySQL/
docker build -t wordpress:1 WordPress/

echo "Setting UP MetalLB"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f  MetalLB/lb_configmap.yaml

echo "Creating Nginx Deployment(nginx-deploy) and Service(nginx-svc)"
kubectl apply -f Nginx/nginx.yaml
kubectl apply -f MySQL/mysql.yaml
kubectl apply -f WordPress/wordpress.yaml
