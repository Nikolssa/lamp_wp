#!/bin/bash

sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'

sudo apt-get install -y mysql-server mysql-client

# fill in the blanks for root password, db name, username (local), and password
#mysql -u root -p root" -e "CREATE DATABASE wp_db;
#CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
#CREATE USER 'root'@'%' IDENTIFIED BY 'root';
#GRANT ALL PRIVILEGES ON * . * TO 'root'@'localhost';
#GRANT ALL PRIVILEGES ON * . * TO 'root'@'%';
#FLUSH PRIVILEGES;

# fill in the blanks for root password, db name, username (local), and password
mysql -u root -p"root" -e "CREATE DATABASE wp_db;
CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'%';
FLUSH PRIVILEGES;"

# change bind address to allow connections from anywhere
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# restart the sql service
sudo service mysql restart

#mysql -uroot -ppassword -e "CREATE DATABASE IF NOT EXISTS $APP_DATABASE_NAME;"
#mysql -uroot -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"
#mysql -uroot -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root';"
#mysql -uroot -ppassword -e "CREATE DATABASE wp_db;"
#mysql -uroot -ppassword -e "GRANT ALL PRIVILEGES ON wp_db.* TO root IDENTIFIED BY 'root';"

# change bind address to allow connections from anywhere
#sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf


