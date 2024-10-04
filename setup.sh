#!/bin/bash

echo "Starting Minikube"

minikube delete
minikube --driver=virtualbox --memory=4096 --cpus=3 start
minikube addons enable dashboard
eval $(minikube -p minikube docker-env)

echo "Building images"
docker build -t nginx:1 srcs/Nginx/
docker build -t mysql:1 srcs/MySQL/
docker build -t wordpress:1 srcs/WordPress/
docker build -t phpmyadmin:1 srcs/PhpMyadmin/
docker build -t ftps:1 srcs/FTPS/
docker build -t influxdb:1 srcs/InfluxDB
docker build -t grafana:1 srcs/Grafana/

echo "Setting up Load Balancer"
minikube addons enable metallb
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f  srcs/MetalLB/lb_configmap.yaml

echo "Creating Services"
kubectl apply -f srcs/Nginx/nginx.yaml
kubectl apply -f srcs/MySQL/mysql.yaml
kubectl apply -f srcs/WordPress/wordpress.yaml
kubectl apply -f srcs/PhpMyadmin/phpmyadmin.yaml
kubectl apply -f srcs/FTPS/ftps.yaml
kubectl apply -f srcs/InfluxDB/influxdb.yaml
kubectl apply -f srcs/Grafana/grafana.yaml

ssh-keygen -R 192.168.99.95
minikube dashboard &
