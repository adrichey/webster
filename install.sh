#!/usr/bin/env bash

# This script automatically configures LAMP with MariaDB and PHP 7.0

# Install packages
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y python-software-properties software-properties-common
sudo apt-get install -y vim

# Install Apache
sudo apt-get install -y apache2

# Install PHP 7
sudo apt-get -y install php7.0 libapache2-mod-php7.0
sudo apt-get install -y php7.0-mysql php7.0-curl php7.0-json php7.0-cgi php7.0-gd php7.0-fpm php7.0-mcrypt php-imagick php7.0-bz2 php7.0-zip

# Remove MySQL if installed
sudo service mysql stop
sudo apt-get remove --purge mysql-server mysql-client mysql-common
sudo apt-get autoremove
sudo apt-get autoclean
sudo rm -rf /var/lib/mysql/
sudo rm -rf /etc/mysql/

# Install MariaDB
export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password root'
sudo apt-get install -y mariadb-server

# Set MariaDB root user password and persmissions
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Open MariaDB to be used with Sequel Pro
sudo sed -i 's|127.0.0.1|0.0.0.0|g' /etc/mysql/my.cnf

# Restart MariaDB
sudo service mysql restart

# Install Node 6 and update NPM
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install npm@latest -g

# Rewrite Apache sites
sudo sed -i 's|/var/www/html|/var/www/web|g' /etc/apache2/sites-available/000-default.conf
sudo sed -i 's|/var/www/html|/var/www/web|g' /etc/apache2/sites-available/default-ssl.conf
sudo sed -i 's|/var/www/html|/var/www/web|g' /etc/apache2/sites-enabled/default-ssl.conf

# Restart Apache
sudo service apache2 restart
