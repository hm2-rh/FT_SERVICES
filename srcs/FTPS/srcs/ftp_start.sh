#!/bin/sh

/etc/init.d/telegraf start
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
