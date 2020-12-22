#!/bin/sh

/etc/init.d/telegraf start
cd /usr/share/grafana/conf; grafana-server -config /etc/grafana.ini
