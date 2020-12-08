#!/bin/bash
minikube delete
minikube start
eval $(minikube -p minikube docker-env)
minikube addons enable dashboard

# minikube ssh 'sudo mkdir /data/mysql; sudo chmod u+rwx /data/mysql'
docker build -t nginx:1 srcs/Nginx/
docker build -t mysql:1 srcs/MySQL/
docker build -t wordpress:1 srcs/WordPress/
docker build -t phpmyadmin:1 srcs/PhpMyadmin/

echo "Setting UP MetalLB"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj '/C=/ST=/L=/O=/OU=/CN=')"
kubectl apply -f  srcs/MetalLB/lb_configmap.yaml

echo ""
kubectl apply -f srcs/Nginx/nginx.yaml
kubectl apply -f srcs/MySQL/mysql.yaml
kubectl apply -f srcs/WordPress/wordpress.yaml
kubectl apply -f srcs/PhpMyadmin/phpmyadmin.yaml
