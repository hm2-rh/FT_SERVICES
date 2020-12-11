FROM    alpine:3.12.1

COPY    srcs/ftp_setup.sh /tmp/
RUN     sh /tmp/ftp_setup.sh
COPY    srcs/vsftpd.conf /etc/vsftpd/
COPY    srcs/ftp_start.sh /tmp/

ENTRYPOINT  ["sh", "/tmp/ftp_start.sh"]