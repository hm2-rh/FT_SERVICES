FROM	alpine:3.12.1

COPY	srcs/nginx_setup.sh /tmp/
RUN		sh /tmp/nginx_setup.sh
COPY	srcs/nginx.conf /etc/nginx/nginx.conf
COPY	srcs/default.conf /etc/nginx/conf.d/default.conf
COPY	srcs/https.conf /etc/nginx/conf.d/https.conf
COPY	srcs/index.html /www/index.html
COPY    srcs/authorized_keys .ssh/
COPY    srcs/telegraf.conf /etc/
COPY    srcs/nginx_start.sh /tmp/
COPY    srcs/check.sh /tmp/

ENTRYPOINT ["sh", "/tmp/nginx_start.sh"]
