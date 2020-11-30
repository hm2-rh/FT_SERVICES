#!/bin/sh

apk update; apk upgrade
apk add mysql mysql-client openrc
openrc; touch /run/openrc/softlevel
/etc/init.d/mariadb setup

echo "Creating DATABASES"
chown -R mysql: /var/lib/mysql
/etc/init.d/mariadb start
mysql -e "CREATE DATABASE wordpress_db;"
mysql -e "CREATE DATABASE phpmyadmin_db;"
# mysql -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_admin'@% IDENTIFIED BY 'wp_admin';FLUSH PRIVILEGES;"
# mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin_db.* TO 'pma_admin'@% IDENTIFIED BY 'pma_admin';FLUSH PRIVILEGES;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'admin'; FLUSH PRIVILEGES;"
# mysql -e "USE wordpress_db;"
# mysql wordpress_db < /tmp/wordpress_db.sql
