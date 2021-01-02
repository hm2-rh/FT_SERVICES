#!/bin/sh

/etc/init.d/telegraf start
grafana-server -homepath /usr/share/grafana -config /etc/grafana.ini&
# /etc/init.d/grafana start
while :
do
    # if [ "$(rc-status | grep grafana | awk {'print $3'})" != "started" ]; then
    #     break
    if [ "$(rc-status | grep telegraf | awk {'print $3'})" != "started" ]; then
        break
    fi
done