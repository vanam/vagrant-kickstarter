#!/usr/bin/env bash

echo "----- Provision: Setting Prague timezone ..."
ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime

echo "----- Provision: Add repositories ..."
add-apt-repository ppa:ondrej/php

echo "----- Provision: Re-synchronize the package index files from their sources ..."
apt-get update

echo "----- Provision: Install the newest versions of all packages currently installed on the system ..."
apt-get upgrade -y

# Available configurations
bash /vagrant/vagrant/apache/install.sh
bash /vagrant/vagrant/mysql/install.sh
bash /vagrant/vagrant/php/install.sh
bash /vagrant/vagrant/utils/install.sh

# Cleanup
apt-get -y autoremove
