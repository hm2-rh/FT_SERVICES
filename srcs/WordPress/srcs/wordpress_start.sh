#!/bin/sh

/etc/init.d/php-fpm7 start
/usr/sbin/nginx -g "daemon off;"
sh
