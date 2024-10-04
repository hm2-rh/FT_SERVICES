#!/bin/sh

openrc; touch /run/openrc/softlevel
/etc/init.d/mariadb setup

echo "Creating DATABASES"
chown -R mysql: /var/lib/mysql
/etc/init.d/mariadb start
mysql -e "CREATE DATABASE wordpress_db;"
mysql -e "CREATE DATABASE phpmyadmin_db;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin'; FLUSH PRIVILEGES;"

mysql -e "USE wordpress_db;"
mysql wordpress_db < /tmp/wordpress_db.sql
mysql phpmyadmin_db < /tmp/phpmyadmin_db.sql
/etc/init.d/mariadb stop

/etc/init.d/telegraf start
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
