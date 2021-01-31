FROM	alpine:3.12.1

VOLUME  /sys/fs/cgroup
COPY	srcs/wordpress_setup.sh /tmp/
RUN		sh /tmp/wordpress_setup.sh
COPY	srcs/nginx.conf /etc/nginx/
COPY	srcs/default.conf /etc/nginx/conf.d/
COPY	srcs/wp-config.php /www/
COPY    srcs/telegraf.conf /etc/
COPY	srcs/wordpress_start.sh /tmp
COPY    srcs/check.sh /tmp/

ENTRYPOINT ["sh", "/tmp/wordpress_start.sh"]
