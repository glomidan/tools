#!/bin/sh

# Written by glomi - Danael BRAUX

echo -e "This script is written for \e[31mapt\e[0m package manager"

echo -e "\e[34m############## \e[32mINSTALL SYSTEM REQUIREMENTS \e[34m##############\e[0m"
echo "Update mirror server list..."
sudo apt update -y 1> /dev/null

echo "[   5% ] Installing web server..."
sudo apt install apache2 libapache2-mod-php -y 1> /dev/null
echo "[  15% ] Installing PHP and PHP services..."
sudo apt install php php-cgi php-mysql php-cli php-curl php-gd -y 1>/dev/null
echo "[  45% ] Installing PHP and PHP services..."
sudo apt install php-intl php-memcache php-xml php-zip php-mbstring php-json -y 1>/dev/null
echo "[  60% ] Installing tools..."
sudo apt install bzip2 wget -y 1>/dev/null 
echo "[  80% ] Installing database server..."
sudo apt install mariadb-server -y 1>/dev/null
echo "[ 100% ] Installing of services complete"

echo -e "\e[34m################### \e[32mINSTALL NEXTCLOUD \e[34m###################\e[0m"
echo "Downloading NextCloud"
cd /tmp
wget https://download.nextcloud.com/server/releases/nextcloud-22.1.1.zip
echo "Unpack files..."
exit 0
sudo unzip nextcloud-22.1.1.zip -d /var/www/html/ 1>/dev/null
cd /var/www/html
echo "Changing files's owner"
sudo chown -R www-data:www-data nextcloud


echo -e "\e[34m################### \e[32mDATABASE CREATION \e[34m###################\e[0m"
echo "Installing database system..."
sudo mysql_secure_installation
echo "Please enter the name of \e[1mdatabase\e[0m:"
read dbname
echo "Enter the \e[1muser name\e[0m:"
read usrname
echo "Enter a \e[31mstrong\e[0m password:"
read -s psswd

echo "Creation of the database..."
echo "CREATE DATABASE $dbname;
GRANT ALL ON $dbname.* TO '$usrname'@'localhost' IDENTIFIED BY "$psswd";
FLUSH PRIVILEGES;" > ./db.sql

sudo mysql -u root -p < ./db.sql
rm ./db.sql
psswd='\0'

echo -e "\e[34m################## \e[32mENDING INSTALLATION \e[34m##################\e[0m"
echo '<IfModule mod_alias.c>
Alias /cloud /var/www/html/nextcloud
</IfModule>
<Directory "/var/www/html/nextcloud">
Options Indexes FollowSymLinks
AllowOverride All
Require all granted
</Directory>' > /etc/apache2/sites-enabled/nextcloud.conf

echo '<VirtualHost *:80>
    ServerName cloud
    DocumentRoot /var/www/nextcloud
</VirtualHost>' > /etc/apache2/sites-available/cloud

clear

echo "Restart web server..."
sudo /etc/init.d/apache2.service restart
systemctl status apache2.service

echo -e "\e[34m################# \e[32mINSTALLATION COMPLETE  \e[34m################\e[0m"
echo "Installation successed, now try to connect on web interface to complete configuration."
echo -e "\e[32mEnjoy your personnal cloud ! \e[35m:)"
