#!/bin/bash

tar xvf /tmp/khanslist2.tar.gz -C /var/www/html/
service apache2 restart
service mysql restart
mysql -u root -e 'CREATE DATABASE khanslist'
mysql -u root -D khanslist < /tmp/sql.sql
mysql -u root -e "CREATE user 'root'@'127.0.0.1' IDENTIFIED BY 'passwordhere'"
mysql -u root -e "GRANT all on *.* to 'root'@'localhost' IDENTIFIED BY 'passwordhere'"
mysql -u root -e "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root'"
rm /tmp/sql.sql
rm -rf /var/www/html/khanslist/html/phpmyadmin
useradd -m ctf
gpasswd -a ctf www-data
chown :www-data /var/www/html/khanslist2/html/images
/bot.sh
tail -F /dev/null

