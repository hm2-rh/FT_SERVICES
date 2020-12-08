#!/bin/bash

kubectl delete -f srcs/Nginx/nginx.yaml
kubectl delete -f srcs/MySQL/mysql.yaml
kubectl delete -f srcs/WordPress/wordpress.yaml
kubectl delete -f srcs/PhpMyadmin/phpmyadmin.yaml

docker rmi -f nginx:1
docker rmi -f mysql:1
docker rmi -f wordpress:1
docker rmi -f phpmyadmin:1
