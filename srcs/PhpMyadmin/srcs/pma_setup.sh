#!/bin/sh

apk add nginx openssl openrc wget
adduser -D -g 'www' www
mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/phpmyadmin.key -out /etc/ssl/certs/phpmyadmin.crt -subj "/C=/ST=/L=/O=/OU=/CN="
apk add php7-fpm php7-curl php7-dom php7-json php7-mbstring php7-mysqli php7-openssl php7-zip php7-mcrypt php7-session php7-imagick php7-gd php7-iconv php7-xmlreader php7-xmlrpc

mkdir /run/nginx/
openrc; touch /run/openrc/softlevel
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar xzvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages/* www/
mkdir /www/tmp/
chown -R www:www /www
rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz phpMyAdmin-5.0.2-all-languages/
rm -rf /etc/nginx/nginx.conf
rm -rf /etc/nginx/conf.d/default.conf