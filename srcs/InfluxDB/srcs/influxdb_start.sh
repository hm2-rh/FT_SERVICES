#!/bin/sh

/etc/init.d/telegraf start
# /usr/sbin/influxd -config /etc/influxdb.conf
/etc/init.d/influxdb start
while :
do
    if [ "$(rc-status | grep influxdb | awk {'print $3'})" != "started" ]; then
        break
    elif [ "$(rc-status | grep telegraf | awk {'print $3'})" != "started" ]; then
        break
    fi
done