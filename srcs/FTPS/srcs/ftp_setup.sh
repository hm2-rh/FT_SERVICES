#!/bin/sh

echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk -U upgrade
apk add vsftpd openssl openrc telegraf
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ftps_key.pem -out /etc/ssl/certs/ftps_cert.pem -subj "/C=/ST=/L=/O=''/OU=''/CN=''"

openrc; touch /run/openrc/softlevel

adduser -D admin -G root
echo "admin:admin" | chpasswd
