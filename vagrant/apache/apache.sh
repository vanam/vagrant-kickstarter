#!/usr/bin/env bash

echo "----- Provision: Installing apache ..."
apt-get install -y apache2

echo "----- Provision: Setup /var/www to point to /vagrant ..."
if ! [ -L "/var/www" ]; then
	rm -rf "/var/www"
	ln -fs "/vagrant" "/var/www"
fi

# Apache / Virtual Host Setup
echo "----- Provision: Install Apache configurations ..."
rm -rf /etc/apache2/sites-enabled/*
if ! [ -L "/etc/apache2/sites-available" ]; then
	if ! [ -L "/etc/apache2/sites-available/project.conf" ]; then
		ln -s "/vagrant/vagrant/apache/sites-available/project.conf" "/etc/apache2/sites-available/project.conf"
	fi
	a2ensite -q project.conf
fi

if ! [ -L "/etc/apache2/conf-available/project.conf" ]; then
	rm -f "/etc/apache2/conf-available/project.conf"
	ln -s "/vagrant/vagrant/apache/conf-available/project.conf" "/etc/apache2/conf-available/project.conf"
fi
a2enconf -q project.conf
