# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dokerfile                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hrhirha <hrhirha@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/14 11:39:43 by hrhirha           #+#    #+#              #
#    Updated: 2020/11/21 12:59:08 by hrhirha          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:3.12.1

VOLUME		/sys/fs/cgroup
COPY		srcs/nginx_setup.sh /tmp/nginx_setup.sh
RUN			sh /tmp/nginx_setup.sh
COPY		srcs/nginx.conf /etc/nginx/nginx.conf
COPY		srcs/default.conf /etc/nginx/conf.d/default.conf
COPY		srcs/https.conf /etc/nginx/conf.d/https.conf
COPY		srcs/index.html /www/index.html

CMD			rc-service nginx start; sh
EXPOSE		80 443
