#!/bin/sh

/etc/init.d/telegraf start
# /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
/etc/init.d/vsftpd start
while :
do
    if [ "$(rc-status | grep vsftpd | awk {'print $3'})" != "started" ]; then
        break
    elif [ "$(rc-status | grep telegraf | awk {'print $3'})" != "started" ]; then
        break
    fi
done
