# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nginx_setup.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hrhirha <hrhirha@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/20 09:36:33 by hrhirha           #+#    #+#              #
#    Updated: 2020/11/25 11:50:40 by hrhirha          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk -U upgrade
apk add nginx openssl openssh openrc telegraf

openrc; touch /run/openrc/softlevel

mkdir /run/nginx/
adduser -D -g 'www' www
mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=/ST=/L=/O=/OU=/CN="
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
rm -rf /etc/nginx/conf.d/default.conf

mkdir .ssh
chown -R www:www /etc/ssh; chown -R www:www .ssh
adduser -D admin -G root
echo "admin:admin" >> admin_pass
chpasswd <admin_pass; rm admin_pass
