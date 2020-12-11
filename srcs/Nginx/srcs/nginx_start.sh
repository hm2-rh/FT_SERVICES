#!/bin/sh

/etc/init.d/sshd start
/usr/sbin/nginx -g "daemon off;"
sh
