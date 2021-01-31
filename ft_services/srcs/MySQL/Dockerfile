FROM	alpine:3.12.1

COPY	srcs/wordpress_db.sql /tmp/
COPY    srcs/phpmyadmin_db.sql /tmp/
RUN     apk -U upgrade
RUN     echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN     apk add mysql mysql-client openrc telegraf
RUN     rm -rf /etc/my.cnf.d/mariadb-server.cnf
COPY    srcs/mariadb-server.cnf /etc/my.cnf.d/
COPY    srcs/telegraf.conf /etc/
COPY	srcs/mysql_start.sh /tmp/
COPY    srcs/check.sh /tmp/

ENTRYPOINT	["sh", "/tmp/mysql_start.sh"]
