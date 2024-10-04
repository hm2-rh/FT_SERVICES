FROM    alpine:3.12.1

COPY    srcs/influxdb_setup.sh /tmp/
RUN     sh /tmp/influxdb_setup.sh
COPY    srcs/telegraf.conf /etc/
COPY    srcs/influxdb_start.sh /tmp/
COPY    srcs/check.sh /tmp/

ENTRYPOINT [ "sh", "/tmp/influxdb_start.sh" ]
