#!/usr/bin/env bash

# Intended for Ubuntu 13.10 (Saucy)

# Update Ubuntu
apt-get update

# Adjust timezone to be Phoenix
ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime

# Apache
echo "Bootstrap: Installing apache..."
apt-get install -y apache2 apache2-utils
echo "ServerName localhost" > "/etc/apache2/conf-available/fqdn.conf"
a2enconf fqdn
a2enmod rewrite

echo "Bootstrap: Setup /var/www to point to /vagrant ..."
rm -rf /var/www
ln -fs /vagrant /var/www

# MySQL
echo "Bootstrap: Installing mysql-client..."
apt-get install -y mysql-client

# PHP
echo "Bootstrap: Install PHP..."
apt-get install -y php5 php5-mysql libapache2-mod-php5 php5-mcrypt php5-cli php5-curl php5-intl php5-gd php-pear php5-json php5-dev
cp /vagrant/vm_provision/php.ini /etc/php5/apache2/php.ini

# Misc tools
apt-get install -y postfix
apt-get install -y memcached php5-memcached
apt-get install php5-imagick

# Apache / Virtual Host Setup
echo "Bootstrap: Install Host File..."
cp /vagrant/vm_provision/hostfile /etc/apache2/sites-available/project.conf
a2ensite project.conf

# Cleanup unneded packages
apt-get -y autoremove

# Restart Apache
echo "Bootstrap: Restarting Apache..."
service apache2 restart

#update-rc.d memcached enable