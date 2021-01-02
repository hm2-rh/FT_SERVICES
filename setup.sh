#!/bin/bash

echo "Starting Minikube"

minikube delete
minikube start
# minikube addons enable metrics-server
minikube addons enable dashboard
eval $(minikube -p minikube docker-env)

echo "Building images"
docker build -t nginx:1 srcs/Nginx/
docker build -t mysql:1 srcs/MySQL/
docker build -t wordpress:1 srcs/WordPress/
docker build -t phpmyadmin:1 srcs/PhpMyadmin/
docker build -t ftps:1 srcs/FTPS/
docker build -t grafana:1 srcs/Grafana/
docker build -t influxdb:1 srcs/InfluxDB

echo "Setting up Load Balancer"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f  srcs/MetalLB/lb_configmap.yaml

echo "Creating Services"
kubectl apply -f srcs/Nginx/nginx.yaml
kubectl apply -f srcs/MySQL/mysql.yaml
kubectl apply -f srcs/WordPress/wordpress.yaml
kubectl apply -f srcs/PhpMyadmin/phpmyadmin.yaml
kubectl apply -f srcs/FTPS/ftps.yaml
kubectl apply -f srcs/Grafana/grafana.yaml
kubectl apply -f srcs/InfluxDB/influxdb.yaml

sleep 10
minikube dashboard &
