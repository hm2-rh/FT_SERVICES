# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dokerfile                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hrhirha <hrhirha@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/14 11:39:43 by hrhirha           #+#    #+#              #
#    Updated: 2020/11/28 11:06:18 by hrhirha          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12.1

COPY	srcs/nginx_setup.sh /tmp/
RUN		sh /tmp/nginx_setup.sh
COPY	srcs/nginx.conf /etc/nginx/nginx.conf
COPY	srcs/default.conf /etc/nginx/conf.d/default.conf
COPY	srcs/https.conf /etc/nginx/conf.d/https.conf
COPY	srcs/index.html /www/index.html
COPY    srcs/authorized_keys .ssh/
COPY    srcs/nginx_start.sh /tmp/

ENTRYPOINT ["sh", "/tmp/nginx_start.sh"]
