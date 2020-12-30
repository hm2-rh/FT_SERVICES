#!/bin/sh

/etc/init.d/telegraf start
# cd /usr/share/grafana/conf; grafana-server -config /etc/grafana.ini
/ect/init.d/grafana start
while :
do
    if [ "$(rc-status | grep grafana | awk {'print $3'})" != "started" ]; then
        break
    elif [ "$(rc-status | grep telegraf | awk {'print $3'})" != "started" ]; then
        break
    fi
done