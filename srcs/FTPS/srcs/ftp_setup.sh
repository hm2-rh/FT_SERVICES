#!/bin/sh

apk -U upgrade
apk add vsftpd openssl openrc
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ftps.key -out /etc/ssl/certs/ftps.crt -subj "/C=/ST=/L=/O=/OU=/CN="

openrc; touch /run/openrc/softlevel
