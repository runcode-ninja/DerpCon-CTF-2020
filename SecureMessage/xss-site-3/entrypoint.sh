#!/bin/bash

#tar xvf /tmp/khanslist.tar.gz -C /var/www/html/
service apache2 restart
service mysql restart
#mysql -u root -e 'CREATE DATABASE khanslist'
mysql -u root < /tmp/sql.sql
mysql -u root -e "CREATE user 'root'@'127.0.0.1' IDENTIFIED BY 'passwordhere'"
mysql -u root -e "GRANT all on *.* to 'root'@'localhost' IDENTIFIED BY 'passwordhere'"
#mysql -u root -e "UPDATE mysql.user SET authentication_string = PASSWORD('passwordhere') WHERE user = 'root'"
mysql -u root -e "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root'"
rm /tmp/sql.sql
#rm -rf /var/www/html/khanslist/html/phpmyadmin
#useradd -m ctf
#gpasswd -a ctf www-data
/bot.sh
tail -F /dev/null

