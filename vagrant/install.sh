#!/usr/bin/env bash

echo "----- Provision: Setting Prague timezone ..."
ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime

echo "----- Provision: Add repositories ..."
add-apt-repository ppa:ondrej/php

echo "----- Provision: Re-synchronize the package index files from their sources ..."
# apt-get update

echo "----- Provision: Re-synchronize the package index files from their sources ..."
# apt-get upgrade -y

# Available configurations
bash /vagrant/vagrant/apache/apache.sh
bash /vagrant/vagrant/mysql/mysql.sh
bash /vagrant/vagrant/php/php.sh
bash /vagrant/vagrant/utils/utils.sh

# Cleanup
apt-get -y autoremove
