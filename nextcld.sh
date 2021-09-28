#!/bin/sh

echo "Update mirror list..."
sudo apt update -y 2> /dev/null

echo "Installing web server..."
sudo apt install apache2 libapach2-mod-php php php-cli php-curl php-gd php-intl php-memcache php-xml php-zip php-mbstring php-json bzip2 wget -y

echo "Downloading NextCloud"
cd /tmp
wget https://download.nextcloud.com/server/releases/nextcloud-22.1.1.zip 2> /dev/null
echo "Unpack files..."
sudo unzip nextcloud-22.1.1.zip -d /var/www/html/
cd /var/www/html
sudo chown -R www-data:www-data nextcloud
sudo mv nextcloud cloud

echo "Installing database system"
sudo apt install mariadb-server
mysql_secure_installation
mysql -u root -p

echo "Creation of database"
CREATE DATABASE nextdb;
GRANT ALL ON clouddb.* TO 'nextuser'@'localhost' IDENTIFIED BY 'nextdb';
FLUSH PRIVILEGES;

echo "Activating website"
echo "<IfModule mod_alias.c>
    Alias /owncloud /var/www/html/nextcloud
</IfModule>
<Directory "/var/www/html/nextcloud">
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>" > /etc/apache2/sites-enable/cloud.conf

if [ ! -e /etc/apache2/sites-enable/cloud.conf ]
then
    echo "Fail to create VirtualHost ! Stop"
    exit 1
fi

echo "Restart web server..."
sudo /etc/init.d/apach2.service restart 2> /dev/null
systemctl status apache2.service

echo "Installation successfull, now try to connect on web interface"
