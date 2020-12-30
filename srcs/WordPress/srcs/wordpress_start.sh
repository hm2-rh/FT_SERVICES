#!/bin/sh

/etc/init.d/php-fpm7 start
/etc/init.d/telegraf start
# /usr/sbin/nginx -g "daemon off;"
/etc/init.d/nginx start
while :
do
    if [ "$(rc-status | grep php-fpm7 | awk {'print $3'})" != "started" ]; then
        break
    elif [ "$(rc-status | grep telegraf | awk {'print $3'})" != "started" ]; then
        break
    elif [ "$(rc-status | grep nginx | awk {'print $3'})" != "started" ]; then
        break
    fi
done
