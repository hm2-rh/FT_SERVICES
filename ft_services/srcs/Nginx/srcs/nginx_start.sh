#!/bin/sh

/etc/init.d/sshd start
/etc/init.d/telegraf start
/usr/sbin/nginx -g "daemon off;"
