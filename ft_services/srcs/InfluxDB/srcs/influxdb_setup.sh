#!/bin/sh

echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk -U upgrade
apk add telegraf influxdb openrc

openrc; touch /run/openrc/softlevel
