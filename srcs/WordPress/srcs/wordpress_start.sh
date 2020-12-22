#!/bin/sh

/etc/init.d/php-fpm7 start
/etc/init.d/telegraf start
/usr/sbin/nginx -g "daemon off;"
