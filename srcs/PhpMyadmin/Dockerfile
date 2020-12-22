FROM    alpine:3.12.1

VOLUME  /sys/fs/cgroup
COPY    srcs/pma_setup.sh /tmp/
RUN     sh /tmp/pma_setup.sh
COPY    srcs/nginx.conf /etc/nginx/
COPY    srcs/default.conf /etc/nginx/conf.d/
COPY    srcs/config.inc.php /www/
COPY    srcs/telegraf.conf /etc/
COPY    srcs/pma_start.sh /tmp

ENTRYPOINT ["sh", "/tmp/pma_start.sh"]