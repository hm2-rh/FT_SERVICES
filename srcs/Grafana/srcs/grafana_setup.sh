#!/bin/sh

echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk -U upgrade
apk add grafana openssl telegraf openrc
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/grafana.key -out /etc/ssl/certs/grafana.crt -subj "/C=/ST=/L=/O=/OU=/CN="

openrc; touch /run/openrc/softlevel
