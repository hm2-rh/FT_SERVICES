FROM	alpine:3.12.1

COPY	srcs/grafana_setup.sh /tmp/
RUN		sh /tmp/grafana_setup.sh
COPY    srcs/grafana.ini /etc/
COPY    srcs/telegraf.conf /etc/
COPY    srcs/grafana.db /usr/share/grafana/data/
RUN     chmod 0640 /usr/share/grafana/data/grafana.db
COPY	srcs/grafana_start.sh /tmp/
COPY    srcs/check.sh /tmp/

ENTRYPOINT ["sh", "/tmp/grafana_start.sh"]
