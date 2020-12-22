# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hrhirha <hrhirha@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/27 11:41:18 by hrhirha           #+#    #+#              #
#    Updated: 2020/11/29 13:31:20 by hrhirha          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12.1

VOLUME  /sys/fs/cgroup
COPY	srcs/wordpress_setup.sh /tmp/
RUN		sh /tmp/wordpress_setup.sh
COPY	srcs/nginx.conf /etc/nginx/
COPY	srcs/default.conf /etc/nginx/conf.d/
COPY	srcs/wp-config.php /www/
COPY    srcs/telegraf.conf /etc/
COPY	srcs/wordpress_start.sh /tmp

ENTRYPOINT ["sh", "/tmp/wordpress_start.sh"]
